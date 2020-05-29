int_T main(int_T argc, const char *argv[])
	{
	  /* Unused arguments */
	  (void)(argc);
	  (void)(argv);

	  /* Initialize model */
	  sgp4_lib_fsw0_initialize();

	  rt_OneStep();


	  //Printf(Output 1:\n);
	  //for k = 1:length of vec1 {
	  	//printf(vec1(k))
	  //}
	  //Printf(Output 1:\n);
	  //for k = 1:length of vec2 {
	  	//printf(vec2(k))
	  //}	  
	  //Printf();


	}