# soci-gnc
Development of the on-board GNC software for the SOC-i mission.

##General Team Pracitces:

### FSW Libraries
- all code should be packaged into simulink libraries
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
  - But do use 64-bits for floating point numbers (ie double, not single, precision).
