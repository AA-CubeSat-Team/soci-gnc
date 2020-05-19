#include "__cf_UnitTestDebug.h"
#include "ext_types.h"
static DataTypeInfo rtDataTypeInfoTable [ ] = { { "real_T" , 0 , 8 } , {
"real32_T" , 1 , 4 } , { "int8_T" , 2 , 1 } , { "uint8_T" , 3 , 1 } , {
"int16_T" , 4 , 2 } , { "uint16_T" , 5 , 2 } , { "int32_T" , 6 , 4 } , {
"uint32_T" , 7 , 4 } , { "boolean_T" , 8 , 1 } , { "fcn_call_T" , 9 , 0 } , {
"int_T" , 10 , 4 } , { "pointer_T" , 11 , 8 } , { "action_T" , 12 , 8 } , {
"timer_uint32_pair_T" , 13 , 8 } , { "struct_pRh2I6kb8EpGWYupLmWg4F" , 14 ,
88 } , { "struct_ty10kkX2qfxaFZ5ZM3ZHyG" , 15 , 96 } , {
"struct_E5m6pVGpMUCQICNWvvJYVD" , 16 , 56 } , {
"struct_TOo86xfEEzLUMQL1cJ6i4F" , 17 , 256 } , {
"struct_aWpGGhIuows0R6KCHlyCw" , 18 , 232 } , {
"struct_9Y7NpmKix1IG4oH8KKEfiF" , 19 , 224 } , {
"struct_Sy3TE4WEbvVfR4tJReRWfD" , 20 , 896 } , {
"struct_bAwhF0jhe8CAuqzSl58dcD" , 21 , 392 } , {
"struct_w7aMc9U4emvM2kACBtRHPE" , 22 , 1296 } , {
"struct_9OHKL3KkhSMVqS2TKD32KD" , 23 , 1056 } , {
"struct_J2UklKDOwboHskfNE7JQOD" , 24 , 72 } , {
"struct_4mAysgmjVCepNgQ3iGFExC" , 25 , 848 } , {
"struct_U12upH4rVNUTnf5woIw8YH" , 26 , 176 } , {
"struct_RVC8XrLuWshpvAM0OkFvt" , 27 , 88 } , {
"struct_lvNRa0gCEJ8LerTxVHRCcF" , 28 , 1184 } , {
"struct_z5tOVs4XZJ8tZ1LnGwJNlH" , 29 , 528 } , {
"struct_ICucPnOOJJLn3xbs96EvuF" , 30 , 1696 } , {
"struct_3DKGR4n2ovZKiw3p2jOVcH" , 31 , 5728 } } ; static uint_T
rtDataTypeSizes [ ] = { sizeof ( real_T ) , sizeof ( real32_T ) , sizeof (
int8_T ) , sizeof ( uint8_T ) , sizeof ( int16_T ) , sizeof ( uint16_T ) ,
sizeof ( int32_T ) , sizeof ( uint32_T ) , sizeof ( boolean_T ) , sizeof (
fcn_call_T ) , sizeof ( int_T ) , sizeof ( pointer_T ) , sizeof ( action_T )
, 2 * sizeof ( uint32_T ) , sizeof ( struct_pRh2I6kb8EpGWYupLmWg4F ) , sizeof
( struct_ty10kkX2qfxaFZ5ZM3ZHyG ) , sizeof ( struct_E5m6pVGpMUCQICNWvvJYVD )
, sizeof ( struct_TOo86xfEEzLUMQL1cJ6i4F ) , sizeof (
struct_aWpGGhIuows0R6KCHlyCw ) , sizeof ( struct_9Y7NpmKix1IG4oH8KKEfiF ) ,
sizeof ( struct_Sy3TE4WEbvVfR4tJReRWfD ) , sizeof (
struct_bAwhF0jhe8CAuqzSl58dcD ) , sizeof ( struct_w7aMc9U4emvM2kACBtRHPE ) ,
sizeof ( struct_9OHKL3KkhSMVqS2TKD32KD ) , sizeof (
struct_J2UklKDOwboHskfNE7JQOD ) , sizeof ( struct_4mAysgmjVCepNgQ3iGFExC ) ,
sizeof ( struct_U12upH4rVNUTnf5woIw8YH ) , sizeof (
struct_RVC8XrLuWshpvAM0OkFvt ) , sizeof ( struct_lvNRa0gCEJ8LerTxVHRCcF ) ,
sizeof ( struct_z5tOVs4XZJ8tZ1LnGwJNlH ) , sizeof (
struct_ICucPnOOJJLn3xbs96EvuF ) , sizeof ( struct_3DKGR4n2ovZKiw3p2jOVcH ) }
; static const char_T * rtDataTypeNames [ ] = { "real_T" , "real32_T" ,
"int8_T" , "uint8_T" , "int16_T" , "uint16_T" , "int32_T" , "uint32_T" ,
"boolean_T" , "fcn_call_T" , "int_T" , "pointer_T" , "action_T" ,
"timer_uint32_pair_T" , "struct_pRh2I6kb8EpGWYupLmWg4F" ,
"struct_ty10kkX2qfxaFZ5ZM3ZHyG" , "struct_E5m6pVGpMUCQICNWvvJYVD" ,
"struct_TOo86xfEEzLUMQL1cJ6i4F" , "struct_aWpGGhIuows0R6KCHlyCw" ,
"struct_9Y7NpmKix1IG4oH8KKEfiF" , "struct_Sy3TE4WEbvVfR4tJReRWfD" ,
"struct_bAwhF0jhe8CAuqzSl58dcD" , "struct_w7aMc9U4emvM2kACBtRHPE" ,
"struct_9OHKL3KkhSMVqS2TKD32KD" , "struct_J2UklKDOwboHskfNE7JQOD" ,
"struct_4mAysgmjVCepNgQ3iGFExC" , "struct_U12upH4rVNUTnf5woIw8YH" ,
"struct_RVC8XrLuWshpvAM0OkFvt" , "struct_lvNRa0gCEJ8LerTxVHRCcF" ,
"struct_z5tOVs4XZJ8tZ1LnGwJNlH" , "struct_ICucPnOOJJLn3xbs96EvuF" ,
"struct_3DKGR4n2ovZKiw3p2jOVcH" } ; static DataTypeTransition rtBTransitions
[ ] = { { ( char_T * ) ( & rtB . evb2ami2f5 ) , 0 , 0 , 173 } , { ( char_T *
) ( & rtB . p0unimm1k0 ) , 8 , 0 , 3 } , { ( char_T * ) ( & rtDW . eo2izelnsp
[ 0 ] ) , 0 , 0 , 58 } , { ( char_T * ) ( & rtDW . ckpfh3kyyy . LoggedData [
0 ] ) , 11 , 0 , 44 } , { ( char_T * ) ( & rtDW . owi0qnn13s [ 0 ] ) , 7 , 0
, 6 } , { ( char_T * ) ( & rtDW . hsldxkjyqe ) , 2 , 0 , 10 } , { ( char_T *
) ( & rtDW . gdylcuu45e ) , 8 , 0 , 2 } } ; static DataTypeTransitionTable
rtBTransTable = { 7U , rtBTransitions } ; static DataTypeTransition
rtPTransitions [ ] = { { ( char_T * ) ( & rtP . fswParams ) , 31 , 0 , 1 } ,
{ ( char_T * ) ( & rtP . Normalization2_Bias ) , 0 , 0 , 6 } , { ( char_T * )
( & rtP . CompareToConstant_const ) , 8 , 0 , 1 } , { ( char_T * ) ( & rtP .
Merge_InitialOutput ) , 0 , 0 , 175 } , { ( char_T * ) ( & rtP .
Memory_InitialCondition ) , 8 , 0 , 1 } } ; static DataTypeTransitionTable
rtPTransTable = { 5U , rtPTransitions } ;
