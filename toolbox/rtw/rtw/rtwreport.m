function rtwreport(varargin)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if gt(nargin, 2.0) || lt(nargin, 1.0)
        DAStudio.error('RTW:utility:invalidArgCount', 'rtwreport', '1-2');
    end % if
    % 28 29
    model = varargin{1.0};
    open_system(model);
    % 31 32
    orgDir = pwd;
    if gt(nargin, 1.0)
        buildDir = varargin{2.0};
        if not(exist(buildDir, 'dir'))
            DAStudio.error('RTW:utility:invalidPath', buildDir);
        end % if
        cd(buildDir);
        buildDir = pwd;
        cd('..');
        ret = rtwprivate('rtwrptgen', 'checkdir', buildDir);
        if ne(ret, 0.0)
            cd(orgDir);
            DAStudio.error('RTW:utility:buildDirNotFound', buildDir, model);
        end % if
    else
        ret = rtwprivate('rtwrptgen', 'checkdir', '');
        if ne(ret, 0.0)
            % 49 50
            dirtyFlag = get_param(model, 'dirty');
            oldOpt = get_param(model, 'LaunchReport');
            set_param(model, 'LaunchReport', 'off');
            try
                rtwbuild(model);
            catch
                set_param(model, 'LaunchReport', oldOpt);
                set_param(model, 'dirty', dirtyFlag);
                rethrow(lasterror);
            end % try
            % 60 61
            set_param(model, 'LaunchReport', oldOpt);
            set_param(model, 'dirty', dirtyFlag);
        end % if
    end % if
    % 65 66
    rtwprivate('rtwrptgen', 'generate');
    cd(orgDir);
end % function
