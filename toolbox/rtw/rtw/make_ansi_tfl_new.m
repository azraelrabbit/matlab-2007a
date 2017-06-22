function hLib = make_ansi_tfl_new
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hLib = RTW.TflTable;
    % 11 12
    hLib.matFileName = 'ansi_tfl_tmw_new.mat';
    % 13 14
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'sqrt', 'double', 'sqrt', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'floor', 'double', 'floor', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'fmod', 'double', 'fmod', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'ceil', 'double', 'ceil', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'abs', 'double', 'fabs', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'pow', 'double', 'pow', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'power', 'double', 'pow', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'exp', 'double', 'exp', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'ldexp', 'double', 'ldexp', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'ln', 'double', 'log', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'log', 'double', 'log', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'log10', 'double', 'log10', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'sin', 'double', 'sin', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'cos', 'double', 'cos', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'tan', 'double', 'tan', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'asin', 'double', 'asin', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'acos', 'double', 'acos', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'atan', 'double', 'atan', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'atan2', 'double', 'rt_atan2', 'double', 'rt_atan2.h', 'genrtatan2.tlc', 'rt_atan2');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'raw_atan2', 'double', 'atan2', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'sinh', 'double', 'sinh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'cosh', 'double', 'cosh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'tanh', 'double', 'tanh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'asinh', 'double', 'asinh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'acosh', 'double', 'acosh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'atanh', 'double', 'atanh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'double', 'rt_SGN', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'double', 'rt_SATURATE', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'double', 'rt_MIN', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'double', 'rt_MAX', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'double', 'rt_SET_RZC_SIGSTATE', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'hypot', 'double', 'rt_hypot', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 4.0, 'rt_Lookup', 'double', 'rt_Lookup', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 7.0, 'rt_Lookup2D_Normal', 'double', 'rt_Lookup2D_Normal', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 10.0, 'rt_Lookup2D_General', 'double', 'rt_Lookup2D_General', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'double', 'rt_ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    % 50 52
    % 51 52
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'sqrt', 'single', 'sqrt', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'floor', 'single', 'floor', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'fmod', 'single', 'fmod', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'ceil', 'single', 'ceil', 'double', '<math.h>', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'single', 'rt_ABS', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'pow', 'single', 'pow', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'power', 'single', 'pow', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'exp', 'single', 'exp', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'ln', 'single', 'log', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'log', 'single', 'log', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'log10', 'single', 'log10', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'sin', 'single', 'sin', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'cos', 'single', 'cos', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'tan', 'single', 'tan', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'asin', 'single', 'asin', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'acos', 'single', 'acos', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'atan', 'single', 'atan', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'atan2', 'single', 'rt_atan232', 'single', 'rt_atan2.h', 'genrtatan2.tlc', 'rt_atan2');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'raw_atan2', 'single', 'atan2', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'sinh', 'single', 'sinh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'cosh', 'single', 'cosh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'tanh', 'single', 'tanh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'asinh', 'single', 'asinh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'acosh', 'single', 'acosh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'atanh', 'single', 'atanh', 'double', '<math.h>', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'single', 'rt_FSGN', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'single', 'rt_SATURATE', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'single', 'rt_MIN', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'single', 'rt_MAX', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'single', 'rt_SET_RZC_SIGSTATE', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'hypot', 'single', 'rt_hypot32', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 4.0, 'rt_Lookup', 'single', 'rt_Lookup32', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 7.0, 'rt_Lookup2D_Normal', 'single', 'rt_Lookup2D32_Normal', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 10.0, 'rt_Lookup2D_General', 'single', 'rt_Lookup2D32_General', 'single', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'single', 'rt_ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    % 87 89
    % 88 89
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'int32', 'rt_SATURATE', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'int32', 'rt_MIN', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'int32', 'rt_MAX', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'int32', 'rt_ABS', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'int32', 'rt_SGN', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'int32', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVREM', 'int32', 'rt_DIVREM', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVQUOT', 'int32', 'rt_DIVQUOT', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'int32', 'rt_SET_IZC_SIGSTATE', 'int32', 'rtlibsrc.h', '', '');
    % 98 100
    % 99 100
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'integer', 'rt_SATURATE', 'integer', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'integer', 'rt_MIN', 'integer', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'integer', 'rt_MAX', 'integer', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'integer', 'rt_ABS', 'integer', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'integer', 'rt_SGN', 'integer', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'integer', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    % 106 108
    % 107 108
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'int16', 'rt_SATURATE', 'int16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'int16', 'rt_MIN', 'int16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'int16', 'rt_MAX', 'int16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'int16', 'rt_ABS', 'int16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'int16', 'rt_SGN', 'int16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'int16', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVREM', 'int16', 'rt_DIVREM', 'int16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVQUOT', 'int16', 'rt_DIVQUOT', 'int16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'int16', 'rt_SET_IZC_SIGSTATE', 'int16', 'rtlibsrc.h', '', '');
    % 117 119
    % 118 119
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'int8', 'rt_SATURATE', 'int8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'int8', 'rt_MIN', 'int8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'int8', 'rt_MAX', 'int8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'int8', 'rt_ABS', 'int8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'int8', 'rt_SGN', 'int8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'int8', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVREM', 'int8', 'rt_DIVREM', 'int8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVQUOT', 'int8', 'rt_DIVQUOT', 'int8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'int8', 'rt_SET_IZC_SIGSTATE', 'int8', 'rtlibsrc.h', '', '');
    % 128 130
    % 129 130
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'uint32', 'rt_SATURATE', 'uint32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'uint32', 'rt_MIN', 'uint32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'uint32', 'rt_MAX', 'uint32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'uint32', 'rt_ABS', 'uint32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'uint32', 'rt_UNSGN', 'uint32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'uint32', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVREM', 'uint32', 'rt_DIVREM', 'uint32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVQUOT', 'uint32', 'rt_DIVQUOT', 'uint32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'uint32', 'rt_SET_UZC_SIGSTATE', 'uint32', 'rtlibsrc.h', '', '');
    % 139 141
    % 140 141
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'uint16', 'rt_SATURATE', 'uint16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'uint16', 'rt_MIN', 'uint16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'uint16', 'rt_MAX', 'uint16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'uint16', 'rt_ABS', 'uint16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'uint16', 'rt_UNSGN', 'uint16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'uint16', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVREM', 'uint16', 'rt_DIVREM', 'uint16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVQUOT', 'uint16', 'rt_DIVQUOT', 'uint16', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'uint16', 'rt_SET_UZC_SIGSTATE', 'uint16', 'rtlibsrc.h', '', '');
    % 150 152
    % 151 152
    hLib.createAndRegisterMacroEntry(100.0, 3.0, 'saturate', 'uint8', 'rt_SATURATE', 'uint8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'min', 'uint8', 'rt_MIN', 'uint8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'max', 'uint8', 'rt_MAX', 'uint8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'abs', 'uint8', 'rt_ABS', 'uint8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'sign', 'uint8', 'rt_UNSGN', 'uint8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'uint8', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVREM', 'uint8', 'rt_DIVREM', 'uint8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 2.0, 'rt_DIVQUOT', 'uint8', 'rt_DIVQUOT', 'uint8', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'uint8', 'rt_SET_UZC_SIGSTATE', 'uint8', 'rtlibsrc.h', '', '');
    % 161 163
    % 162 163
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'initnonfinite', 'double', 'rt_InitInfAndNaN', 'double', 'rt_nonfinite.h', 'genrtnonfinite.tlc', 'rt_nonfinite');
    % 164 165
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'sfcnhelpers', 'double', 'SLibSfcnHelperFcns', 'double', 'rt_sfcn_helper.h', 'gensfcnhelper.tlc', 'rt_sfcn_helper');
    % 166 167
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'rtIsInf', 'double', 'rtIsInf', 'boolean', 'rt_nonfinite.h', 'genrtnonfinite.tlc', 'rt_nonfinite');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'rtIsInf', 'single', 'rtIsInfF', 'boolean', 'rt_nonfinite.h', 'genrtnonfinite.tlc', 'rt_nonfinite');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'rtIsNaN', 'double', 'rtIsNaN', 'boolean', 'rt_nonfinite.h', 'genrtnonfinite.tlc', 'rt_nonfinite');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'rtIsNaN', 'single', 'rtIsNaNF', 'boolean', 'rt_nonfinite.h', 'genrtnonfinite.tlc', 'rt_nonfinite');
    hLib.createAndRegisterFunctionEntry(100.0, 1.0, 'utAssert', 'boolean', 'utAssert', 'boolean', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'memcpy', 'pointer', 'memcpy', 'pointer', '<string.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'memset', 'pointer', 'memset', 'pointer', '<string.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'memcmp', 'pointer', 'memcmp', 'pointer', '<string.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 2.0, 'strcpy', 'pointer', 'strcpy', 'pointer', '<string.h>', '', '');
    hLib.createAndRegisterFunctionEntry(100.0, 3.0, 'rt_zcFcn', 'boolean', 'rt_I32ZCFcn', 'int32', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterMacroEntry(100.0, 1.0, 'rt_SET_ZC_SIGSTATE', 'boolean', 'rt_SET_BZC_SIGSTATE', 'boolean', 'rtlibsrc.h', '', '');
    % 178 183
    % 179 183
    % 180 183
    % 181 183
    % 182 183
    hLib.createAndRegisterConstantEntry(100.0, 'RT_PI', 'double', 'RT_PI', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'RT_E', 'double', 'RT_E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'RT_LOG10E', 'double', 'RT_LOG10E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'RT_LN_10', 'double', 'RT_LN_10', 'double', 'rtlibsrc.h', '', '');
    % 187 188
    hLib.createAndRegisterConstantEntry(100.0, 'PI', 'double', 'RT_PI', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'E', 'double', 'RT_E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'LOG10E', 'double', 'RT_LOG10E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'LN_10', 'double', 'RT_LN_10', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'EPS', 'double', 'DBL_EPSILON', 'double', '<float.h>', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'EPSILON', 'double', 'DBL_EPSILON', 'double', '<float.h>', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'MAX_VAL', 'double', 'DBL_MAX', 'double', '<float.h>', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'MIN_VAL', 'double', 'DBL_MIN', 'double', '<float.h>', '', '');
    % 196 198
    % 197 198
    hLib.createAndRegisterConstantEntry(100.0, 'RT_PI', 'single', 'RT_PI', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'RT_E', 'single', 'RT_E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'RT_LOG10E', 'single', 'RT_LOG10E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'RT_LN_10', 'single', 'RT_LN_10', 'double', 'rtlibsrc.h', '', '');
    % 202 203
    hLib.createAndRegisterConstantEntry(100.0, 'PI', 'single', 'RT_PI', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'E', 'single', 'RT_E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'LOG10E', 'single', 'RT_LOG10E', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'LN_10', 'single', 'RT_LN_10', 'double', 'rtlibsrc.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'EPS', 'single', 'FLT_EPSILON', 'single', '<float.h>', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'EPSILON', 'single', 'FLT_EPSILON', 'single', '<float.h>', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'MAX_VAL', 'single', 'FLT_MAX', 'single', '<float.h>', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'MIN_VAL', 'single', 'FLT_MIN', 'single', '<float.h>', '', '');
    % 211 213
    % 212 213
    hLib.createAndRegisterConstantEntry(100.0, 'rtInf', 'double', 'rtInf', 'double', 'rt_nonfinite.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'rtInf', 'single', 'rtInfF', 'single', 'rt_nonfinite.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'rtMinusInf', 'double', 'rtMinusInf', 'double', 'rt_nonfinite.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'rtMinusInf', 'single', 'rtMinusInfF', 'single', 'rt_nonfinite.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'rtNaN', 'double', 'rtNaN', 'double', 'rt_nonfinite.h', '', '');
    hLib.createAndRegisterConstantEntry(100.0, 'rtNaN', 'single', 'rtNaNF', 'single', 'rt_nonfinite.h', '', '');
end % function
