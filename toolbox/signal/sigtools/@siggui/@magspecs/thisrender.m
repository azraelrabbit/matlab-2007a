function thisrender(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pos = parserenderinputs(this, varargin{:});
    if isempty(pos)
        pos = 'mag';
    end
    hFig = get(this, 'FigureHandle');
    % 13 15
    super_render(this, pos);
    % 15 17
    h = get(this, 'handles');
    % 17 19
    pos = get(h.framewlabel(1.0), 'position');
    % 19 21
    lbl = 'Units:';
    % 21 24
    % 22 24
    sz = gui_sizes(this);
    units_lbl_pos = horzcat(plus(pos(1.0), sz.hfus), minus(minus(minus(plus(pos(2.0), pos(4.0)), sz.uh), mtimes(2.0, sz.vfus)), sz.lblTweak), mtimes(33.0, sz.pixf), sz.uh);
    % 25 28
    % 26 28
    h.units_lbl = uicontrol(hFig, 'style', 'text', 'Units', 'pixels', 'position', units_lbl_pos, 'visible', 'off', 'string', lbl, 'tag', 'units_lbl', 'HorizontalAlignment', 'left');
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    Type = get(this, 'IRType');
    % 37 39
    popup_pos = horzcat(plus(units_lbl_pos(1.0), units_lbl_pos(3.0)), plus(units_lbl_pos(2.0), sz.lblTweak), plus(sz.ebw, mtimes(3.0, sz.uuhs)), sz.uh);
    % 39 43
    % 40 43
    % 41 43
    h.units = uicontrol(hFig, 'style', 'popup', 'BackgroundColor', 'white', 'Units', 'pixels', 'position', popup_pos, 'string', set(this, Type), 'tag', 'IRunits_popup', 'visible', 'off', 'Value', find(strcmpi(set(this, Type), this.(Type))), 'callback', cellhorzcat(@units_cb, this));
    % 43 55
    % 44 55
    % 45 55
    % 46 55
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    set(this, 'handles', h);
    % 55 57
    renderlabelsnvalues(this, pos);
    % 57 60
    % 58 60
    wrl = this.WhenRenderedListeners;
    % 60 64
    % 61 64
    % 62 64
    wrl = horzcat(wrl, handle.listener(this, horzcat(this.findprop('FIRUnits'), this.findprop('IIRUnits')), 'PropertyPostSet', @units_listener), handle.listener(this, this.findprop('IRType'), 'PropertyPostSet', @irtype_listener));
    % 64 72
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    set(wrl, 'CallbackTarget', this);
    % 72 75
    % 73 75
    this.WhenRenderedListeners = wrl;
    % 75 78
    % 76 78
    cshelpcontextmenu(this, 'fdatool_ALL_mag_specs_frame');
end
function units_cb(hcbo, eventData, this)
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    indx = get(hcbo, 'value');
    % 85 88
    % 86 88
    Type = get(this, 'IRType');
    % 88 91
    % 89 91
    magUnitsOpts = get(hcbo, 'string');
    % 91 93
    set(this, Type, magUnitsOpts{indx});
    % 93 96
    % 94 96
    send(this, 'UserModifiedSpecs', handle.EventData(this, 'UserModifiedSpecs'));
end
function units_listener(this, eventData)
    % 98 102
    % 99 102
    % 100 102
    Type = get(this, 'IRType');
    % 102 106
    % 103 106
    % 104 106
    set(this.Handles.units, 'value', find(strcmp(get(this, Type), set(this, Type))));
    % 106 109
    % 107 109
    update_labels(this);
end
function irtype_listener(this, eventData)
    % 111 115
    % 112 115
    % 113 115
    currType = get(this, 'IRType');
    % 115 118
    % 116 118
    set(this.Handles.units, 'string', set(this, currType), 'value', find(strcmpi(set(this, currType), get(this, currType))));
    % 118 122
    % 119 122
    % 120 122
    update_labels(this);
end
