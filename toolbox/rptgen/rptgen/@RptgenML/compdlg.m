function [selection, value] = compdlg(varargin)
    % 1 36
    % 2 36
    % 3 36
    % 4 36
    % 5 36
    % 6 36
    % 7 36
    % 8 36
    % 9 36
    % 10 36
    % 11 36
    % 12 36
    % 13 36
    % 14 36
    % 15 36
    % 16 36
    % 17 36
    % 18 36
    % 19 36
    % 20 36
    % 21 36
    % 22 36
    % 23 36
    % 24 36
    % 25 36
    % 26 36
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    figname = xlate('Report Generator');
    smode = 1.0;
    promptstring = xlate('Select a component');
    listsize = [200.0 300.0];
    initialvalue = [];
    okstring = 'OK';
    cancelstring = 'Cancel';
    fus = 8.0;
    ffs = 8.0;
    uh = 22.0;
    % 45 47
    if ne(mod(length(varargin), 2.0), 0.0)
        % 47 49
        error('Arguments to COMPDLG must come param/value in pairs.')
    end % if
    for i=1.0:2.0:length(varargin)
        switch lower(varargin{i})
        case 'name'
            figname = varargin{plus(i, 1.0)};
        case 'promptstring'
            promptstring = varargin{plus(i, 1.0)};
            % 57 64
            % 58 64
            % 59 64
            % 60 64
            % 61 64
            % 62 64
        case 'listsize'
            % 63 65
            listsize = varargin{plus(i, 1.0)};
            % 66 68
        case 'initialvalue'
            % 67 69
            initialvalue = varargin{plus(i, 1.0)};
        case 'uh'
            uh = varargin{plus(i, 1.0)};
        case 'fus'
            fus = varargin{plus(i, 1.0)};
        case 'ffs'
            ffs = varargin{plus(i, 1.0)};
        case 'okstring'
            okstring = varargin{plus(i, 1.0)};
        case 'cancelstring'
            cancelstring = varargin{plus(i, 1.0)};
        otherwise
            error(horzcat('Unknown parameter name passed to COMPDLG.  Name was ', varargin{i}))
        end % switch
    end % for
    % 83 85
    if isstr(promptstring)
        promptstring = cellstr(promptstring);
    end % if
    % 87 89
    if isempty(initialvalue)
        initialvalue = 1.0;
    end % if
    % 91 93
    ex = mtimes(get(0.0, 'defaultuicontrolfontsize'), 1.7);
    % 93 95
    fp = get(0.0, 'defaultfigureposition');
    w = plus(mtimes(2.0, plus(fus, ffs)), listsize(1.0));
    h = plus(plus(plus(plus(plus(mtimes(2.0, ffs), mtimes(6.0, fus)), mtimes(ex, length(promptstring))), listsize(2.0)), uh), mtimes(eq(smode, 2.0), plus(fus, uh)));
    fp = horzcat(fp(1.0), minus(plus(fp(2.0), fp(4.0)), h), w, h);
    % 98 100
    fig_props = cellhorzcat('name', figname, 'color', get(0.0, 'defaultUicontrolBackgroundColor'), 'resize', 'off', 'numbertitle', 'off', 'menubar', 'none', 'windowstyle', 'modal', 'visible', 'off', 'createfcn', '', 'position', fp, 'closerequestfcn', 'delete(gcbf)');
    % 100 114
    % 101 114
    % 102 114
    % 103 114
    % 104 114
    % 105 114
    % 106 114
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    fig = figure(fig_props{:});
    % 114 116
    if gt(length(promptstring), 0.0)
        prompt_text = uicontrol('style', 'text', 'string', promptstring, 'horizontalalignment', 'left', 'position', horzcat(plus(ffs, fus), minus(fp(4.0), plus(plus(ffs, fus), mtimes(ex, length(promptstring)))), listsize(1.0), mtimes(ex, length(promptstring))));
        % 117 121
        % 118 121
        % 119 121
    end % if
    % 121 123
    btn_wid = mrdivide(minus(minus(fp(3.0), mtimes(2.0, plus(ffs, fus))), fus), 2.0);
    % 123 126
    % 124 126
    frameh = uicontrol('style', 'frame', 'position', horzcat(minus(plus(ffs, fus), 1.0), minus(plus(ffs, fus), 1.0), plus(btn_wid, 2.0), plus(uh, 2.0)), 'backgroundcolor', 'k');
    % 126 130
    % 127 130
    % 128 130
    listbox = uicontrol('style', 'listbox', 'position', horzcat(plus(ffs, fus), plus(plus(plus(ffs, uh), mtimes(4.0, fus)), mtimes(eq(smode, 2.0), plus(fus, uh))), listsize), 'string', cellhorzcat(xlate('Finding components...')), 'backgroundcolor', 'w', 'max', smode, 'tag', 'listbox', 'value', initialvalue);
    % 130 142
    % 131 142
    % 132 142
    % 133 142
    % 134 142
    % 135 142
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    ok_btn = uicontrol('style', 'pushbutton', 'Enable', 'off', 'string', okstring, 'position', horzcat(plus(ffs, fus), plus(ffs, fus), btn_wid, uh), 'callback', cellhorzcat(@doOK, listbox));
    % 142 149
    % 143 149
    % 144 149
    % 145 149
    % 146 149
    % 147 149
    cancel_btn = uicontrol('style', 'pushbutton', 'string', cancelstring, 'position', horzcat(plus(plus(ffs, mtimes(2.0, fus)), btn_wid), plus(ffs, fus), btn_wid, uh), 'callback', cellhorzcat(@doCancel, listbox));
    % 149 168
    % 150 168
    % 151 168
    % 152 168
    % 153 168
    % 154 168
    % 155 168
    % 156 168
    % 157 168
    % 158 168
    % 159 168
    % 160 168
    % 161 168
    % 162 168
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    set(horzcat(fig, listbox, ok_btn, cancel_btn), 'keypressfcn', cellhorzcat(@doKeypress, listbox))
    % 168 170
    set(fig, 'position', getnicedialoglocation(fp, get(fig, 'Units')));
    % 170 173
    % 171 173
    movegui(fig)
    set(fig, 'visible', 'on');
    drawnow;
    allComps = populateListbox([], [], listbox);
    set(listbox, 'callback', cellhorzcat(@doListboxClick, ok_btn));
    % 177 183
    % 178 183
    % 179 183
    % 180 183
    % 181 183
    allCategories = find(allComps, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory');
    l = handle.listener(allCategories, findprop(allCategories(1.0), 'Expanded'), 'PropertyPostSet', cellhorzcat(@populateListbox, listbox));
    % 184 187
    % 185 187
    try
        uiwait(fig);
    catch
        if ishandle(fig)
            delete(fig)
        end % if
    end % try
    % 193 195
    if isappdata(0.0, 'ListDialogAppData')
        ad = getappdata(0.0, 'ListDialogAppData');
        selection = ad.selection;
        value = ad.value;
        rmappdata(0.0, 'ListDialogAppData')
    else
        % 200 202
        selection = [];
        value = 0.0;
    end % if
function doKeypress(fig_h, evd, listbox)
    % 205 211
    % 206 211
    % 207 211
    % 208 211
    % 209 211
    switch evd.Key
    case {'return','space'}
        doOK([], [], listbox);
    case 'escape'
        doCancel([], [], listbox);
    end % switch
function doOK(ok_btn, evd, listbox)
    % 217 221
    % 218 221
    % 219 221
    selectIdx = get(listbox, 'value');
    selectObj = get(listbox, 'UserData');
    if isempty(selectObj)
        % 223 225
        return;
    end % if
    % 226 228
    selectObj = selectObj(selectIdx);
    % 228 230
    if isa(selectObj, 'RptgenML.LibraryCategory')
        selectObj.exploreAction;
    else
        % 232 234
        ad.value = 1.0;
        ad.selection = selectObj.ClassName;
        setappdata(0.0, 'ListDialogAppData', ad)
        delete(gcbf);
    end % if
function doCancel(cancel_btn, evd, listbox)
    % 239 241
    ad.value = 0.0;
    ad.selection = [];
    setappdata(0.0, 'ListDialogAppData', ad)
    delete(gcbf);
function doSelectAll(selectall_btn, evd, listbox)
    % 245 247
    set(selectall_btn, 'enable', 'off')
    set(listbox, 'value', 1.0:length(get(listbox, 'string')));
function doListboxClick(listbox, evd, ok_btn, selectall_btn)
    % 249 252
    % 250 252
    if strcmp(get(gcbf, 'SelectionType'), 'open')
        doOK([], [], listbox);
    else
        selectedObj = get(listbox, 'UserData');
        selectedObj = selectedObj(get(listbox, 'value'));
        if isa(selectedObj, 'RptgenML.LibraryCategory')
            set(ok_btn, 'Enable', 'off');
        else
            set(ok_btn, 'Enable', 'on');
        end % if
        % 261 269
        % 262 269
        % 263 269
        % 264 269
        % 265 269
        % 266 269
        % 267 269
    end % if
function allComps = populateListbox(src, evd, listbox)
    % 270 275
    % 271 275
    % 272 275
    % 273 275
    this = RptgenML.Root;
    lib = showLibrary(this);
    allComps = this.listLibraryComponents;
    for i=length(allComps):-1.0:1.0
        dispString{i} = allComps(i).getDisplayLabel;
    end % for
    % 280 282
    oldValue = get(listbox, 'value');
    % 282 289
    % 283 289
    % 284 289
    % 285 289
    % 286 289
    % 287 289
    set(listbox, 'String', dispString, 'Value', min(length(dispString), oldValue), 'UserData', allComps);
    % 289 292
    % 290 292
function figure_size = getnicedialoglocation(figure_size, figure_units)
    % 292 301
    % 293 301
    % 294 301
    % 295 301
    % 296 301
    % 297 301
    % 298 301
    % 299 301
    parentHandle = gcbf;
    propName = 'Position';
    if isempty(parentHandle)
        parentHandle = 0.0;
        propName = 'ScreenSize';
    end % if
    % 306 308
    old_u = get(parentHandle, 'Units');
    set(parentHandle, 'Units', figure_units);
    container_size = get(parentHandle, propName);
    set(parentHandle, 'Units', old_u);
    % 311 313
    figure_size(1.0) = plus(container_size(1.0), mtimes(.5, minus(container_size(3.0), figure_size(3.0))));
    figure_size(2.0) = plus(container_size(2.0), mtimes(.6666666666666666, minus(container_size(4.0), figure_size(4.0))));
