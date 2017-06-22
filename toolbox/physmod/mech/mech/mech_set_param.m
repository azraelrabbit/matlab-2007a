function mech_set_param(hBlk, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hBlk = get_param(hBlk, 'Handle');
    root = bdroot(hBlk);
    pBlk = get_param(get_param(hBlk, 'Parent'), 'Handle');
    dty = get_param(root, 'Dirty');
    % 13 14
    CGCS = get_param(0.0, 'CurrentSystem');
    set_param(0.0, 'CurrentSystem', pBlk);
    % 16 17
    set_param(hBlk, varargin{:});
    % 18 19
    set_param(0.0, 'CurrentSystem', CGCS);
    set_param(root, 'Dirty', dty);
end % function
