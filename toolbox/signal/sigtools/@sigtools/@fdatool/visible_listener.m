function visible_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hFig = get(this, 'FigureHandle');
    visState = get(this, 'Visible');
    % 9 11
    h = get(this, 'Handles');
    % 11 13
    hc = allchild(this);
    % 13 15
    hTip = getappdata(this, 'tipoftheday');
    % 15 17
    if strcmpi(visState, 'On')
        % 17 19
        ht = findobj(h.menus.main, 'tag', 'targets');
        if isempty(allchild(ht))
            h.menus.main = setdiff(h.menus.main, ht);
        end % if
        set(convert2vector(h.menus.main), 'Visible', 'on');
        set(convert2vector(h.toolbar), 'Visible', 'On');
        drawnow;
        % 25 28
        % 26 28
        hc = find(hc, '-depth', 0.0, '-not', '-isa', 'siggui.dialog');
    else
        if ishandle(hTip)
            delete(hTip);
        end % if
        deletewarndlgs(this);
        set(hFig, 'Visible', visState);
    end % if
    % 35 37
    set(hc, 'Visible', visState);
    % 37 39
    if strcmpi(visState, 'on')
        % 39 42
        % 40 42
        h.recessedFr = h.recessedFr(2.0:end);
        h = convert2vector(rmfield(h, 'staticresp'));
        set(h, 'visible', 'on');
        set(hFig, 'Visible', 'On');
        if ishandle(hTip)
            figure(hTip);
        end % if
    end % if
end % function
