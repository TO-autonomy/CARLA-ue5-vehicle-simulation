## CARLA vehicle simulation (CARLA v0.10.0)

This guide provides instructions for setting up and running a vehicle simulation in the CARLA simulator to generate synthetic sensor data. The simulation software records sensor information for six cameras and a LiDAR sensor. The sensors are positioned to mimic NuScenes dataset sensor setup. 

## System Requirements

The CARLA simulation requires server level GPU with requirements exceeding RTX4090 VRAM (> 24 GB) capacity. Recommended System Specification is 

### Recommended System Specification
- **Operating System:** Ubuntu 22.04.5 LTS
- **Architecture:** 64-bit
- **Processor:** TODO 
- **RAM:** TODO
- **Python Version:** 3.10
- **GPU:** NVIDIA RTX A6000 48GB
- **Storage:** SSD with at least 20 GB of free space

## Installation

Clone the CARLA vehicle simulation repository and install the necessary dependencies, including a  compiled version of the CARLA simulator (version 0.9.15):

```bash
git clone https://github.com/TO-autonomy/CARLA-vehicle-simulation.git
cd CARLA-vehicle-simulation
sh install.sh
```

## Running the Simulation

To start the vehicle simulation, execute the following command:

```bash
sh run_simulation.sh
```
The script should start the CARLA simulator (if it is installed properly using the install script above) and start the data collection process.

During the simulation run, sensor readings are stored in the following directory:
```
.../CARLA-vehicle-simulation/src/generated_data
```

## Enabling Data Post-Processing

Simulation data post-processing is disabled by default. To enable it:
1. Open the `run_simulation.sh` script in a text editor.
2. Uncomment the relevant lines at the end of the file to activate post-processing.

When data post-processing is enabled, the raw simulation data is processed and exported into a dataset structure. 

