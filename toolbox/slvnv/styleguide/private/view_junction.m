function view_junction(system, path, a, c)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    cr = sprintf('\n');
    path = strrep(path, '__CR__', cr);
    system = strrep(system, '__CR__', cr);
    a = strrep(a, '__CR__', cr);
    open_system(a);
    rt = sfroot;
    m = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name', bdroot(system));
    % 13 14
    s = m.find('-isa', 'Stateflow.Junction', 'Path', path);
    % 15 16
    historyJ = s.find('-isa', 'Stateflow.Junction', '-and', 'Type', 'HISTORY');
    if not(isempty(historyJ))
        historyJ.view;
    end % if
end % function
