function hLib = make_gnu_tfl_new
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hLib = make_iso_tfl_new;
    hLib.matFileName = 'gnu_tfl_tmw_new.mat';
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
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'ten_u', 'double', 1.0, 'exp10', 'double', '<math.h>');
    hLib.replaceOrCreateAndRegisterFunctionEntry(100.0, 'ten_u', 'single', 1.0, 'exp10f', 'single', '<math.h>');
end % function
