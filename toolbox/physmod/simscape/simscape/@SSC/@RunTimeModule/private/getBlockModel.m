function mdl = getBlockModel(block)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    mdl = get_param(ssc_bdroot(block.Handle), 'Object');
end % function
