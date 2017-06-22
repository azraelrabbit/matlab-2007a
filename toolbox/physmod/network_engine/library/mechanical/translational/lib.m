function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Translational Elements';
    % 8 9
    lib.element('damper_transl');
    lib.element('friction_transl');
    lib.element('hardstop_transl');
    lib.domain('translational');
    lib.element('spring_transl');
    lib.element('mass');
    lib.element('reference_transl');
    % 16 17
end % function
