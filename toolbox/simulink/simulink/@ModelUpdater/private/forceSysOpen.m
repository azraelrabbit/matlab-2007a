function forceSysOpen(h)
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
    if isempty(find_system('SearchDepth', 0.0, 'Name', h.MyModel))
        if eq(exist(h.MyModel, 'file'), 4.0)
            w = warning;
            warning('off');
            open_system(h.MyModel);
            warning(w);
        else
            DAStudio.error('Simulink:utility:slupdateCannotFindModel', h.MyModel);
        end % if
    end % if
    % 25 28
    % 26 28
    % 27 28
    h.IsLibrary = strcmp(get_param(h.MyModel, 'BlockDiagramType'), 'library');
    if h.IsLibrary
        set_param(h.MyModel, 'Lock', 'off');
    end % if
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    h.CloseSimulink = isempty(find_system(0.0, 'SearchDepth', 1.0, 'Name', 'simulink'));
    if h.CloseSimulink
        load_system('simulink');
    end % if
    % 42 43
end % function
