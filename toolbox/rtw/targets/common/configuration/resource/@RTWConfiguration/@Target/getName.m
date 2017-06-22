function tgtname = getName(target)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    block = target.block;
    % 15 17
    % 16 17
    if strcmp(get_param(bdroot(block), 'BlockDiagramType'), 'library')
        % 18 19
        targetBlock = block;
    else
        % 21 22
        targetBlock = get_param(block, 'ReferenceBlock');
    end % if
    % 24 26
    % 25 26
    load_system(strtok(targetBlock, '/'));
    % 27 28
    blockname = get_param(targetBlock, 'Name');
    tgtname = sscanf(blockname, '%s', 1.0);
end % function
