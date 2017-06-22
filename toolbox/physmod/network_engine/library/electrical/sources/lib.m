function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Electrical Sources';
    % 8 9
    lib.element('ac_voltage_source');
    lib.element('ac_current_source');
    lib.element('dc_voltage_source');
    lib.element('dc_current_source');
    lib.element('controlled_voltage_source');
    lib.element('controlled_current_source');
    lib.element('vcvs');
    lib.element('vccs');
    lib.element('ccvs');
    lib.element('cccs');
    % 19 20
end % function
