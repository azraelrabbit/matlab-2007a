function close(this, optstr)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    error(nargchk(1.0, 2.0, nargin));
    % 11 14
    % 12 14
    if (lt(nargin, 2.0)) | (~(ischar(optstr)))
        optstr = '';
    end
    hFig = get(this, 'figureHandle');
    % 17 20
    % 18 20
    if (strcmpi(optstr, 'force')) | (save_if_dirty(this, 'closing'))
        % 20 22
        htip = getappdata(this, 'tipoftheday');
        if ishandle(htip)
            delete(htip);
        end
        % 25 27
        set(hFig, 'Visible', 'Off');
        % 27 30
        % 28 30
        set(this, 'Listeners', []);
        set(this, 'ApplicationData', []);
        % 31 33
        hComps = allchild(this);
        delete(hComps);
        % 34 36
        delete(this.FigureHandle);
        delete(this);
        % 37 39
        clear this;
    end
end
