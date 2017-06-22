function modeladvisor(system, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if eq(nargin, 0.0)
        helpview(horzcat(docroot, '/mapfiles/simulink.map'), 'model_advisor');
        return;
    end % if
    % 20 22
    if strcmpi(system, 'help')
        helpview(horzcat(docroot, '/mapfiles/simulink.map'), 'model_advisor');
    else
        if ishandle(system)
            % 25 28
            % 26 28
            load_system(getfullname(system));
        else
            load_system(system);
        end % if
        % 31 33
        mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system, 'new');
        if gt(nargin, 1.0)
            % 34 36
            mdladvObj.displayReport('norefresh');
        else
            mdladvObj.displayExplorer;
        end % if
    end % if
