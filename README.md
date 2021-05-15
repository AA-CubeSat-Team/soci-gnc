# SOC-i GNC Flightsoftware
This repository contains the on-board GNC flight software for the SOC-i mission.

## System Requirements
The software is built using Matlab 2018b. If you plan to develop/push any code, you need to use this version of Matlab. **Do not use newer versions**, this will make it so that everybody else with 2018b cannot open the libraries.

Before doing anything with this repository, you need to read through the wiki. At a minimum, you need to read through:
- [Start here](https://github.com/AA-CubeSat-Team/soci-gnc/wiki)
- [Getting started with sim](https://github.com/AA-CubeSat-Team/soci-gnc/wiki/Getting-Started-With-the-Sim)

There are some parameters that you need to set in order to configure Simulink properly to run the sim.  

## General Team Practices:

### FSW Libraries
All code should be packaged into simulink libraries. Whenever and as much as possible, native Simulink blocks should be used to carry out basic algebraic manipulations (as opposed to user-defined Matlab blocks). This will help ensure better C code when we autocode.
  - these should be "atomic" libraries, with code reuse enabled if the library gets used more than once
- all math happens inside the libraries
  - avoid operations "just outside" the libraries (eg, don't transpose a matrix on the outside, pass it in, and transpose on the inside if needed)

### Validity Flags in FSW
- all flag types should be u/int8
- nominal operation should result in a flag value of 0
  - the flag is considered "raised" for anything non-zero
- use a different flag value for each error case
- the exception to this rule is sensor validity flags, which are booleans, and for which a 1 (true) indicates proper operation, whereas a 0 (false) indicates off-nominal operation.

### Data Types in FSW
- all data types should be clearly defined
- do not default to using doubles for everything; think about what data type is required for the job. 
  - But do use 64-bits for floating point numbers (i.e., double, not single, precision).
