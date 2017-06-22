function view_data(path, name)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    cr = sprintf('\n');
    path = strrep(path, '__CR__', cr);
    rt = sfroot;
    m = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name', bdroot(path));
    % 10 11
    s = m.find('-isa', 'Stateflow.Data', 'Path', path, 'Name', name);
    % 12 13
    if not(isempty(s))
        s.view;
    end % if
end % function
