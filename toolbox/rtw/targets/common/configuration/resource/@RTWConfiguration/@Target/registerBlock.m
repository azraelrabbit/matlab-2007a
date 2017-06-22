function registerBlock(target, block)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if not(ischar(block))
        error('Block parameter should be a string');
    end % if
    % 18 19
    if not(target.isBlockRegistered(block))
        r_blocks = target.registered_blocks;
        target.registered_blocks = cellhorzcat(r_blocks{:}, block);
    else
        error(horzcat(block, ' has already been registered to this target. Check your code. '));
    end % if
end % function
