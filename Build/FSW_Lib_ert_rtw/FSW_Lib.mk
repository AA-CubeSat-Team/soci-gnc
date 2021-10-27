###########################################################################
## Makefile generated for Simulink model 'FSW_Lib'. 
## 
## Makefile     : FSW_Lib.mk
## Generated on : Tue Oct 26 16:30:14 2021
## MATLAB Coder version: 4.1 (R2018b)
## 
## Build Info:
## 
## Final product: $(RELATIVE_PATH_TO_ANCHOR)/FSW_Lib.exe
## Product type : executable
## Build type   : Top-Level Standalone Executable
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# COMPUTER                Computer type. See the MATLAB "computer" command.
# COMPILER_COMMAND_FILE   Compiler command listing model reference header paths
# CMD_FILE                Command file
# SHARED_OBJS             Shared Object Names

PRODUCT_NAME              = FSW_Lib
MAKEFILE                  = FSW_Lib.mk
COMPUTER                  = PCWIN64
MATLAB_ROOT               = C:/PROGRA~1/MATLAB/R2018b
MATLAB_BIN                = C:/PROGRA~1/MATLAB/R2018b/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/win64
MASTER_ANCHOR_DIR         = 
START_DIR                 = C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Build
ARCH                      = win64
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = None
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0
RELATIVE_PATH_TO_ANCHOR   = ..
COMPILER_COMMAND_FILE     = FSW_Lib_comp.rsp
CMD_FILE                  = FSW_Lib.rsp
C_STANDARD_OPTS           = -ansi -pedantic -Wno-long-long -fwrapv
CPP_STANDARD_OPTS         = -std=c++98 -pedantic -Wno-long-long -fwrapv
SHARED_SRC_DIR            = ../slprj/ert/_sharedutils
SHARED_SRC                = $(SHARED_SRC_DIR)/*.c
SHARED_BIN_DIR            = ../slprj/ert/_sharedutils
SHARED_LIB                = $(SHARED_BIN_DIR)/rtwshared.lib
SHARED_OBJS               =  \
$(addprefix $(join $(SHARED_BIN_DIR),/), $(addsuffix .obj, $(basename $(notdir $(wildcard $(SHARED_SRC_DIR)/*.c)))))

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          MinGW64 | gmake (64-bit Windows)
# Supported Version(s):    5.x
# ToolchainInfo Version:   R2018b
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# C_STANDARD_OPTS
# CPP_STANDARD_OPTS
# MINGW_ROOT
# MINGW_C_STANDARD_OPTS

#-----------
# MACROS
#-----------

WARN_FLAGS            = -Wall -W -Wwrite-strings -Winline -Wstrict-prototypes -Wnested-externs -Wpointer-arith -Wcast-align
WARN_FLAGS_MAX        = $(WARN_FLAGS) -Wcast-qual -Wshadow
CPP_WARN_FLAGS        = -Wall -W -Wwrite-strings -Winline -Wpointer-arith -Wcast-align
CPP_WARN_FLAGS_MAX    = $(CPP_WARN_FLAGS) -Wcast-qual -Wshadow
MEX_OPTS_FILE         = $(MATLAB_ROOT)/bin/win64/mexopts/mingw64.xml
MEX_CPP_OPTS_FILE     = $(MATLAB_ROOT)/bin/win64/mexopts/mingw64_g++.xml
MW_EXTERNLIB_DIR      = $(MATLAB_ROOT)/extern/lib/win64/mingw64
SHELL                 = %SystemRoot%/system32/cmd.exe

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lws2_32

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: GNU C Compiler
CC_PATH = $(MINGW_ROOT)
CC = "$(CC_PATH)/gcc"

# Linker: GNU Linker
LD_PATH = $(MINGW_ROOT)
LD = "$(LD_PATH)/g++"

# C++ Compiler: GNU C++ Compiler
CPP_PATH = $(MINGW_ROOT)
CPP = "$(CPP_PATH)/g++"

# C++ Linker: GNU C++ Linker
CPP_LD_PATH = $(MINGW_ROOT)
CPP_LD = "$(CPP_LD_PATH)/g++"

# Archiver: GNU Archiver
AR_PATH = $(MINGW_ROOT)
AR = "$(AR_PATH)/ar"

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_BIN)/win64
MEX = "$(MEX_PATH)/mex"

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%/bin/win64
MAKE = "$(MAKE_PATH)/gmake"


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @del
ECHO                = @echo
MV                  = @move
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

ARFLAGS              = ruvs
CFLAGS               = -c $(MINGW_C_STANDARD_OPTS) -m64 \
                       -O0
CPPFLAGS             = -c $(CPP_STANDARD_OPTS) -m64 \
                       -O0
CPP_LDFLAGS          = -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)" -static -m64
CPP_SHAREDLIB_LDFLAGS  = -shared -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)" -Wl,--no-undefined \
                         -Wl,--out-implib,$(basename $(PRODUCT))$(STATICLIB_EXT)
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)" -static -m64
MEX_CPPFLAGS         = -R2018a -MATLAB_ARCH=$(ARCH) $(INCLUDES) \
                         \
                       CXXOPTIMFLAGS="$(MINGW_C_STANDARD_OPTS)  \
                       -O0 \
                        $(DEFINES)" \
                         \
                       -silent
MEX_CPPLDFLAGS       = LDFLAGS=='$$LDFLAGS'
MEX_CFLAGS           = -R2018a -MATLAB_ARCH=$(ARCH) $(INCLUDES) \
                         \
                       COPTIMFLAGS="$(MINGW_C_STANDARD_OPTS)  \
                       -O0 \
                        $(DEFINES)" \
                         \
                       -silent
MEX_LDFLAGS          = LDFLAGS=='$$LDFLAGS'
MAKE_FLAGS           = -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    = -shared -Wl,-rpath,"$(MATLAB_ARCH_BIN)",-L"$(MATLAB_ARCH_BIN)" -Wl,--no-undefined \
                       -Wl,--out-implib,$(basename $(PRODUCT))$(STATICLIB_EXT)

#--------------------
# File extensions
#--------------------

H_EXT               = .h
OBJ_EXT             = .obj
C_EXT               = .c
EXE_EXT             = .exe
SHAREDLIB_EXT       = .dll
HPP_EXT             = .hpp
OBJ_EXT             = .obj
CPP_EXT             = .cpp
EXE_EXT             = .exe
SHAREDLIB_EXT       = .dll
STATICLIB_EXT       = .lib
MEX_EXT             = .mexw64
MAKE_EXT            = .mk


###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = $(RELATIVE_PATH_TO_ANCHOR)/FSW_Lib.exe
PRODUCT_TYPE = "executable"
BUILD_TYPE = "Top-Level Standalone Executable"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR) -I$(START_DIR)/FSW_Lib_ert_rtw -IC:/Users/Nick's PC/Documents/GitHub/soci-gnc/Src/Users/Nick's PC/documents/github/soci-gnc/Lib/FSW/soar/include/ecos/include -IC:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Src -IC:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src -I$(MATLAB_ROOT)/extern/include -I$(MATLAB_ROOT)/simulink/include -I$(MATLAB_ROOT)/rtw/c/src -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common -I$(MATLAB_ROOT)/rtw/c/ert -I$(MATLAB_ROOT)/toolbox/dsp/include -I$(MATLAB_ROOT)/toolbox/dsp/extern/src/export/include/src -I$(MATLAB_ROOT)/toolbox/dsp/extern/src/export/include -I$(MATLAB_ROOT)/toolbox/shared/dsp/vision/matlab/include -I$(START_DIR)/slprj/ert/_sharedutils

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_BUILD_ARGS = -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DTERMFCN=0 -DONESTEPFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=0 -DINTEGER_CODE=0 -DMT=1
DEFINES_IMPLIED = -DTID01EQ=0
DEFINES_STANDARD = -DMODEL=FSW_Lib -DNUMST=2 -DNCSTATES=0 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0

DEFINES = $(DEFINES_BUILD_ARGS) $(DEFINES_IMPLIED) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(START_DIR)/FSW_Lib_ert_rtw/CrossProdMatrix_lib.c $(START_DIR)/FSW_Lib_ert_rtw/FSW_Lib.c $(START_DIR)/FSW_Lib_ert_rtw/FSW_Lib_data.c $(START_DIR)/FSW_Lib_ert_rtw/L_inf_allocation_lib.c $(START_DIR)/FSW_Lib_ert_rtw/MEKF_lib.c $(START_DIR)/FSW_Lib_ert_rtw/PD_Controller_Lib.c $(START_DIR)/FSW_Lib_ert_rtw/TRIADActivation_lib.c $(START_DIR)/FSW_Lib_ert_rtw/asmController_lib.c $(START_DIR)/FSW_Lib_ert_rtw/maggyroProcessing_lib.c $(START_DIR)/FSW_Lib_ert_rtw/mode_select_lib.c $(START_DIR)/FSW_Lib_ert_rtw/parallel_protection_lib.c $(START_DIR)/FSW_Lib_ert_rtw/quat_err_lib.c $(START_DIR)/FSW_Lib_ert_rtw/quat_rectify_lib.c $(START_DIR)/FSW_Lib_ert_rtw/rt_sys_MEKF_lib_37.c $(START_DIR)/FSW_Lib_ert_rtw/rt_sys_MEKF_lib_41.c $(START_DIR)/FSW_Lib_ert_rtw/rt_sys_MEKF_lib_48.c $(START_DIR)/FSW_Lib_ert_rtw/rwa_allocation_lib.c $(START_DIR)/FSW_Lib_ert_rtw/sunSeek_lib.c $(START_DIR)/FSW_Lib_ert_rtw/target_generation_lib.c $(START_DIR)/FSW_Lib_ert_rtw/target_groundpass_lib.c $(START_DIR)/FSW_Lib_ert_rtw/twonorm.c expcone.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/amd_1.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/amd_2.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/amd_aat.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_CO~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_DE~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/amd_dump.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_GL~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/amd_info.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_OR~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_PO~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_PO~2.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_PR~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/AMD_VA~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/cone.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/ctrlc.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/ecos.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/equil.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/kkt.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/ldl.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/MATLAB~1.C C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/preproc.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/runecos.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/spla.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/splamm.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/timer.c C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/WRIGHT~1.C

MAIN_SRC = $(START_DIR)/FSW_Lib_ert_rtw/ert_main.c

ALL_SRCS = $(SRCS) $(MAIN_SRC)

###########################################################################
## OBJECTS
###########################################################################

OBJS = CrossProdMatrix_lib.obj FSW_Lib.obj FSW_Lib_data.obj L_inf_allocation_lib.obj MEKF_lib.obj PD_Controller_Lib.obj TRIADActivation_lib.obj asmController_lib.obj maggyroProcessing_lib.obj mode_select_lib.obj parallel_protection_lib.obj quat_err_lib.obj quat_rectify_lib.obj rt_sys_MEKF_lib_37.obj rt_sys_MEKF_lib_41.obj rt_sys_MEKF_lib_48.obj rwa_allocation_lib.obj sunSeek_lib.obj target_generation_lib.obj target_groundpass_lib.obj twonorm.obj expcone.obj amd_1.obj amd_2.obj amd_aat.obj amd_control.obj amd_defaults.obj amd_dump.obj amd_global.obj amd_info.obj amd_order.obj amd_post_tree.obj amd_postorder.obj amd_preprocess.obj amd_valid.obj cone.obj ctrlc.obj ecos.obj equil.obj kkt.obj ldl.obj matlab_main.obj preproc.obj runecos.obj spla.obj splamm.obj timer.obj wright_omega.obj

MAIN_OBJ = ert_main.obj

ALL_OBJS = $(OBJS) $(MAIN_OBJ)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = $(SHARED_LIB)

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_BASIC = $(DEFINES) $(INCLUDES) @$(COMPILER_COMMAND_FILE)

CFLAGS += $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES) @$(COMPILER_COMMAND_FILE)

CPPFLAGS += $(CPPFLAGS_BASIC)

#---------------------
# MEX C++ Compiler
#---------------------

MEX_CPP_Compiler_BASIC =  @$(COMPILER_COMMAND_FILE)

MEX_CPPFLAGS += $(MEX_CPP_Compiler_BASIC)

#-----------------
# MEX Compiler
#-----------------

MEX_Compiler_BASIC =  @$(COMPILER_COMMAND_FILE)

MEX_CFLAGS += $(MEX_Compiler_BASIC)

###########################################################################
## INLINED COMMANDS
###########################################################################


ifdef SIM_TARGET_BUILD
MINGW_C_STANDARD_OPTS = $(filter-out -ansi, $(C_STANDARD_OPTS))
else
MINGW_C_STANDARD_OPTS = $(C_STANDARD_OPTS)
endif


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build buildobj clean info prebuild download execute


all : build
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


buildobj : prebuild $(OBJS) $(PREBUILT_OBJS) $(LIBS)
	@echo "### Successfully generated all binary outputs."


prebuild : 


download : build


execute : download
	@echo "### Invoking postbuild tool "Execute" ..."
	$(EXECUTE) $(EXECUTE_FLAGS)
	@echo "### Done invoking postbuild tool."


###########################################################################
## FINAL TARGET
###########################################################################

#-------------------------------------------
# Create a standalone executable            
#-------------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS) $(LIBS) $(MAIN_OBJ)
	@echo "### Creating standalone executable "$(PRODUCT)" ..."
	$(LD) $(LDFLAGS) -o $(PRODUCT) @$(CMD_FILE) $(LIBS) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.obj : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.obj : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.obj : C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.obj : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.obj : $(START_DIR)/FSW_Lib_ert_rtw/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : $(START_DIR)/FSW_Lib_ert_rtw/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.obj : C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : C:/Users/NICK'S~1/DOCUME~1/GitHub/soci-gnc/Lib/FSW/soar/include/ecos/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.obj : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.obj : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.obj : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


$(SHARED_BIN_DIR)/%.obj : $(SHARED_SRC_DIR)/%.c
	@echo "### Compiling "$<" ..."
	$(CC) $(CFLAGS) -o "$@" "$<"


#---------------------------
# SHARED UTILITY LIBRARY
#---------------------------

$(SHARED_LIB) : $(SHARED_OBJS)
	@echo "### Creating shared utilities library "$(SHARED_LIB)" ..."
	$(AR) $(ARFLAGS)  $(SHARED_LIB) @../slprj/ert/_sharedutils/rtwshared_archiver.rsp
	@echo "### Created: $(SHARED_LIB)"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files..."
	$(RM) $(subst /,\,$(PRODUCT))
	$(RM) $(subst /,\,$(ALL_OBJS))
	$(ECHO) "### Deleted all derived files."


