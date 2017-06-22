function makeCmdOut = setup_for_lcc(args)
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
    % 18 21
    % 19 21
    % 20 21
    specified_via_makeCmd = false;
    lcc_root = parsestrforvar(makeCmd, 'LCC_LOC');
    if isempty(lcc_root)
        lcc_root = horzcat(matlabroot, '\sys\lcc');
    else
        specified_via_makeCmd = true;
    end % if
    % 28 29
    if not(isempty(lcc_root))
        if isempty(dir(horzcat(lcc_root, '\bin\lcc.exe')))
            DAStudio.error('RTW:compilerConfig:compilerNotFound', 'LCC', lcc_root, 'LCC');
            % 32 33
        end % if
        % 34 38
        % 35 38
        % 36 38
        % 37 38
        if eq(exist(modelName, 'file'), 4.0)
            makeRTWObj = get_param(args.modelName, 'MakeRTWSettingsObject');
            makeRTWObj.InstallDirmexopts = '$(MATLAB_BIN)\win32\mexopts\lccopts.bat';
            % 41 43
            % 42 43
            if isempty(makeRTWObj.BuildInfo.InstallDirmexopts)
                makeRTWObj.BuildInfo.InstallDirmexopts = makeRTWObj.InstallDirmexopts;
                % 45 46
            end % if
            if not(specified_via_makeCmd)
                makeRTWObj.CompilerName = '_lcc.tmf';
            else
                makeRTWObj.CompilerName = 'MAKECMD_lcc.tmf';
            end % if
        end % if
        % 53 54
        cmdFile = horzcat('.\', modelName, '.bat');
        cmdFileFid = fopen(cmdFile, 'wt');
        if not(verbose)
            fprintf(cmdFileFid, '@echo off\n');
        end % if
        fprintf(cmdFileFid, 'set MATLAB=%s\n', matlabroot);
        fprintf(cmdFileFid, '%s\n', makeCmd);
        fclose(cmdFileFid);
        makeCmdOut = cmdFile;
    else
        if isempty(lcc_root)
            DAStudio.error('RTW:compilerConfig:compilerNotFound', 'LCC', lcc_root, 'LCC');
            % 66 67
        end % if
        makeCmdOut = makeCmd;
    end % if
end % function
