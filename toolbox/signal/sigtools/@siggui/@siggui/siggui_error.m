function siggui_error(hObj, Title, errstr)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    error(nargchk(1.0, 3.0, nargin));
    % 16 18
    if isrendered(hObj)
        % 18 21
        % 19 21
        hFig = get(hObj, 'figureHandle');
        setptr(hFig, 'arrow');
    end % if
    % 23 25
    if lt(nargin, 2.0)
        Title = 'Error';
    end % if
    if lt(nargin, 3.0)
        errstr = cleanerrormsg(lasterr);
    end % if
    % 30 34
    % 31 34
    % 32 34
    if isempty(errstr)
        return;
    end % if
    errordlg(errstr, Title, 'modal');
end % function
