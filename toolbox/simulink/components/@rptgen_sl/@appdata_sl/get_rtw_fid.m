function fid = get_rtw_fid(adSL, mdlName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    fid = -1.0;
    if not(strcmp(get_param(0.0, 'RtwLicensed'), 'on'))
        return;
    end % if
    % 12 14
    uName = getenv('USER');
    if isempty(uName)
        uName = 'rptgen_rtw';
    else
        uName = horzcat(uName, '_rptgen_rtw');
    end % if
    % 19 21
    rtwDir = fullfile(tempdir, uName);
    rtwDirFile = java.io.File(rtwDir);
    % 22 24
    if not(rtwDirFile.isDirectory)
        try
            ok = rtwDirFile.mkdirs;
        catch
            ok = false;
        end % try
        % 29 31
        if ok
            rtwDirFile.deleteOnExit;
        else
            rtwDir = tempdir;
            rtwDirFile = java.io.File(rtwDir);
        end % if
    end % if
    % 37 39
    rtwFile = fullfile(rtwDir, horzcat(mdlName, '.rtw'));
    % 39 41
    if not(any(strcmp(adSL.RtwCompiledModels, mdlName)))
        rtwFileFile = java.io.File(rtwFile);
        if rtwFileFile.exists && not(rtwFileFile.canWrite)
            rptgen.displayMessage(sprintf('Can not write RTW file "%s"', rtwFile), 2.0);
            return;
        end % if
        prevDir = pwd;
        cd(rtwDir);
        try
            rptgen.displayMessage(sprintf('Generating RTW information for model "%s"', mdlName), 4.0);
            rtwgen(mdlName);
            % 51 53
            ok = 1.0;
        catch
            ok = 0.0;
            rptgen.displayMessage(sprintf('Failed to generate RTW information for model "%s"', mdlName), 2.0);
            rptgen.displayMessage(lasterr, 5.0);
            % 57 61
            % 58 61
            % 59 61
        end % try
        cd(prevDir);
        % 62 66
        % 63 66
        % 64 66
        rcm = adSL.RtwCompiledModels;
        rcm{plus(end, 1.0)} = mdlName;
        adSL.RtwCompiledModels = rcm;
        % 68 70
        if not(ok)
            return;
        end % if
    end % if
    % 73 75
    fid = fopen(rtwFile);
