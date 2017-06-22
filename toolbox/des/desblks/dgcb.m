function des_gcb = dgcb(varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if eq(nargin, 0.0)
        thisroot = getfullname(bdroot);
    else
        thisroot = getfullname(bdroot(varargin{1.0}));
    end % if
    % 10 11
    des_gcbh = feature('des_gcbh', thisroot);
    des_gcb = getfullname(des_gcbh);
    return;
end % function
