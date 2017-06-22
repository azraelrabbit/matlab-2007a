function makeCmdOut = setup_for_watcom(args)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    makeCmd = args.makeCmd;
    modelName = args.modelName;
    verbose = args.verbose;
    compilerEnvVal = args.compilerEnvVal;
    % 19 20
    watcom = parsestrforvar(makeCmd, 'WATCOM_LOC');
    if isempty(watcom)
        specified_via_makeCmd = false;
        if isempty(compilerEnvVal)
            compilerEnvVal = parse_mexopts_for_envval('_watc.tmf');
        end % if
        if not(isempty(compilerEnvVal))
            watcom = compilerEnvVal;
        else
            watcom = getenv('WATCOM');
        end % if
    else
        specified_via_makeCmd = true;
    end % if
    % 34 35
    if not(isempty(watcom))
        if isempty(dir(horzcat(watcom, '\binnt\wmake.exe')))
            checkEnvVal = '  %WATCOM%\binnt\wmake.exe';
            issue_inv_comp_env_val_error('WATCOM', watcom, checkEnvVal, '  set WATCOM=<WatcomPath>');
            % 39 40
        end % if
        [status, result] = dos(horzcat(watcom, '\binnt\wmake /?'));
        % 42 43
        watver = '';
        addOpt = '';
        % 45 49
        % 46 49
        % 47 49
        % 48 49
        if eq(exist(args.modelName, 'file'), 4.0)
            makeRTWObj = get_param(args.modelName, 'MakeRTWSettingsObject');
            if not(specified_via_makeCmd)
                makeRTWObj.CompilerName = '_watc.tmf';
            else
                makeRTWObj.CompilerName = 'MAKCMD_watc.tmf';
            end % if
            if not(isempty(findstr(result, 'Open Watcom Make Version 1.3')))
                watver = ' WATCOM_VER=1.3';
                makeRTWObj.InstallDirmexopts = '$(MATLAB_BIN)\win32\mexopts\openwatc13opts.bat';
            else
                DAStudio.error('RTW:compilerConfig:watcomVersionError', result);
            end % if
            % 62 65
            % 63 65
            % 64 65
            if isempty(makeRTWObj.BuildInfo.InstallDirmexopts)
                makeRTWObj.BuildInfo.InstallDirmexopts = makeRTWObj.InstallDirmexopts;
            end % if
        end % if
        % 69 70
        cmdFile = horzcat('.\', modelName, '.bat');
        cmdFileFid = fopen(cmdFile, 'wt');
        if not(verbose)
            fprintf(cmdFileFid, '@echo off\n');
        end % if
        fprintf(cmdFileFid, 'set WATCOM=%s\n', watcom);
        % 76 78
        % 77 78
        fprintf(cmdFileFid, 'cd .\n');
        fprintf(cmdFileFid, '%s\n', horzcat(makeCmd, watver, addOpt));
        % 80 85
        % 81 85
        % 82 85
        % 83 85
        % 84 85
        fprintf(cmdFileFid, '@if errorlevel 1 goto error_exit\n');
        fprintf(cmdFileFid, 'exit /B 0\n');
        % 87 90
        % 88 90
        % 89 90
        fprintf(cmdFileFid, '\n:error_exit\n');
        fprintf(cmdFileFid, '%s\n', 'echo The make command returned an error of %errorlevel%');
        % 92 93
        fprintf(cmdFileFid, 'An_error_occurred_during_the_call_to_make\n');
        % 94 95
        fclose(cmdFileFid);
        makeCmdOut = cmdFile;
    else
        if isempty(getenv('WATCOM'))
            DAStudio.error('RTW:compilerConfig:envVariableUndefined', 'WATCOM', 'Watcom');
            % 100 101
        end % if
        makeCmdOut = makeCmd;
    end % if
    % 104 107
    % 105 107
    % 106 107
    errfile = horzcat(args.modelName, '.err');
    % 108 109
    if not(isempty(dir(errfile)))
        rtw_delete_file(errfile);
    end % if
end % function
