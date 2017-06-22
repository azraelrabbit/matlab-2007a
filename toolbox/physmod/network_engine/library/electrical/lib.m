function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Electrical';
    % 8 9
    lib.domain('electrical');
    lib.element('branch');
    lib.element('electricalsource');
    lib.element('dependent_electricalsource');
    lib.library('elements');
    lib.library('sources');
    lib.library('sensors');
end % function
