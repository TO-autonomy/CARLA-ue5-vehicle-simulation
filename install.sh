CARLA_DOWNLOAD_URL="https://tiny.carla.org/carla-0-10-0-linux"
CARLA_VERSION="0.10.0"
REQUIRED_PIP_VERSION="24.3.1"

set -e

echo "Installing CARLA simulator (version: $CARLA_VERSION)..."
if [ -d "src/CARLASimulator" ]; then
    echo "Directory src/CARLASimulator already exists."
else
    echo "Creating directory src/CARLASimulator..."
    mkdir -p src/CARLASimulator
    echo "Retriving CARLA simulator files..."
    curl -L $CARLA_DOWNLOAD_URL -o src/CARLASimulator/CARLA.tar.gz
    echo "Extracting CARLA simulator files..."
    tar -xvzf src/CARLASimulator/CARLA.tar.gz -C src/CARLASimulator
    rm src/CARLASimulator/CARLA.tar.gz
    # Move extracted files from versioned directory to CARLASimulator
    mv src/CARLASimulator/Carla-*/* src/CARLASimulator/
    rmdir src/CARLASimulator/Carla-*
    echo "CARLA simulator files retrieved and extracted successfully."
fi 
echo "CARLA simulator installed successfully."

echo "========================================"

CURRENT_PIP_VERSION=$(pip3 --version | awk '{print $2}')
version_greater_equal() {
    printf '%s\n%s\n' "$1" "$2" | sort -V -C
}

echo "Checking pip3 version..."
if version_greater_equal "$REQUIRED_PIP_VERSION" "$CURRENT_PIP_VERSION"; then
    echo "pip3 current version $CURRENT_PIP_VERSION, satisfies minimum required version $REQUIRED_PIP_VERSION."
    echo "pip3 version check completed successfully."
else
    echo "pip3 version $CURRENT_PIP_VERSION is older than minimum required version $REQUIRED_PIP_VERSION."
    echo "Please upgrade pip3 manually using the command: pip3 install --upgrade pip"
    exit 1
fi

echo "========================================"

echo "Installing CARLA Python library (version: $CARLA_VERSION)..."

PYTHON_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
WHEEL_FILE=$(ls src/CARLASimulator/PythonAPI/carla/dist/carla-$CARLA_VERSION-cp$PYTHON_VERSION-cp$PYTHON_VERSION-linux_x86_64.whl 2>/dev/null | head -n 1)

if [ -z "$WHEEL_FILE" ]; then
    echo "No compatible CARLA wheel file found for Python $PYTHON_VERSION in src/CARLASimulator/PythonAPI/carla/dist."
    exit 1
fi

pip3 install $WHEEL_FILE
echo "CARLA Python library installed successfully."

echo "========================================"

echo "Installing other necessary Python libraries..."
pip3 install -r requirements.txt
echo "Installation completed successfully."


echo "========================================"
