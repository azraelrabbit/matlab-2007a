function makeCmdOut = setup_for_borland(args)
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
    makeCmd = args.makeCmd;
    modelName = args.modelName;
    verbose = args.verbose;
    compilerEnvVal = args.compilerEnvVal;
    specified_via_makeCmd = false;
    % 18 20
    borland = parsestrforvar(makeCmd, 'BORLAND_LOC');
    if isempty(borland)
        if isempty(compilerEnvVal)
            compilerEnvVal = parse_mexopts_for_envval('_bc.tmf');
        end % if
        if not(isempty(compilerEnvVal))
            borland = compilerEnvVal;
        else
            borland = getenv('BORLAND');
        end % if
    else
        specified_via_makeCmd = true;
    end % if
    % 32 34
    if not(isempty(borland))
        % 34 36
        if not(isempty(dir(horzcat(borland, '\cbuilder6\bin\bcc32.exe'))))
            % 36 38
            [status, result] = dos(horzcat(borland, '\cbuilder6\bin\bcc32.exe'));
        else
            if not(isempty(dir(horzcat(borland, '\bcc56\bin\bcc32.exe'))))
                [status, result] = dos(horzcat(borland, '\bcc56\bin\bcc32.exe'));
            else
                if not(isempty(dir(horzcat(borland, '\cbuilder5\bin\bcc32.exe'))))
                    [status, result] = dos(horzcat(borland, '\cbuilder5\bin\bcc32.exe'));
                else
                    if not(isempty(dir(horzcat(borland, '\bcc55\bin\bcc32.exe'))))
                        [status, result] = dos(horzcat(borland, '\bcc55\bin\bcc32.exe'));
                    else
                        cr = sprintf('\n');
                        checkEnvVal = horzcat('  %BORLAND%\cbuilder6\bin\bcc32.exe      ', '(for Borland 5.6)', cr, '  %BORLAND%\bcc56\bin\bcc32.exe          ', '(for Borland 5.6 Free Compiler)', cr, '  %BORLAND%\cbuilder5\bin\bcc32.exe      ', '(for Borland 5.5)', cr, '  %BORLAND%\bcc55\bin\bcc32.exe          ', '(for Borland 5.5 Free Compiler)');
                        % 50 58
                        % 51 58
                        % 52 58
                        % 53 58
                        % 54 58
                        % 55 58
                        % 56 58
                        issue_inv_comp_env_val_error('BORLAND', borland, checkEnvVal, '  set BORLAND=<BorlandPath>');
                        % 58 60
                    end % if
                    % 60 63
                    % 61 63
                end % if
            end % if
        end % if
        cmdFile = horzcat('.\', modelName, '.bat');
        cmdFileFid = fopen(cmdFile, 'wt');
        if not(verbose)
            fprintf(cmdFileFid, '@echo off\n');
        end % if
        bcver = '';
        if not(isempty(result))
            if not(isempty(findstr(result, 'Borland C++ 5.6')))
                if not(isempty(dir(horzcat(borland, '\cbuilder6\bin\bcc32.exe'))))
                    bcver = ' BC_VER=5.6';
                    mexopts = '$(MATLAB_BIN)\win32\mexopts\bcc56opts.bat';
                    makeCmd = strrep(makeCmd, '%BORLAND%', '%BORLAND%\cbuilder6');
                else
                    % 78 80
                    bcver = ' BC_VER=5.6free';
                    mexopts = '$(MATLAB_BIN)\win32\mexopts\bcc56freeopts.bat';
                    makeCmd = strrep(makeCmd, '%BORLAND%', '%BORLAND%\bcc56');
                end % if
            else
                if not(isempty(findstr(result, 'Borland C++ 5.5')))
                    if not(isempty(dir(horzcat(borland, '\cbuilder5\bin\bcc32.exe'))))
                        bcver = ' BC_VER=5.5';
                        mexopts = '$(MATLAB_BIN)\win32\mexopts\bcc55opts.bat';
                        makeCmd = strrep(makeCmd, '%BORLAND%', '%BORLAND%\cbuilder5');
                    else
                        bcver = ' BC_VER=5.5free';
                        mexopts = '$(MATLAB_BIN)\win32\mexopts\bcc55freeopts.bat';
                        makeCmd = strrep(makeCmd, '%BORLAND%', '%BORLAND%\bcc55');
                    end % if
                else
                    DAStudio.error('RTW:compilerConfig:borlandVersionError');
                end % if
                % 97 102
                % 98 102
                % 99 102
                % 100 102
            end % if
            if eq(exist(args.modelName, 'file'), 4.0)
                makeRTWObj = get_param(args.modelName, 'MakeRTWSettingsObject');
                if not(specified_via_makeCmd)
                    makeRTWObj.CompilerName = '_bc.tmf';
                else
                    makeRTWObj.CompilerName = 'MAKECMD_bc.tmf';
                end % if
                makeRTWObj.InstallDirmexopts = mexopts;
                % 110 113
                % 111 113
                if isempty(makeRTWObj.BuildInfo.InstallDirmexopts)
                    makeRTWObj.BuildInfo.InstallDirmexopts = makeRTWObj.InstallDirmexopts;
                    % 114 116
                end % if
            end % if
        end % if
        fprintf(cmdFileFid, 'set BORLAND=\n');
        fprintf(cmdFileFid, 'set BORLAND=%s\n', borland);
        fprintf(cmdFileFid, 'set %s\n', bcver);
        % 121 124
        % 122 124
        fprintf(cmdFileFid, 'cd .\n');
        fprintf(cmdFileFid, '%s\n', makeCmd);
        % 125 131
        % 126 131
        % 127 131
        % 128 131
        % 129 131
        fprintf(cmdFileFid, '@if errorlevel 1 goto error_exit\n');
        fprintf(cmdFileFid, 'exit /B 0\n');
        % 132 136
        % 133 136
        % 134 136
        fprintf(cmdFileFid, '\n:error_exit\n');
        fprintf(cmdFileFid, '%s\n', 'echo The make command returned an error of %errorlevel%');
        % 137 139
        fprintf(cmdFileFid, 'An_error_occurred_during_the_call_to_make\n');
        % 139 141
        fclose(cmdFileFid);
        makeCmdOut = cmdFile;
    else
        DAStudio.error('RTW:compilerConfig:envVariableUndefined', 'BORLAND', 'Borland');
        % 144 146
    end % if
