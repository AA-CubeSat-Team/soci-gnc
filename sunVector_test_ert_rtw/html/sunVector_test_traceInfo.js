function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "sunVector_test"};
	this.sidHashMap["sunVector_test"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>"] = {sid: "sunVector_test:1"};
	this.sidHashMap["sunVector_test:1"] = {rtwname: "<S1>"};
	this.rtwnameHashMap["<S2>"] = {sid: "sunVector_test:1:9"};
	this.sidHashMap["sunVector_test:1:9"] = {rtwname: "<S2>"};
	this.rtwnameHashMap["<Root>/Constant"] = {sid: "sunVector_test:25"};
	this.sidHashMap["sunVector_test:25"] = {rtwname: "<Root>/Constant"};
	this.rtwnameHashMap["<Root>/To File"] = {sid: "sunVector_test:26"};
	this.sidHashMap["sunVector_test:26"] = {rtwname: "<Root>/To File"};
	this.rtwnameHashMap["<Root>/sunVector_lib"] = {sid: "sunVector_test:1"};
	this.sidHashMap["sunVector_test:1"] = {rtwname: "<Root>/sunVector_lib"};
	this.rtwnameHashMap["<S1>/ut1"] = {sid: "sunVector_test:1:5"};
	this.sidHashMap["sunVector_test:1:5"] = {rtwname: "<S1>/ut1"};
	this.rtwnameHashMap["<S1>/MATLAB Function"] = {sid: "sunVector_test:1:9"};
	this.sidHashMap["sunVector_test:1:9"] = {rtwname: "<S1>/MATLAB Function"};
	this.rtwnameHashMap["<S1>/r_earth2sun"] = {sid: "sunVector_test:1:6"};
	this.sidHashMap["sunVector_test:1:6"] = {rtwname: "<S1>/r_earth2sun"};
	this.rtwnameHashMap["<S2>:1"] = {sid: "sunVector_test:1:9:1"};
	this.sidHashMap["sunVector_test:1:9:1"] = {rtwname: "<S2>:1"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
