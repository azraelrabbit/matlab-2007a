function siggui_warning(hObj, title, wstr, wid)
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
    error(nargchk(1.0, 4.0, nargin));
    % 16 18
    if lt(nargin, 4.0)
        if lt(nargin, 3.0)
            [wstr, wid] = lastwarn;
        else
            wid = '';
        end % if
        if lt(nargin, 2.0)
            title = 'Warning';
        end % if
    end % if
    % 27 30
    % 28 30
    hFig = get(hObj, 'figureHandle');
    setptr(hFig, 'arrow');
    % 31 33
    wid = fliplr(strtok(fliplr(wid), ':'));
    % 33 37
    % 34 37
    % 35 37
    switch lower(wid)
    case {'logofzero','syntaxchanged'}
    otherwise
        % 39 42
        % 40 42
        if any(strcmpi(wstr, {'negative data ignored.'}))
            return;
        end % if
        % 44 46
        h_warn = warndlg(wstr, title);
        % 46 48
        h = get(hObj, 'Handles');
        % 48 50
        if isfield(h, 'warn')
            h.warn(plus(end, 1.0)) = h_warn;
        else
            h.warn = h_warn;
        end % if
        % 54 56
        set(hObj, 'Handles', h);
    end % switch
