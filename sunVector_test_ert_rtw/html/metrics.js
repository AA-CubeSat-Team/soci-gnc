function CodeMetrics() {
	 this.metricsArray = {};
	 this.metricsArray.var = new Array();
	 this.metricsArray.fcn = new Array();
	 this.metricsArray.var["rtInf"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	size: 8};
	 this.metricsArray.var["rtInfF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	size: 4};
	 this.metricsArray.var["rtM_"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	size: 8};
	 this.metricsArray.var["rtMinusInf"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	size: 8};
	 this.metricsArray.var["rtMinusInfF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	size: 4};
	 this.metricsArray.var["rtNaN"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	size: 8};
	 this.metricsArray.var["rtNaNF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	size: 4};
	 this.metricsArray.fcn["cos"] = {file: "C:\\Program Files\\MATLAB\\R2018b\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["fabs"] = {file: "C:\\Program Files\\MATLAB\\R2018b\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["floor"] = {file: "C:\\Program Files\\MATLAB\\R2018b\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["fmod"] = {file: "C:\\Program Files\\MATLAB\\R2018b\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["rtGetInf"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 20,
	stackTotal: 24};
	 this.metricsArray.fcn["rtGetInfF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 4,
	stackTotal: 4};
	 this.metricsArray.fcn["rtGetMinusInf"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 20,
	stackTotal: 24};
	 this.metricsArray.fcn["rtGetMinusInfF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 4,
	stackTotal: 4};
	 this.metricsArray.fcn["rtGetNaN"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 20,
	stackTotal: 24};
	 this.metricsArray.fcn["rtGetNaNF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 4,
	stackTotal: 4};
	 this.metricsArray.fcn["rtIsInf"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["rtIsInfF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["rtIsNaN"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 13,
	stackTotal: 17};
	 this.metricsArray.fcn["rtIsNaNF"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 4,
	stackTotal: 4};
	 this.metricsArray.fcn["rt_InitInfAndNaN"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 0,
	stackTotal: 24};
	 this.metricsArray.fcn["rt_remd_snf"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 16,
	stackTotal: 33};
	 this.metricsArray.fcn["sin"] = {file: "C:\\Program Files\\MATLAB\\R2018b\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["sunVector_test.c:cosd"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 17,
	stackTotal: 50};
	 this.metricsArray.fcn["sunVector_test.c:mod"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 8,
	stackTotal: 25};
	 this.metricsArray.fcn["sunVector_test.c:sind"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 17,
	stackTotal: 50};
	 this.metricsArray.fcn["sunVector_test_initialize"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 0,
	stackTotal: 24};
	 this.metricsArray.fcn["sunVector_test_step"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 32,
	stackTotal: 82};
	 this.metricsArray.fcn["trunc"] = {file: "C:\\SOCI\\soci-gnc\\sunVector_test_ert_rtw\\sunVector_test.c",
	stack: 0,
	stackTotal: 0};
	 this.getMetrics = function(token) { 
		 var data;
		 data = this.metricsArray.var[token];
		 if (!data) {
			 data = this.metricsArray.fcn[token];
			 if (data) data.type = "fcn";
		 } else { 
			 data.type = "var";
		 }
	 return data; }; 
	 this.codeMetricsSummary = '<a href="sunVector_test_metrics.html">Global Memory: 44(bytes) Maximum Stack: 32(bytes)</a>';
	}
CodeMetrics.instance = new CodeMetrics();
