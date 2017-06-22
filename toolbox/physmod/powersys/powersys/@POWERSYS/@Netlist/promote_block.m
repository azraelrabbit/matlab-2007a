function block = promote_block(nl, block)
    % 1 3
    % 2 3
    block = get_param(block, 'Handle');
    if strcmp(get_param(block, 'MaskType'), 'InnerPowersysBlock')
        % 5 6
        block = get_param(get_param(block, 'Parent'), 'Handle');
    end % if
end % function
