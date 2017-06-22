function makeInfo = rtwmakecfg
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    rootpath = fileparts(mfilename('fullpath'));
    % 12 14
    % 13 14
    makeInfo.includePath{1.0} = fullfile(matlabroot, 'toolbox', 'rtw', 'targets', 'common', 'can', 'datatypes');
    % 15 18
    % 16 18
    % 17 18
    makeInfo.includePath{2.0} = fullfile(matlabroot, 'toolbox', 'rtw', 'targets', 'common', 'can', 'blocks', 'tlc_c');
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    makeInfo.sourcePath{1.0} = fullfile(matlabroot, 'toolbox', 'rtw', 'targets', 'common', 'can', 'blocks', 'tlc_c');
    % 24 26
    % 25 26
    if vector_code_generation(bdroot)
        % 27 29
        % 28 29
        makeInfo.includePath{2.0} = fullfile(rootpath, 'mex', 'vector');
        % 30 32
        % 31 32
        makeInfo.precompile = 1.0;
        % 33 34
        makeInfo.library(1.0).Name = 'vector_can_library_standalone';
        makeInfo.library(1.0).Location = rootpath;
        % 36 38
        % 37 38
        makeInfo.library(1.0).Modules = {'dummy'};
    end % if
end % function
