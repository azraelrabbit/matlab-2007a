function SetReady(obj)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    persistent matlab_and_simulink;
    % 13 16
    % 14 16
    tb = get(obj.AllReferences, 'Toolbox');
    if iscell(tb)
        tb = vertcat(tb{:});
    end
    % 19 22
    % 20 22
    if isempty(matlab_and_simulink)
        matlab_and_simulink = vertcat(dependencies.ToolboxDetails('matlab'), dependencies.ToolboxDetails('simulink'));
        % 23 25
    end
    tb = vertcat(matlab_and_simulink, tb(:));
    % 26 29
    % 27 29
    if not(isempty(tb))
        obj.Toolboxes = unique(tb);
    end
    % 31 34
    % 32 34
    obj.Ready = true;
end
