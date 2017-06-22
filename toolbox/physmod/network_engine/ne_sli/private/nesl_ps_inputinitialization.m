function nesl_ps_inputinitialization(hBlock)
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
    tag = nesl_makepstag(parent);
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    fullname = getfullname(hBlock);
    goto = horzcat(fullname, '/GOTO');
    from = horzcat(fullname, '/FROM');
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    set_param(goto, 'GotoTag', tag);
    set_param(from, 'GotoTag', tag);
    % 29 31
    % 30 31
end % function
