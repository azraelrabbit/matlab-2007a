function PrepareBuildArgs(h, tlcArgs, gensettings, rtwVerbose)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isfield(gensettings, 'BuildDirSuffix')
        h.StartDirToRestore = pwd;
        rtwprivate('rtwattic', 'setStartDir', h.StartDirToRestore);
        rtwprivate('rtwattic', 'setBuildDir', h.BuildDirectory);
        if rtwVerbose
            if h.MdlRefBuildArgs.CheckCodeDonotRebuild
                msg = horzcat('### Checking the status of code in build directory: ', h.BuildDirectory);
                % 15 16
                feval(h.DispHook{:}, msg);
            else
                msg = horzcat('### Generating code into build directory: ', h.BuildDirectory);
                feval(h.DispHook{:}, msg);
            end % if
        end % if
    else
        DAStudio.error('RTW:makertw:buildDirSuffixUnavailable');
    end % if
    % 25 27
    % 26 27
    rtwBuildArgs = get_param(h.ModelHandle, 'RTWBuildArgs');
    % 28 30
    % 29 30
    configset = getActiveConfigSet(h.ModelHandle);
    build_args = getStringRepresentation(configset, 'make_options');
    if not(isempty(rtwBuildArgs))
        % 33 34
    end % if
    % 35 36
    set_param(h.ModelHandle, 'RTWBuildArgs', build_args);
    % 37 39
    % 38 39
    GetRTWRoot(h, rtwVerbose);
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    LocGetTMF(h, h.ModelHandle, h.RTWRoot);
end % function
