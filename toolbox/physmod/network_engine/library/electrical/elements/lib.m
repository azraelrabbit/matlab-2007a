function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Electrical Elements';
    % 8 9
    lib.element('resistor');
    lib.element('variable_resistor');
    lib.element('capacitor');
    lib.element('inductor');
    lib.element('pwl_diode');
    lib.element('op_amp');
    lib.element('ideal_transformer');
    lib.element('mutual_inductor');
    lib.element('reference_electrical');
    lib.element('controlled_switch');
    lib.element('rotational_converter');
    lib.element('translational_converter');
end % function
