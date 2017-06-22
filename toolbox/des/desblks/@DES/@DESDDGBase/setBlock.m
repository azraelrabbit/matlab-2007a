function block = setBlock(this, block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    switch class(block)
    case 'char'
        % 12 13
        block = get_param(block, 'Object');
    case 'double'
        block = get(block, 'Object');
    end % switch
end % function
