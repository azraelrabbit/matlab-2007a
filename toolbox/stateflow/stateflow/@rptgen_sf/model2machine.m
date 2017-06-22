function machineID = model2machine(mdlName)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if isa(mdlName, 'Simulink.BlockDiagram')
        machineID = find(mdlName, '-depth', 1.0, '-isa', 'Stateflow.Machine');
    else
        % 15 16
        machineID = rptgen_sf.model2machine(get_param(mdlName, 'Object'));
    end % if
end % function
