function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Local Hydraulic Resistances';
    % 8 9
    lib.element('local_resistance');
    lib.element('sudden_area_change');
    lib.element('gradual_area_change');
    lib.element('pipe_bend');
    lib.element('elbow');
    lib.element('t_junction');
    % 15 16
end % function
