#include "UnitTestDebug_capi_host.h"
static UnitTestDebug_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        UnitTestDebug_host_InitializeDataMapInfo(&(root), "UnitTestDebug");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
