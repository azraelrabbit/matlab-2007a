function obj = privateloadcmodel
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if ispc && eq(libisloaded('cmodel'), true)
        obj = SBCompiler.compiler;
        return;
    end % if
    % 18 19
    if isunix && eq(libisloaded('libmwcmodel'), true)
        obj = SBCompiler.compiler;
        return;
    end % if
    % 23 25
    % 24 25
    libname = fullfile(matlabroot, 'toolbox', 'simbio', 'bin');
    % 26 27
    if isunix
        libname = horzcat(libname, filesep, lower(computer), filesep, 'libmwcmodel.so');
    else
        libname = horzcat(libname, filesep, 'win32', filesep, 'cmodel.dll');
    end % if
    % 32 34
    % 33 34
    hname = fullfile(matlabroot, 'toolbox', 'simbio', 'src', 'include', 'cmodel.h');
    % 35 37
    % 36 37
    warnState = warning('off');
    % 38 40
    % 39 40
    loadlibrary(libname, hname);
    % 41 43
    % 42 43
    warning(warnState);
    % 44 46
    % 45 46
    obj = SBCompiler.compiler;
end % function
