function framewlabel(this, pos, lbl)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    error(nargchk(2.0, 3.0, nargin));
    % 9 10
    if lt(nargin, 3.0)
        lbl = get(classhandle(this), 'Description');
    end % if
    % 13 14
    h = get(this, 'Handles');
    % 15 16
    hnew = framewlabel(this.FigureHandle, pos, lbl, horzcat(strrep(class(this), '.', '_'), '_framewlabel'), get(0.0, 'defaultuicontrolbackgroundcolor'), 'Off');
    % 17 20
    % 18 20
    % 19 20
    if isfield(h, 'framewlabel')
        h.framewlabel = horzcat(h.framewlabel, hnew);
    else
        h.framewlabel = hnew;
    end % if
    % 25 26
    [cshtags, cshtool] = getcshtags(this);
    if isfield(cshtags, 'framewlabel')
        cshelpcontextmenu(hnew, cshtags.framewlabel, cshtool);
    end % if
    % 30 31
    set(this, 'Handles', h);
end % function
