function siggui_setstate(hObj, s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 2.0, nargin));
    % 8 10
    if isfield(s, 'Tag')
        s = rmfield(s, 'Tag');
    end % if
    if isfield(s, 'Version')
        s = rmfield(s, 'Version');
    end % if
    if not(isempty(s))
        set(hObj, s);
    end % if
end % function
