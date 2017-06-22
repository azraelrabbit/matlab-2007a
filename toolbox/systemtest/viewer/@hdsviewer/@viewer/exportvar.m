function exportvar(h, varname)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ~(isempty(evalin('base', horzcat('who(''', varname, ''');'))))
        msg = sprintf('The MATLAB variable %s already exists in the workspace. Do you want to overwrite?', varname);
        % 8 10
        ButtonName = questdlg(msg, 'Test Results Viewer', 'OK', 'Cancel', 'Cancel');
        % 10 13
        % 11 13
        if strcmp(ButtonName, 'Cancel')
            return
        end
    end
    if any(strcmp(varname, fieldnames(h.FilterCtrl.DataSet.testvector)))
        assignin('base', varname, h.FilterCtrl.DataSet.testvector.(varname));
    else
        assignin('base', varname, h.FilterCtrl.gethdsdata(varname));
    end
end
