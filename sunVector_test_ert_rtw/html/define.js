function CodeDefine() { 
this.def = new Array();
this.def["rt_OneStep"] = {file: "ert_main_c.html",line:39,type:"fcn"};this.def["main"] = {file: "ert_main_c.html",line:76,type:"fcn"};this.def["rtM_"] = {file: "sunVector_test_c.html",line:26,type:"var"};this.def["rtM"] = {file: "sunVector_test_c.html",line:27,type:"var"};this.def["BigEndianIEEEDouble"] = {file: "sunVector_test_c.html",line:52,type:"type"};this.def["LittleEndianIEEEDouble"] = {file: "sunVector_test_c.html",line:59,type:"type"};this.def["IEEESingle"] = {file: "sunVector_test_c.html",line:66,type:"type"};this.def["rtInf"] = {file: "sunVector_test_c.html",line:68,type:"var"};this.def["rtMinusInf"] = {file: "sunVector_test_c.html",line:69,type:"var"};this.def["rtNaN"] = {file: "sunVector_test_c.html",line:70,type:"var"};this.def["rtInfF"] = {file: "sunVector_test_c.html",line:71,type:"var"};this.def["rtMinusInfF"] = {file: "sunVector_test_c.html",line:72,type:"var"};this.def["rtNaNF"] = {file: "sunVector_test_c.html",line:73,type:"var"};this.def["rtGetNaN"] = {file: "sunVector_test_c.html",line:83,type:"fcn"};this.def["rtGetNaNF"] = {file: "sunVector_test_c.html",line:107,type:"fcn"};this.def["rt_InitInfAndNaN"] = {file: "sunVector_test_c.html",line:119,type:"fcn"};this.def["rtIsInf"] = {file: "sunVector_test_c.html",line:131,type:"fcn"};this.def["rtIsInfF"] = {file: "sunVector_test_c.html",line:137,type:"fcn"};this.def["rtIsNaN"] = {file: "sunVector_test_c.html",line:143,type:"fcn"};this.def["rtIsNaNF"] = {file: "sunVector_test_c.html",line:165,type:"fcn"};this.def["rtGetInf"] = {file: "sunVector_test_c.html",line:177,type:"fcn"};this.def["rtGetInfF"] = {file: "sunVector_test_c.html",line:201,type:"fcn"};this.def["rtGetMinusInf"] = {file: "sunVector_test_c.html",line:212,type:"fcn"};this.def["rtGetMinusInfF"] = {file: "sunVector_test_c.html",line:236,type:"fcn"};this.def["mod"] = {file: "sunVector_test_c.html",line:244,type:"fcn"};this.def["rt_remd_snf"] = {file: "sunVector_test_c.html",line:267,type:"fcn"};this.def["sind"] = {file: "sunVector_test_c.html",line:288,type:"fcn"};this.def["cosd"] = {file: "sunVector_test_c.html",line:350,type:"fcn"};this.def["sunVector_test_step"] = {file: "sunVector_test_c.html",line:410,type:"fcn"};this.def["sunVector_test_initialize"] = {file: "sunVector_test_c.html",line:442,type:"fcn"};this.def["RT_MODEL"] = {file: "sunVector_test_h.html",line:42,type:"type"};this.def["int8_T"] = {file: "rtwtypes_h.html",line:53,type:"type"};this.def["uint8_T"] = {file: "rtwtypes_h.html",line:54,type:"type"};this.def["int16_T"] = {file: "rtwtypes_h.html",line:55,type:"type"};this.def["uint16_T"] = {file: "rtwtypes_h.html",line:56,type:"type"};this.def["int32_T"] = {file: "rtwtypes_h.html",line:57,type:"type"};this.def["uint32_T"] = {file: "rtwtypes_h.html",line:58,type:"type"};this.def["int64_T"] = {file: "rtwtypes_h.html",line:59,type:"type"};this.def["uint64_T"] = {file: "rtwtypes_h.html",line:60,type:"type"};this.def["real32_T"] = {file: "rtwtypes_h.html",line:61,type:"type"};this.def["real64_T"] = {file: "rtwtypes_h.html",line:62,type:"type"};this.def["real_T"] = {file: "rtwtypes_h.html",line:68,type:"type"};this.def["time_T"] = {file: "rtwtypes_h.html",line:69,type:"type"};this.def["boolean_T"] = {file: "rtwtypes_h.html",line:70,type:"type"};this.def["int_T"] = {file: "rtwtypes_h.html",line:71,type:"type"};this.def["uint_T"] = {file: "rtwtypes_h.html",line:72,type:"type"};this.def["ulong_T"] = {file: "rtwtypes_h.html",line:73,type:"type"};this.def["ulonglong_T"] = {file: "rtwtypes_h.html",line:74,type:"type"};this.def["char_T"] = {file: "rtwtypes_h.html",line:75,type:"type"};this.def["uchar_T"] = {file: "rtwtypes_h.html",line:76,type:"type"};this.def["byte_T"] = {file: "rtwtypes_h.html",line:77,type:"type"};this.def["pointer_T"] = {file: "rtwtypes_h.html",line:98,type:"type"};}
CodeDefine.instance = new CodeDefine();
var testHarnessInfo = {OwnerFileName: "", HarnessOwner: "", HarnessName: "", IsTestHarness: "0"};
var relPathToBuildDir = "../ert_main.c";
var fileSep = "\\";
var isPC = true;
function Html2SrcLink() {
	this.html2SrcPath = new Array;
	this.html2Root = new Array;
	this.html2SrcPath["ert_main_c.html"] = "../ert_main.c";
	this.html2Root["ert_main_c.html"] = "ert_main_c.html";
	this.html2SrcPath["sunVector_test_c.html"] = "../sunVector_test.c";
	this.html2Root["sunVector_test_c.html"] = "sunVector_test_c.html";
	this.html2SrcPath["sunVector_test_h.html"] = "../sunVector_test.h";
	this.html2Root["sunVector_test_h.html"] = "sunVector_test_h.html";
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
"ert_main_c.html","sunVector_test_c.html","sunVector_test_h.html","rtwtypes_h.html"];
