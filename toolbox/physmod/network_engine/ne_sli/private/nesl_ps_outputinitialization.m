function nesl_ps_outputinitialization(hBlock)
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
    parent = get_param(get_param(hBlock, 'Parent'), 'Handle');
    fullname = getfullname(hBlock);
    from = horzcat(fullname, '/FROM');
    position = get_param(from, 'Position');
    delete_block(from);
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if not(nesl_activeconverter('check', parent))
        add_block('built-in/Ground', from, 'Position', position);
    else
        % 27 28
        tag = nesl_makepstag(parent);
        add_block('built-in/From', from, 'Position', position, 'GotoTag', tag);
        % 30 32
        % 31 32
    end % if
end % function
