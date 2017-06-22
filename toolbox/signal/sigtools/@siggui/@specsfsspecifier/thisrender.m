function thisrender(this, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    frPos = parserenderinputs(this, varargin{:});
    % 12 15
    % 13 15
    sz = gui_sizes(this);
    hFig = get(this, 'FigureHandle');
    cbs = siggui_cbs(this);
    % 17 19
    if isempty(frPos)
        error('Postion must be specified');
    end % if
    pos = horzcat(plus(frPos(1.0), sz.hfus), minus(minus(minus(plus(frPos(2.0), frPos(4.0)), sz.uh), mtimes(2.0, sz.vfus)), sz.lblTweak), mtimes(33.0, sz.pixf), sz.uh);
    % 22 24
    h.units_lbl = uicontrol('Parent', hFig, 'Style', 'Text', 'visible', 'off', 'String', 'Units:', 'Tag', 'fsspecifier_popup_lbl', 'Horizontalalignment', 'left', 'Units', 'pixels', 'Position', pos);
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    pos = horzcat(plus(pos(1.0), pos(3.0)), plus(pos(2.0), sz.lblTweak), minus(minus(minus(plus(frPos(1.0), frPos(3.0)), pos(1.0)), pos(3.0)), mtimes(17.0, sz.pixf)), sz.uh);
    % 33 36
    % 34 36
    h.units = uicontrol('Parent', hFig, 'Style', 'popup', 'visible', 'off', 'String', set(this, 'Units'), 'callback', cellhorzcat(cbs.property, this, 'units', 'change Fs units'), 'Tag', 'fsspecifier_popup', 'Value', 2.0, 'BackgroundColor', 'w', 'Units', 'pixels', 'Position', pos);
    % 36 47
    % 37 47
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    pos = get(h.units_lbl, 'Position');
    pos = horzcat(plus(pos(1.0), sz.uuhs), minus(pos(2.0), plus(plus(sz.uh, sz.uuvs), sz.lblTweak)), mtimes(20.0, sz.pixf), sz.uh);
    % 48 50
    h.value_lbl = uicontrol('Parent', hFig, 'Style', 'Text', 'visible', 'off', 'String', 'Fs:', 'Tag', 'fsspecifier_editbox_lbl', 'Horizontalalignment', 'left', 'Units', 'pixels', 'Position', pos);
    % 50 59
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    left = plus(plus(plus(frPos(1.0), sz.hfus), mtimes(33.0, sz.pixf)), mtimes(2.0, sz.uuhs));
    % 59 61
    pos = horzcat(left, plus(pos(2.0), sz.lblTweak), minus(minus(plus(frPos(1.0), frPos(3.0)), left), 17.0), sz.uh);
    % 61 63
    h.value = uicontrol('Parent', hFig, 'Style', 'Edit', 'callback', cellhorzcat(cbs.property, this, 'value', 'change Fs'), 'visible', 'off', 'tag', 'fsspecifier_editbox', 'Units', 'pixels', 'position', pos, 'String', this.Value, 'Horizontalalignment', 'left');
    % 63 73
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    set(this, 'handles', h);
    % 73 75
    wrl = handle.listener(this, horzcat(this.findprop('Units'), this.findprop('Value')), 'PropertyPostSet', @lclprop_listener);
    % 75 78
    % 76 78
    set(wrl, 'callbacktarget', this);
    set(this, 'whenrenderedlisteners', wrl);
    % 79 81
    setupenablelink(this, 'units', {'hz','khz','mhz','ghz'}, 'value');
end % function
function lclprop_listener(this, eventData)
    % 83 86
    % 84 86
    prop_listener(this, eventData);
end % function
