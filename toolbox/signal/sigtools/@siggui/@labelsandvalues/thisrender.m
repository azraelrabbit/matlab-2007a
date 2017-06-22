function thisrender(this, hFig, pos, lblwidth, type)
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
    error(nargchk(3.0, 5.0, nargin));
    % 13 16
    % 14 16
    set(this, 'FigureHandle', hFig);
    % 16 18
    m = get(this, 'Maximum');
    sz = gui_sizes(this);
    % 19 21
    width = pos(3.0);
    % 21 23
    if lt(nargin, 4.0)
        lblwidth = mtimes(40.0, sz.pixf);
    end % if
    if lt(nargin, 5.0)
        type = false;
    end % if
    valwidth = min(lblwidth, minus(width, lblwidth));
    left = minus(minus(width, lblwidth), valwidth);
    lblwidth = plus(lblwidth, mtimes(left, .15));
    valwidth = plus(valwidth, mtimes(left, .85));
    lblpos = horzcat(pos(1.0), plus(pos(2.0), pos(4.0)), lblwidth, sz.uh);
    editpos = horzcat(plus(pos(1.0), lblpos(3.0)), lblpos(2.0), valwidth, sz.uh);
    lblpos(2.0) = minus(lblpos(2.0), sz.lblTweak);
    if type
        skip = mrdivide(minus(pos(4.0), mtimes(m, sz.uh)), plus(m, 1.0));
    else
        if eq(m, 1.0)
            skip = 0.0;
        else
            skip = mrdivide(minus(pos(4.0), mtimes(m, sz.uh)), m);
        end % if
        lblpos(2.0) = plus(lblpos(2.0), skip);
        editpos(2.0) = plus(editpos(2.0), skip);
    end % if
    commonprops = {'HorizontalAlignment','Left','Visible','Off'};
    lblpos(2.0) = minus(lblpos(2.0), skip);
    lblpos(4.0) = plus(lblpos(4.0), skip);
    for indx=1.0:m
        lblpos(2.0) = minus(minus(lblpos(2.0), skip), sz.uh);
        editpos(2.0) = minus(minus(editpos(2.0), skip), sz.uh);
        % 52 54
        h.labels(indx) = uicontrol(hFig, commonprops{:}, 'Position', lblpos, 'Tag', sprintf('label%d', indx), 'Style', 'Text');
        % 54 58
        % 55 58
        % 56 58
        h.values(indx) = uicontrol(hFig, commonprops{:}, 'Position', editpos, 'Style', 'Edit', 'BackgroundColor', 'w', 'Tag', sprintf('value%d', indx), 'Callback', cellhorzcat(@value_cb, this, indx));
        % 58 65
        % 59 65
        % 60 65
        % 61 65
        % 62 65
        % 63 65
        setappdata(h.values(indx), 'index', indx);
    end % for
    % 66 68
    set(this, 'Handles', h);
    % 68 70
    l = vertcat(handle.listener(this, horzcat(this.findprop('values'), this.findprop('labels'), this.findprop('HiddenValues'), this.findprop('HiddenLabels')), 'PropertyPostSet', @values_labels_listener), handle.listener(this, this.findprop('DisabledValues'), 'PropertyPostSet', @disabledvalues_listener));
    % 70 78
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    set(l, 'CallbackTarget', this)
    % 78 81
    % 79 81
    this.WhenRenderedListeners = l;
    % 81 83
    values_labels_listener(this);
    enable_listener(this);
end % function
function values_labels_listener(this, eventData)
    % 86 89
    % 87 89
    if strcmpi(this.Visible, 'on')
        update_uis(this);
    end % if
end % function
function disabledvalues_listener(this, eventData)
    enable_listener(this);
end % function
function value_cb(hcbo, eventData, this, indx)
    % 96 99
    % 97 99
    vals = get(this, 'Values');
    vals(indx) = fixup_uiedit(hcbo);
    set(this, 'Values', vals);
    send(this, 'UserModifiedSpecs', handle.EventData(this, 'UserModifiedSpecs'));
end % function
