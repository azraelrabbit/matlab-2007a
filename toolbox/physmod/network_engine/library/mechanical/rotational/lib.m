function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Rotational Elements';
    % 8 9
    lib.element('damper_rot');
    lib.element('hardstop_rot');
    lib.element('inertia');
    lib.domain('rotational');
    lib.element('spring_rot');
    lib.element('friction_rot');
    lib.element('reference_rot');
    % 16 17
end % function
