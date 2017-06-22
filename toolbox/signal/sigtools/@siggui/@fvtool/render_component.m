function render_component(this, fcn, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    feval(fcn, this, varargin{:});
end
function render_analysisparamsmenu(this, hp, sep)
    % 13 16
    % 14 16
    error(nargchk(2.0, 3.0, nargin));
    if lt(nargin, 3.0)
        sep = 'On';
    end
    cbs = callbacks(this);
    % 20 22
    h = get(this, 'Handles');
    % 22 24
    if ~(isfield(h, 'menu')) || ~(isfield(h.menu, 'params'))
        h.menu.params.analysis = [];
        h.menu.params.fs = [];
        h.menu.params.srr = [];
    end
    h.menu.params.analysis(plus(end, 1.0)) = uimenu(hp, 'Label', xlate('&Analysis Parameters ...'), 'Callback', cbs.editparams, 'Separator', sep, 'Tag', 'fvtool_editanalysis');
    % 29 33
    % 30 33
    % 31 33
    h.menu.params.fs(plus(end, 1.0)) = uimenu(hp, 'Label', xlate('&Sampling Frequency ...'), 'Callback', cbs.editfs, 'Visible', this.FsEditable, 'Tag', 'fvtool_fs');
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    set(this, 'Handles', h);
end
function render_analysis_menu(this, position)
    % 41 45
    % 42 45
    % 43 45
    render_toplevel(this, position);
    render_parameters(this);
    % 46 49
    % 47 49
    info = get(this, 'AnalysesInfo');
    tags = fieldnames(info);
    for i=1.0:length(tags)
        render_analysis_menuitem(this, tags{i});
    end % for
end
function render_parameters(this)
    % 55 58
    % 56 58
    h = get(this, 'Handles');
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    hp = h.menu.analysis;
    cbs = callbacks(this);
    % 65 67
    h.menu.righthand.main = uimenu(hp, 'Label', xlate('Overlay Analysis'), 'Separator', 'On', 'Callback', cellhorzcat(@lclfix_submenu, this), 'tag', 'fvtool_righthandyaxis');
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    h.menu.righthand.none = uimenu(h.menu.righthand.main, 'Label', xlate('(None)'), 'tag', 'righthand_', 'Checked', 'On', 'Callback', cbs.righthand);
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    set(this, 'Handles', h);
    % 78 80
    render_analysisparamsmenu(this, hp);
end
function render_viewmenu(this, pos)
    % 82 85
    % 83 85
    hFig = get(this, 'FigureHandle');
    h = get(this, 'Handles');
    cbs = callbacks(this);
    % 87 89
    h.menu.view.main = findobj(hFig, 'type', 'uimenu', 'tag', 'view');
    % 89 91
    if isempty(h.menu.view.main)
        if lt(nargin, 2.0)
            pos = plus(length(findobj(hFig, 'type', 'uimenu', 'parent', hFig)), 1.0);
        end
        h.menu.view.main = addmenu(hFig, pos, '&View', '', 'view', 'Off', '');
    end
    % 96 98
    soscb = cellhorzcat(cbs.method, this, 'sosview');
    % 98 100
    lbls = cellhorzcat(xlate('&Grid'), xlate('&Legend'), xlate('Specification &Mask'), xlate('User-defined Spectral Mask ...'), xlate('&Passband'), xlate('&Stopband'));
    % 100 102
    pos = horzcat(0.0, 0.0, 0.0, 0.0, repmat(length(allchild(h.menu.view.main)), 1.0, 2.0));
    chk = cellhorzcat(this.Grid, this.Legend, this.DisplayMask, 'Off', 'Off', 'Off');
    tags = {'grid','legend','displaymask','userdefinedmask','passband','stopband'};
    cbs = cellhorzcat(cellhorzcat(@checkmenu_cb, this), cellhorzcat(@checkmenu_cb, this), cellhorzcat(@checkmenu_cb, this), cellhorzcat(cbs.method, this, 'userdefinedmask'), cellhorzcat(cbs.method, this, @lclbandzoom, [], 'pass'), cellhorzcat(cbs.method, this, @lclbandzoom, [], 'stop'));
    % 105 108
    % 106 108
    sep = {'Off','Off','Off','Off','On','Off'};
    % 108 110
    allowplugins = getappdata(hFig, 'allowplugins');
    if isempty(allowplugins)
        allowplugins = true;
    end
    % 113 115
    if allowplugins && isfdtbxinstalled
        lbls = cellhorzcat(lbls{1.0:4.0}, xlate('Show Reference Filter(s)'), xlate('Polyphase View'), lbls{5.0:6.0}, xlate('SOS View Settings ...'));
        % 116 118
        pos = horzcat(pos(1.0:4.0), 0.0, 0.0, pos(5.0:6.0), pos(5.0));
        chk = cellhorzcat(chk{1.0:4.0}, this.ShowReference, this.PolyphaseView, chk{5.0:6.0}, 'Off');
        tags = cellhorzcat(tags{1.0:4.0}, 'showreference', 'polyphaseview', tags{5.0:6.0}, 'sosview');
        cbs = cellhorzcat(cbs{1.0:4.0}, cbs{1.0:2.0}, cbs{5.0:6.0}, soscb);
        sep = cellhorzcat(sep{1.0:4.0}, 'Off', 'Off', sep{5.0:6.0}, 'On');
    end
    % 123 125
    if ~(isempty(allchild(h.menu.view.main)))
        hfirst = findobj(h.menu.view.main, 'position', 1.0, 'parent', h.menu.view.main);
        set(hfirst, 'Separator', 'on');
    end
    % 128 130
    for indx=1.0:length(lbls)
        h.menu.view.(tags{indx}) = uimenu(h.menu.view.main, 'Position', plus(indx, pos(indx)), 'Label', lbls{indx}, 'Tag', horzcat('fvtool_', tags{indx}), 'Checked', chk{indx}, 'Callback', cbs{indx}, 'Enable', 'On', 'Separator', sep{indx});
        % 131 139
        % 132 139
        % 133 139
        % 134 139
        % 135 139
        % 136 139
        % 137 139
    end % for
    % 139 141
    set(horzcat(h.menu.view.passband, h.menu.view.stopband, h.menu.view.displaymask), 'Enable', 'Off');
    % 141 144
    % 142 144
    set(this, 'Handles', h);
end
function render_toplevel(this, position)
    % 146 150
    % 147 150
    % 148 150
    hFig = get(this, 'FigureHandle');
    h = get(this, 'Handles');
    % 151 154
    % 152 154
    h.menu.analysis = findobj(hFig, 'type', 'uimenu', 'tag', 'analysis');
    % 154 157
    % 155 157
    if isempty(h.menu.analysis)
        h.menu.analysis = addmenu(hFig, position, xlate('&Analysis'), '', 'analysis', 'Off', '');
        % 158 160
    end
    % 160 162
    h.menu.analyses = [];
    % 162 164
    set(this, 'Handles', h);
end
function render_analysis_menuitem(this, tag)
    % 166 176
    % 167 176
    % 168 176
    % 169 176
    % 170 176
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    h = get(this, 'Handles');
    cbs = callbacks(this);
    % 177 180
    % 178 180
    info = get(this, 'AnalysesInfo');
    info = info.(tag);
    % 181 184
    % 182 184
    if isempty(info.label)
        return
    end
    position = get(findobj(h.menu.analysis, 'tag', 'fvtool_righthandyaxis'), 'Position');
    sep = 'off';
    if gt(position, 1.0) && isempty(h.menu.analyses)
        sep = 'on';
    end
    inputs = cellhorzcat('Label', info.label);
    h.menu.analyses.(tag) = uimenu(inputs{:}, 'Accelerator', info.accel, 'Parent', h.menu.analysis, 'Callback', cbs.analysis, 'Tag', tag, 'Separator', sep, 'Position', position);
    % 193 201
    % 194 201
    % 195 201
    % 196 201
    % 197 201
    % 198 201
    % 199 201
    if eq(length(get(h.menu.righthand.main, 'Children')), 1.0)
        sep = 'On';
    else
        sep = 'Off';
    end
    % 205 207
    h.menu.righthand.(tag) = uimenu(inputs{:}, 'Parent', h.menu.righthand.main, 'Callback', cbs.righthand, 'Tag', sprintf('righthand_%s', tag), 'Separator', sep);
    % 207 213
    % 208 213
    % 209 213
    % 210 213
    % 211 213
    set(this, 'Handles', h);
end
function render_analysis_toolbar(this)
    % 215 223
    % 216 223
    % 217 223
    % 218 223
    % 219 223
    % 220 223
    % 221 223
    info = get(this, 'AnalysesInfo');
    tags = fieldnames(info);
    for i=1.0:length(tags)
        render_analysis_button(this, tags{i});
    end % for
end
function render_toolbar(this)
    % 229 233
    % 230 233
    % 231 233
    h = get(this, 'Handles');
    % 233 235
    hFig = get(this, 'FigureHandle');
    % 235 238
    % 236 238
    aut = findall(hFig, 'type', 'uitoolbar', 'tag', 'analysistoolbar');
    ut = setdiff(findobj(hFig, 'type', 'uitoolbar'), aut);
    if isempty(ut)
        % 240 243
        % 241 243
        ut = uitoolbar(hFig);
    else
        if gt(length(ut), 1.0)
            % 245 248
            % 246 248
            ut = get(findall(ut, 'tag', 'newanalysis'), 'parent');
        end
    end
    h.toolbar.analysis = aut;
    h.toolbar.figure = ut;
    set(this, 'Handles', h);
end
function render_analysis_button(this, tag)
    % 255 262
    % 256 262
    % 257 262
    % 258 262
    % 259 262
    % 260 262
    h = get(this, 'Handles');
    cbs = callbacks(this);
    % 263 266
    % 264 266
    info = get(this, 'AnalysesInfo');
    info = info.(tag);
    % 267 270
    % 268 270
    if isempty(info.icon)
        return
    end
    if ishandle(h.toolbar.analysis)
        hut = h.toolbar.analysis;
    else
        hut = h.toolbar.figure;
    end
    % 277 279
    if ~(isempty(allchild(hut)) || isfield(h.toolbar, 'analyses'))
        sep = 'On';
    else
        sep = 'Off';
    end
    % 283 285
    h.toolbar.analyses.(tag) = uitoggletool('Cdata', info.icon, 'Parent', hut, 'ClickedCallback', cbs.analysis, 'Tag', tag, 'Separator', sep, 'Tooltipstring', xlate(horzcat(info.label(1.0), lower(info.label(2.0:end)))));
    % 285 292
    % 286 292
    % 287 292
    % 288 292
    % 289 292
    % 290 292
    set(this, 'Handles', h);
end
function render_axes(this, pos)
    % 294 299
    % 295 299
    % 296 299
    % 297 299
    h = get(this, 'Handles');
    hFig = get(this, 'FigureHandle');
    % 300 302
    sigsetappdata(hFig, 'fvtool', 'handle', this);
    % 302 304
    defpos = get(0.0, 'DefaultAxesPosition');
    defpos(3.0) = mtimes(defpos(3.0), .975);
    % 305 308
    % 306 308
    h.axes(2.0) = axes('Parent', hFig, 'Units', 'Normalized', 'Visible', this.Visible, 'ActivePositionProperty', 'position', 'Position', defpos, 'Tag', 'fvtool_axes_1');
    % 308 314
    % 309 314
    % 310 314
    % 311 314
    % 312 314
    h.axes(1.0) = axes('Parent', hFig, 'Units', 'Normalized', 'Visible', this.Visible, 'ActivePositionProperty', 'position', 'Position', defpos, 'HandleVisibility', 'Callback', 'Tag', 'fvtool_axes_2');
    % 314 322
    % 315 322
    % 316 322
    % 317 322
    % 318 322
    % 319 322
    % 320 322
    h.listbox = uicontrol('Parent', hFig, 'Units', 'Pixels', 'Style', 'Listbox', 'Visible', this.Visible, 'Tag', 'fvtool_listbox', 'Backgroundcolor', 'w');
    % 322 329
    % 323 329
    % 324 329
    % 325 329
    % 326 329
    % 327 329
    fdaddcontextmenu(hFig, h.listbox, 'fdatool_filtercoefficients_viewer');
    % 329 332
    % 330 332
    if eq(nargin, 2.0) && ~(isempty(pos))
        set(h.axes, 'Units', 'Pixels', 'Position', pos);
        set(h.listbox, 'Position', pos);
    else
        % 335 337
        if ispc
            fontname = 'MS Sans Serif';
        else
            fontname = 'monospaced';
        end
        set(h.listbox, 'FontName', fontname, 'Units', get(0.0, 'defaultaxesunits'), 'Position', defpos);
        % 342 345
        % 343 345
    end
    % 345 347
    set(this, 'Handles', h);
    % 347 349
    hc = uicontextmenu('Parent', hFig);
    % 349 351
    set(h.axes, 'UIContextMenu', hc);
    % 351 353
    render_analysisparamsmenu(this, hc, 'Off');
end
function checkmenu_cb(hcbo, eventStruct, this)
    % 355 358
    % 356 358
    prop = strrep(get(hcbo, 'tag'), 'fvtool_', '');
    % 358 360
    if strcmpi(get(this, prop), 'On')
        check = 'off';
    else
        check = 'on';
    end
    % 364 366
    set(this, prop, check);
end
function lclfix_submenu(hcbo, eventStruct, this)
    % 368 372
    % 369 372
    % 370 372
    fix_submenu(this);
end
function lclbandzoom(this, band)
    % 374 378
    % 375 378
    % 376 378
    zoom(this, horzcat(band, 'band'));
end
