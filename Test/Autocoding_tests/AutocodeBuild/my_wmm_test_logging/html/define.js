function CodeDefine() { 
this.def = new Array();
this.def["rt_OneStep"] = {file: "ert_main_c.html",line:37,type:"fcn"};this.def["main"] = {file: "ert_main_c.html",line:74,type:"fcn"};this.def["my_wmm_test_M_"] = {file: "my_wmm_test_c.html",line:24,type:"var"};this.def["my_wmm_test_M"] = {file: "my_wmm_test_c.html",line:25,type:"var"};this.def["my_wmm_test_factorial"] = {file: "my_wmm_test_c.html",line:31,type:"fcn"};this.def["my_wmm_test_step"] = {file: "my_wmm_test_c.html",line:101,type:"fcn"};this.def["my_wmm_test_initialize"] = {file: "my_wmm_test_c.html",line:152,type:"fcn"};this.def["my_wmm_test_terminate"] = {file: "my_wmm_test_c.html",line:164,type:"fcn"};this.def["RT_MODEL_my_wmm_test_T"] = {file: "my_wmm_test_types_h.html",line:24,type:"type"};this.def["rtGetInf"] = {file: "rtGetInf_c.html",line:31,type:"fcn"};this.def["rtGetInfF"] = {file: "rtGetInf_c.html",line:55,type:"fcn"};this.def["rtGetMinusInf"] = {file: "rtGetInf_c.html",line:66,type:"fcn"};this.def["rtGetMinusInfF"] = {file: "rtGetInf_c.html",line:90,type:"fcn"};this.def["rtGetNaN"] = {file: "rtGetNaN_c.html",line:31,type:"fcn"};this.def["rtGetNaNF"] = {file: "rtGetNaN_c.html",line:55,type:"fcn"};this.def["rtInf"] = {file: "rt_nonfinite_c.html",line:30,type:"var"};this.def["rtMinusInf"] = {file: "rt_nonfinite_c.html",line:31,type:"var"};this.def["rtNaN"] = {file: "rt_nonfinite_c.html",line:32,type:"var"};this.def["rtInfF"] = {file: "rt_nonfinite_c.html",line:33,type:"var"};this.def["rtMinusInfF"] = {file: "rt_nonfinite_c.html",line:34,type:"var"};this.def["rtNaNF"] = {file: "rt_nonfinite_c.html",line:35,type:"var"};this.def["rt_InitInfAndNaN"] = {file: "rt_nonfinite_c.html",line:41,type:"fcn"};this.def["rtIsInf"] = {file: "rt_nonfinite_c.html",line:53,type:"fcn"};this.def["rtIsInfF"] = {file: "rt_nonfinite_c.html",line:59,type:"fcn"};this.def["rtIsNaN"] = {file: "rt_nonfinite_c.html",line:65,type:"fcn"};this.def["rtIsNaNF"] = {file: "rt_nonfinite_c.html",line:87,type:"fcn"};this.def["BigEndianIEEEDouble"] = {file: "rt_nonfinite_h.html",line:41,type:"type"};this.def["LittleEndianIEEEDouble"] = {file: "rt_nonfinite_h.html",line:48,type:"type"};this.def["IEEESingle"] = {file: "rt_nonfinite_h.html",line:55,type:"type"};this.def["int8_T"] = {file: "rtwtypes_h.html",line:51,type:"type"};this.def["uint8_T"] = {file: "rtwtypes_h.html",line:52,type:"type"};this.def["int16_T"] = {file: "rtwtypes_h.html",line:53,type:"type"};this.def["uint16_T"] = {file: "rtwtypes_h.html",line:54,type:"type"};this.def["int32_T"] = {file: "rtwtypes_h.html",line:55,type:"type"};this.def["uint32_T"] = {file: "rtwtypes_h.html",line:56,type:"type"};this.def["real32_T"] = {file: "rtwtypes_h.html",line:57,type:"type"};this.def["real64_T"] = {file: "rtwtypes_h.html",line:58,type:"type"};this.def["real_T"] = {file: "rtwtypes_h.html",line:64,type:"type"};this.def["time_T"] = {file: "rtwtypes_h.html",line:65,type:"type"};this.def["boolean_T"] = {file: "rtwtypes_h.html",line:66,type:"type"};this.def["int_T"] = {file: "rtwtypes_h.html",line:67,type:"type"};this.def["uint_T"] = {file: "rtwtypes_h.html",line:68,type:"type"};this.def["ulong_T"] = {file: "rtwtypes_h.html",line:69,type:"type"};this.def["char_T"] = {file: "rtwtypes_h.html",line:70,type:"type"};this.def["uchar_T"] = {file: "rtwtypes_h.html",line:71,type:"type"};this.def["byte_T"] = {file: "rtwtypes_h.html",line:72,type:"type"};this.def["creal32_T"] = {file: "rtwtypes_h.html",line:82,type:"type"};this.def["creal64_T"] = {file: "rtwtypes_h.html",line:87,type:"type"};this.def["creal_T"] = {file: "rtwtypes_h.html",line:92,type:"type"};this.def["cint8_T"] = {file: "rtwtypes_h.html",line:99,type:"type"};this.def["cuint8_T"] = {file: "rtwtypes_h.html",line:106,type:"type"};this.def["cint16_T"] = {file: "rtwtypes_h.html",line:113,type:"type"};this.def["cuint16_T"] = {file: "rtwtypes_h.html",line:120,type:"type"};this.def["cint32_T"] = {file: "rtwtypes_h.html",line:127,type:"type"};this.def["cuint32_T"] = {file: "rtwtypes_h.html",line:134,type:"type"};this.def["pointer_T"] = {file: "rtwtypes_h.html",line:152,type:"type"};}
CodeDefine.instance = new CodeDefine();
var testHarnessInfo = {OwnerFileName: "", HarnessOwner: "", HarnessName: "", IsTestHarness: "0"};
var relPathToBuildDir = "../ert_main.c";
var fileSep = "/";
var isPC = false;
function Html2SrcLink() {
	this.html2SrcPath = new Array;
	this.html2Root = new Array;
	this.html2SrcPath["ert_main_c.html"] = "../ert_main.c";
	this.html2Root["ert_main_c.html"] = "ert_main_c.html";
	this.html2SrcPath["my_wmm_test_c.html"] = "../my_wmm_test.c";
	this.html2Root["my_wmm_test_c.html"] = "my_wmm_test_c.html";
	this.html2SrcPath["my_wmm_test_h.html"] = "../my_wmm_test.h";
	this.html2Root["my_wmm_test_h.html"] = "my_wmm_test_h.html";
	this.html2SrcPath["my_wmm_test_private_h.html"] = "../my_wmm_test_private.h";
	this.html2Root["my_wmm_test_private_h.html"] = "my_wmm_test_private_h.html";
	this.html2SrcPath["my_wmm_test_types_h.html"] = "../my_wmm_test_types.h";
	this.html2Root["my_wmm_test_types_h.html"] = "my_wmm_test_types_h.html";
	this.html2SrcPath["rtGetInf_c.html"] = "../rtGetInf.c";
	this.html2Root["rtGetInf_c.html"] = "rtGetInf_c.html";
	this.html2SrcPath["rtGetInf_h.html"] = "../rtGetInf.h";
	this.html2Root["rtGetInf_h.html"] = "rtGetInf_h.html";
	this.html2SrcPath["rtGetNaN_c.html"] = "../rtGetNaN.c";
	this.html2Root["rtGetNaN_c.html"] = "rtGetNaN_c.html";
	this.html2SrcPath["rtGetNaN_h.html"] = "../rtGetNaN.h";
	this.html2Root["rtGetNaN_h.html"] = "rtGetNaN_h.html";
	this.html2SrcPath["rt_nonfinite_c.html"] = "../rt_nonfinite.c";
	this.html2Root["rt_nonfinite_c.html"] = "rt_nonfinite_c.html";
	this.html2SrcPath["rt_nonfinite_h.html"] = "../rt_nonfinite.h";
	this.html2Root["rt_nonfinite_h.html"] = "rt_nonfinite_h.html";
	this.html2SrcPath["rtwtypes_h.html"] = "../rtwtypes.h";
	this.html2Root["rtwtypes_h.html"] = "rtwtypes_h.html";
	this.getLink2Src = function (htmlFileName) {
		 if (this.html2SrcPath[htmlFileName])
			 return this.html2SrcPath[htmlFileName];
		 else
			 return null;
	}
	this.getLinkFromRoot = function (htmlFileName) {
		 if (this.html2Root[htmlFileName])
			 return this.html2Root[htmlFileName];
		 else
			 return null;
	}
}
Html2SrcLink.instance = new Html2SrcLink();
var fileList = [
"ert_main_c.html","my_wmm_test_c.html","my_wmm_test_h.html","my_wmm_test_private_h.html","my_wmm_test_types_h.html","rtGetInf_c.html","rtGetInf_h.html","rtGetNaN_c.html","rtGetNaN_h.html","rt_nonfinite_c.html","rt_nonfinite_h.html","rtwtypes_h.html"];
