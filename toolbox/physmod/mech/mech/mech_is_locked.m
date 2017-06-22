function locked = mech_is_locked(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    block = get_param(block, 'Handle');
    locked = false;
    root = bdroot(block);
    locked = strcmp(get_param(root, 'BlockDiagramType'), 'library') && strcmp(get_param(root, 'Lock'), 'on');
    % 12 15
    % 13 15
    block = get_param(get_param(block, 'Parent'), 'Handle');
    while not(locked) && ne(block, root)
        locked = strcmp(get_param(block, 'LinkStatus'), 'resolved');
        block = get_param(get_param(block, 'Parent'), 'Handle');
    end % while
end
