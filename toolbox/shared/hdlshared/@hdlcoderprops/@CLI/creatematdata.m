function pv = creatematdata(this, flag)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if gt(nargin, 1.0) && strcmpi(flag, 'nondefault')
        props = getNonDefaultProps(this);
    else
        props = fieldnames(this);
    end % if
    % 18 19
    vals = get(this, props);
    % 20 21
    pv = ctranspose(horzcat(props(:), vals(:)));
    pv = ctranspose(pv(:));
end % function
