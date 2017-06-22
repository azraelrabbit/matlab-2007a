function oString = setup_for_visual_x64(args)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if isfield(args, 'EnvVarSuggestions')
        % 19 20
        oString = 'Make sure the VS80COMNTOOLS environment variable\nwas set when Visual Studio 2005 was installed';
        % 21 23
        % 22 23
        return;
    else
        % 25 26
        oString = LocWriteBatFile(args.makeCmd, args.modelName, args.verbose);
        % 27 28
    end % if
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    if eq(exist(args.modelName, 'file'), 4.0)
        makeRTWObj = get_param(args.modelName, 'MakeRTWSettingsObject');
        makeRTWObj.InstallDirmexopts = '"$(MATLAB_BIN)\win64\mexopts\msvc80opts.bat"';
        % 36 39
        % 37 39
        % 38 39
        if isempty(makeRTWObj.BuildInfo.InstallDirmexopts)
            makeRTWObj.BuildInfo.InstallDirmexopts = makeRTWObj.InstallDirmexopts;
            % 41 42
        end % if
        makeRTWObj.CompilerName = '_vcx64.tmf';
    end % if
end % function
function makeCmdOut = LocWriteBatFile(makeCmd, modelName, verbose)
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    cmdFile = horzcat('.\', modelName, '.bat');
    cmdFileFid = fopen(cmdFile, 'wt');
    if not(verbose)
        fprintf(cmdFileFid, '@echo off\n');
    end % if
    fprintf(cmdFileFid, '%s\n', 'call "%VS80COMNTOOLS%/../../VC/vcvarsall" AMD64');
    % 57 60
    % 58 60
    % 59 60
    fprintf(cmdFileFid, '\ncd .\n');
    fprintf(cmdFileFid, '%s\n', makeCmd);
    % 62 77
    % 63 77
    % 64 77
    % 65 77
    % 66 77
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    fprintf(cmdFileFid, '@if errorlevel 1 goto error_exit\n');
    fprintf(cmdFileFid, 'exit /B 0\n');
    % 79 82
    % 80 82
    % 81 82
    fprintf(cmdFileFid, '\n:error_exit\n');
    fprintf(cmdFileFid, '%s\n', 'echo The make command returned an error of %errorlevel%');
    % 84 85
    fprintf(cmdFileFid, 'An_error_occurred_during_the_call_to_make\n');
    % 86 87
    fclose(cmdFileFid);
    makeCmdOut = cmdFile;
end % function
