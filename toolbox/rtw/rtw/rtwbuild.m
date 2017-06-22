function rtwbuild(sys, varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if lt(nargin, 1.0)
        DAStudio.error('RTW:buildProcess:incorrectUsage');
    end % if
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    buildMode = 'Normal';
    if gt(nargin, 1.0)
        if not(strcmpi(varargin{1.0}, 'mode')) || ne(nargin, 3.0)
            % 32 33
            DAStudio.error('RTW:buildProcess:incorrectUsageInvProp');
        end % if
        % 35 36
        buildMode = varargin{2.0};
        if not(strcmpi(buildMode, 'normal')) && not(strcmpi(buildMode, 'ExportFunctionCalls'))
            % 38 39
            DAStudio.error('RTW:buildProcess:incorrectUsageInvProp');
        end % if
    end % if
    % 42 43
    root = get_param(0.0, 'Object');
    if root.isValidSlObject(sys)
        sysType = get_param(sys, 'Type');
    else
        sysType = 'unknown';
    end % if
    mdlHdl = [];
    err = 0.0;
    isSubsysBuild = false;
    % 52 53
    if strcmp(sysType, 'block') && strcmp(get_param(sys, 'BlockType'), 'SubSystem')
        % 54 56
        % 55 56
        isSubsysBuild = true;
        blkH = get_param(sys, 'Handle');
        % 58 59
        if strcmpi(buildMode, 'ExportFunctionCalls')
            if ecoderinstalled(bdroot(sys))
                % 61 62
                load_system('simulink');
                load_system('expfcnlib');
                [mdlHdl, strPorts, err] = rtwprivate('ss2mdl', blkH, 1.0);
            else
                DAStudio.error('RTW:buildProcess:invalidSubsystemBuild');
            end % if
        else
            [mdlHdl, strPorts, err] = rtwprivate('ss2mdl', blkH);
            if eq(err, 0.0) && not(isempty(mdlHdl))
                flag = rtwprivate('needFunctionControl', blkH, mdlHdl);
                if flag
                    fcnprotoConf = get_param(blkH, 'SSRTWFcnClass');
                    if not(isempty(fcnprotoConf))
                        set_param(mdlHdl, 'RTWFcnClass', fcnprotoConf);
                    end % if
                end % if
            end % if
        end % if
        if eq(err, 0.0) && not(isempty(mdlHdl))
            sys = get_param(mdlHdl, 'Name');
            set_param(0.0, 'CurrentSystem', sys);
            if not(rtwbuildutils('HasTargetVariableStepSolverSupport', mdlHdl))
                rtwbuildutils('SetSolverToFixStepSolver', mdlHdl);
            end % if
        else
            err = 1.0;
        end % if
    end % if
    % 90 91
    if eq(err, 0.0)
        try
            slbuild(sys, 'StandaloneRTWTarget', 'OkayToPushNags', false);
        catch
            err = 1.0;
        end % try
    end % if
    % 98 99
    if not(isempty(mdlHdl)) && ne(mdlHdl, -1.0)
        % 100 104
        % 101 104
        % 102 104
        % 103 104
        rtwattic('setNewModelName', sys);
        close_system(mdlHdl, 0.0);
    end % if
    if err
        lastErr = lasterror;
        if isSubsysBuild
            lastErr.message = regexprep(lastErr.message, strcat('[^/]', sys, '/[^/]+'), getfullname(blkH));
            % 111 113
            % 112 113
        end % if
        rethrow(lastErr);
    end % if
end % function
