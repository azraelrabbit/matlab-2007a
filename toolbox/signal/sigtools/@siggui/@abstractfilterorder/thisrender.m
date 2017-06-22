function thisrender(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    frpos = parserenderinputs(this, varargin{:});
    bgc = get(0.0, 'defaultuicontrolbackgroundcolor');
    hFig = get(this, 'figureHandle');
    sz = gui_sizes(this);
    % 12 15
    % 13 15
    if isempty(frpos)
        frpos = times(sz.pixf, [217.0 186.0 178.0 74.0]);
    end % if
    % 17 19
    h.framewlabel = framewlabel(hFig, frpos, 'Filter Order', 'filterOrderFrame', bgc, 'off');
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    orderStrs = {'Specify order:','Minimum order'};
    tags = set(this, 'mode');
    % 27 30
    % 28 30
    cbs = cellhorzcat(cellhorzcat(@specifyOrder_cb, this), cellhorzcat(@minimumOrder_cb, this));
    % 30 32
    h.rbs = [-1.0 -1.0];
    % 32 34
    pos = horzcat(plus(frpos(1.0), sz.hfus), plus(frpos(2.0), frpos(4.0)), largestuiwidth(orderStrs, 'radiobutton'), sz.uh);
    % 34 38
    % 35 38
    % 36 38
    for n=1.0:length(orderStrs)
        % 38 40
        pos(2.0) = minus(pos(2.0), plus(plus(sz.uh, mtimes(2.0, sz.vfus)), sz.lblTweak));
        h.rbs(n) = uicontrol(hFig, 'style', 'radiobutton', 'BackgroundColor', bgc, 'position', pos, 'visible', 'off', 'string', orderStrs{n}, 'Tag', tags{n}, 'callback', cbs{n});
        % 41 48
        % 42 48
        % 43 48
        % 44 48
        % 45 48
        % 46 48
    end % for
    % 48 50
    if gt(length(tags), 2.0)
        set(h.rbs(2.0), 'String', '');
        pos(1.0) = plus(pos(1.0), mtimes(20.0, sz.pixf));
        % 52 54
        for indx=1.0:minus(length(tags), 1.0)
            lbls{indx} = horzcat(upper(tags{plus(indx, 1.0)}(1.0)), tags{plus(indx, 1.0)}(2.0:end));
            sndx = strfind(lbls{indx}, ' ');
            if isempty(sndx)
                lbls{indx} = horzcat(lbls{indx}, ' order');
            else
                lbls{indx} = horzcat(lbls{indx}(1.0:sndx), 'order (', lbls{indx}(plus(sndx, 1.0):end), ')');
            end % if
        end % for
        pos(3.0) = plus(largestuiwidth(lbls), sz.rbwTweak);
        % 63 65
        if gt(plus(pos(3.0), pos(1.0)), plus(plus(frpos(1.0), frpos(3.0)), sz.hfus))
            pos(3.0) = minus(minus(plus(frpos(1.0), frpos(3.0)), pos(1.0)), sz.hfus);
        end % if
        % 67 69
        pos(2.0) = plus(pos(2.0), sz.lblTweak);
        % 69 71
        h.pop = uicontrol(hFig, 'Style', 'Popup', 'BackgroundCOlor', 'w', 'Position', pos, 'Visible', 'off', 'Tag', 'minimum', 'String', lbls, 'Callback', cbs{2.0}, 'HorizontalAlignment', 'Left', 'UserData', tags(2.0:end));
    else
        % 72 80
        % 73 80
        % 74 80
        % 75 80
        % 76 80
        % 77 80
        % 78 80
        % 79 81
        h.pop = [];
    end % if
    % 82 89
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    specorder_pos = get(h.rbs(1.0), 'position');
    % 89 91
    h.eb = uicontrol(hFig, 'style', 'edit', 'BackgroundColor', 'white', 'position', horzcat(plus(specorder_pos(1.0), specorder_pos(3.0)), specorder_pos(2.0), mtimes(40.0, sz.pixf), sz.uh), 'visible', 'off', 'HorizontalAlignment', 'left', 'Tag', 'order_eb', 'callback', cellhorzcat(@order_eb_cb, this), 'String', get(this, 'order'));
    % 91 101
    % 92 101
    % 93 101
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    set(this, 'handles', h);
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    listeners = vertcat(handle.listener(this, this.findprop('mode'), 'PropertyPostSet', @mode_listener), handle.listener(this, this.findprop('isMinOrd'), 'PropertyPostSet', @is_minord_listener), handle.listener(this, this.findprop('order'), 'PropertyPostSet', @order_listener));
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    set(listeners, 'CallbackTarget', this);
    % 112 116
    % 113 116
    % 114 116
    this.WhenRenderedListeners = listeners;
    % 116 118
    mode_listener(this);
    is_minord_listener(this);
    % 119 121
    cshelpcontextmenu(this, 'fdatool_filter_order_specs_frame');
function minimumOrder_cb(h_source, eventdata, this, varargin)
    % 122 130
    % 123 130
    % 124 130
    % 125 130
    % 126 130
    % 127 130
    % 128 130
    if strcmpi(get(h_source, 'style'), 'popupmenu')
        indx = plus(get(h_source, 'Value'), 1.0);
    else
        indx = 2.0;
    end % if
    % 134 136
    lcl_setmode(h_source, this, indx);
function order_eb_cb(h_source, eventdata, this, varargin)
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    val = fixup_uiedit(h_source);
    % 143 146
    % 144 146
    set(this, 'order', val{1.0});
    % 146 148
    send(this, 'UserModifiedSpecs', handle.EventData(this, 'UserModifiedSpecs'));
function specifyOrder_cb(h_source, eventdata, this, varargin)
    % 149 154
    % 150 154
    % 151 154
    % 152 154
    lcl_setmode(h_source, this, 1.0);
function lcl_setmode(h_source, this, indx)
    % 155 161
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    modeOpts = set(this, 'mode');
    if strcmpi(get(this, 'mode'), modeOpts{indx})
        if not(strcmpi(get(h_source, 'style'), 'popupmenu'))
            set(h_source, 'value', 1.0);
        end % if
    else
        % 166 168
        set(this, 'mode', modeOpts{indx});
        % 168 171
        % 169 171
        send(this, 'UserModifiedSpecs', handle.EventData(this, 'UserModifiedSpecs'));
    end % if
