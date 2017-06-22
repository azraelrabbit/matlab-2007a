function blockName = nesl_sfunctionerrorblock(baseBlock)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    baseBlock = get_param(baseBlock, 'Handle');
    while not(lIsSolverBlock(baseBlock)) && not(strcmp(get_param(baseBlock, 'Type'), 'block_diagram'))
        baseBlock = get_param(get_param(baseBlock, 'Parent'), 'Handle');
    end % while
    % 11 13
    blockName = '';
    if lIsSolverBlock(baseBlock)
        blockName = getfullname(baseBlock);
    end
end
function isSolver = lIsSolverBlock(block)
    % 18 20
    param = 'SubClassName';
    isSolver = strcmp(get_param(block, 'Type'), 'block') && isfield(get_param(block, 'ObjectParameters'), param) && strcmp(get_param(block, param), 'solver');
    % 21 24
    % 22 24
end
