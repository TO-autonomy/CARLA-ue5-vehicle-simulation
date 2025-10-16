## CARLA vehicle simulation (CARLA v0.10.0)

This guide provides instructions for setting up and running a vehicle simulation in the CARLA simulator to generate synthetic sensor data. The simulation software records sensor information for six cameras and a LiDAR sensor. The sensors are positioned to mimic NuScenes dataset sensor setup. 

## System Requirements

The simulations were performed on a high-end data processing server. Lower system requirements could work in a limited capacity, but are known to cause stability issues (eg. crashing the simulator due to VRAM issues). 

**NB! The system was developed for Ubuntu 20.04 and Ubuntu 22.04 versions. Windows or other OS systems are expected to cause issues during setup or simulation.**

**NB2! Running the default simulation scenario requires a server-grade GPU with requirements exceeding RTX4090 VRAM (> 24 GB) capacity.**

### Tested System Specification
- **Operating System:** Ubuntu 22.04.5 LTS
- **Architecture:** 64-bit
- **Processor:** Intel(R) Xeon(R) Gold 6426Y 
- **RAM:** > 126 GB 
- **Python Version:** 3.10
- **GPU:** NVIDIA RTX A6000 48GB
- **Storage:** SSD with at least 20 GB of free space


## Installation

Clone the CARLA vehicle simulation repository:

```bash
git clone https://github.com/TO-autonomy/CARLA-ue5-vehicle-simulation.git
cd CARLA-vehicle-simulation
```

Install dependencies (including the precompiled **CARLA v0.10.0** simulator):

```bash
sh install.sh
```

---

## Running the Simulation

Start the default simulation scenario:

```bash
sh run_simulation.sh
```

This command will:
- Launch the CARLA simulator  
- Run the default data collection scenario  

Sensor data will be saved in:

```
.../CARLA-ue5-vehicle-simulation/generated_data
```

---

## Creating a Custom Simulation

### Plan-based Simulation

To create a custom simulation plan, run:

```bash
sh make_simulation.sh custom_scenario.toml
```

This will open the simulation planner, where you can define scenario parameters. Your configuration will be saved to `custom_scenario.toml`.  
Then, start the simulation with:

```bash
sh run_simulation.sh custom_scenario.toml
```

The simulation will use your custom configuration and generate sensor data for that scenario.

### Recording-based Simulation

To create a simulation based on a recorded driving path, run:

```bash
sh make_simulation.sh recording.rec
```

This launches the simulation recorder, allowing you to control an ego vehicle and record the entire simulation scenario (all actors and events will be saved to `recording.rec`). 
Then, run the recording with:

```bash
sh run_simulation.sh recording.rec
```

The system will replay your recording and generate sensor data for that scenario.

---

## Enabling Data Post-Processing

Data post-processing is **disabled by default**.  
To enable it:

1. Open `run_simulation.sh` in a text editor.  
2. Uncomment the post-processing lines at the end of the script.

When enabled, raw simulation data is processed and exported into a structured dataset format.

---

## Enabling Data Visualization

Data visualization is **disabled by default**.  
To enable it:

1. Open `run_simulation.sh` in a text editor.  
2. Uncomment the visualization lines at the end of the script.

With visualization enabled, the outputs from the **front cameras** and **LiDAR** are rendered and saved in the specified target folder.

---









