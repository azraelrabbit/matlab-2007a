function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Hydraulic Elements';
    % 8 9
    lib.element('chamber_const');
    lib.element('chamber_vrb');
    lib.element('converter_transl');
    lib.element('fluid_inertia');
    lib.element('hydraulic_res_linear');
    lib.element('resistive_tube');
    lib.element('hydro_reference');
    lib.element('converter_rot');
    lib.element('orifice_vrb_area');
    lib.element('orifice_cnst_area');
end % function
