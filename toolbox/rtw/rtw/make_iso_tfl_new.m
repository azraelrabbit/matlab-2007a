function hLib = make_iso_tfl_new
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hLib = make_ansi_tfl_new;
    hLib.matFileName = 'iso_tfl_tmw_new.mat';
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'fix', 'double', 1.0, 'trunc', 'double', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'rem', 'double', 2.0, 'fmod', 'double', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'min', 'double', 2.0, 'fmin', 'double', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'max', 'double', 2.0, 'fmax', 'double', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'hypot', 'double', 2.0, 'hypot', 'double', '<math.h>');
    % 27 30
    % 28 30
    % 29 30
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'sqrt', 'single', 1.0, 'sqrtf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'floor', 'single', 1.0, 'floorf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'fmod', 'single', 2.0, 'fmodf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'ceil', 'single', 1.0, 'ceilf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'round', 'single', 1.0, 'roundf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'fix', 'single', 1.0, 'truncf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'abs', 'single', 1.0, 'fabsf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'pow', 'single', 2.0, 'powf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'power', 'single', 2.0, 'powf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'exp', 'single', 1.0, 'expf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'ln', 'single', 1.0, 'logf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'log', 'single', 1.0, 'logf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'log10', 'single', 1.0, 'log10f', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'rem', 'single', 2.0, 'fmodf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'min', 'single', 2.0, 'fminf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'max', 'single', 2.0, 'fmaxf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'hypot', 'single', 2.0, 'hypotf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'sin', 'single', 1.0, 'sinf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'cos', 'single', 1.0, 'cosf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'tan', 'single', 1.0, 'tanf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'asin', 'single', 1.0, 'asinf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'acos', 'single', 1.0, 'acosf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'atan', 'single', 1.0, 'atanf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'atan2', 'single', 2.0, 'atan2f', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'raw_atan2', 'single', 2.0, 'atan2f', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'sinh', 'single', 1.0, 'sinhf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'cosh', 'single', 1.0, 'coshf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'tanh', 'single', 1.0, 'tanhf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'asinh', 'single', 1.0, 'asinhf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'acosh', 'single', 1.0, 'acoshf', 'single', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'atanh', 'single', 1.0, 'atanhf', 'single', '<math.h>');
end % function
