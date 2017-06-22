function libElement = libdlg(libH, varargin)
    % 1 34
    % 2 34
    % 3 34
    % 4 34
    % 5 34
    % 6 34
    % 7 34
    % 8 34
    % 9 34
    % 10 34
    % 11 34
    % 12 34
    % 13 34
    % 14 34
    % 15 34
    % 16 34
    % 17 34
    % 18 34
    % 19 34
    % 20 34
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
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
    % 43 45
    if ne(mod(length(varargin), 2.0), 0.0)
        % 45 47
        error('Arguments to COMPDLG must come param/value in pairs.')
    end % if
    for i=1.0:2.0:length(varargin)
        switch lower(varargin{i})
        case 'name'
            figname = varargin{plus(i, 1.0)};
        case 'promptstring'
            promptstring = varargin{plus(i, 1.0)};
            % 55 62
            % 56 62
            % 57 62
            % 58 62
            % 59 62
            % 60 62
        case 'listsize'
            % 61 63
            listsize = varargin{plus(i, 1.0)};
            % 64 66
        case 'initialvalue'
            % 65 67
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
    % 81 83
    if isstr(promptstring)
        promptstring = cellstr(promptstring);
    end % if
    % 85 87
    if isempty(initialvalue)
        initialvalue = 1.0;
    end % if
    % 89 91
    ex = mtimes(get(0.0, 'defaultuicontrolfontsize'), 1.7);
    % 91 93
    fp = get(0.0, 'defaultfigureposition');
    w = plus(mtimes(2.0, plus(fus, ffs)), listsize(1.0));
    h = plus(plus(plus(plus(plus(mtimes(2.0, ffs), mtimes(6.0, fus)), mtimes(ex, length(promptstring))), listsize(2.0)), uh), mtimes(eq(smode, 2.0), plus(fus, uh)));
    fp = horzcat(fp(1.0), minus(plus(fp(2.0), fp(4.0)), h), w, h);
    % 96 98
    fig_props = cellhorzcat('name', figname, 'color', get(0.0, 'defaultUicontrolBackgroundColor'), 'resize', 'off', 'numbertitle', 'off', 'menubar', 'none', 'windowstyle', 'modal', 'visible', 'off', 'createfcn', '', 'position', fp, 'closerequestfcn', 'delete(gcbf)');
    % 98 112
    % 99 112
    % 100 112
    % 101 112
    % 102 112
    % 103 112
    % 104 112
    % 105 112
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    fig = figure(fig_props{:});
    % 112 114
    if gt(length(promptstring), 0.0)
        prompt_text = uicontrol('style', 'text', 'string', promptstring, 'horizontalalignment', 'left', 'position', horzcat(plus(ffs, fus), minus(fp(4.0), plus(plus(ffs, fus), mtimes(ex, length(promptstring)))), listsize(1.0), mtimes(ex, length(promptstring))));
        % 115 119
        % 116 119
        % 117 119
    end % if
    % 119 121
    btn_wid = mrdivide(minus(minus(fp(3.0), mtimes(2.0, plus(ffs, fus))), fus), 2.0);
    % 121 124
    % 122 124
    frameh = uicontrol('style', 'frame', 'position', horzcat(minus(plus(ffs, fus), 1.0), minus(plus(ffs, fus), 1.0), plus(btn_wid, 2.0), plus(uh, 2.0)), 'backgroundcolor', 'k');
    % 124 128
    % 125 128
    % 126 128
    listbox = uicontrol('style', 'listbox', 'position', horzcat(plus(ffs, fus), plus(plus(plus(ffs, uh), mtimes(4.0, fus)), mtimes(eq(smode, 2.0), plus(fus, uh))), listsize), 'string', cellhorzcat(xlate('Finding components...')), 'backgroundcolor', 'w', 'max', smode, 'tag', 'listbox', 'value', initialvalue);
    % 128 140
    % 129 140
    % 130 140
    % 131 140
    % 132 140
    % 133 140
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    ok_btn = uicontrol('style', 'pushbutton', 'Enable', 'off', 'string', okstring, 'position', horzcat(plus(ffs, fus), plus(ffs, fus), btn_wid, uh), 'callback', cellhorzcat(@doOK, listbox));
    % 140 147
    % 141 147
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    cancel_btn = uicontrol('style', 'pushbutton', 'string', cancelstring, 'position', horzcat(plus(plus(ffs, mtimes(2.0, fus)), btn_wid), plus(ffs, fus), btn_wid, uh), 'callback', cellhorzcat(@doCancel, listbox));
    % 147 166
    % 148 166
    % 149 166
    % 150 166
    % 151 166
    % 152 166
    % 153 166
    % 154 166
    % 155 166
    % 156 166
    % 157 166
    % 158 166
    % 159 166
    % 160 166
    % 161 166
    % 162 166
    % 163 166
    % 164 166
    set(horzcat(fig, listbox, ok_btn, cancel_btn), 'keypressfcn', cellhorzcat(@doKeypress, listbox))
    % 166 168
    set(fig, 'position', getnicedialoglocation(fp, get(fig, 'Units')));
    % 168 171
    % 169 171
    movegui(fig)
    set(fig, 'visible', 'on');
    drawnow;
    allComps = populateListbox([], [], listbox, libH);
    set(listbox, 'callback', cellhorzcat(@doListboxClick, ok_btn));
    % 175 181
    % 176 181
    % 177 181
    % 178 181
    % 179 181
    allCategories = find(allComps, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory');
    l = handle.listener(allCategories, findprop(allCategories(1.0), 'Expanded'), 'PropertyPostSet', cellhorzcat(@populateListbox, listbox, libH));
    % 182 185
    % 183 185
    try
        uiwait(fig);
    catch
        if ishandle(fig)
            delete(fig)
        end % if
    end % try
    % 191 193
    if isappdata(0.0, 'ListDialogAppData')
        ad = getappdata(0.0, 'ListDialogAppData');
        libElement = ad.selection;
        rmappdata(0.0, 'ListDialogAppData')
    else
        % 197 199
        libElement = [];
    end % if
function doKeypress(fig_h, evd, listbox)
    % 201 207
    % 202 207
    % 203 207
    % 204 207
    % 205 207
    switch evd.Key
    case {'return','space'}
        doOK([], [], listbox);
    case 'escape'
        doCancel([], [], listbox);
    end % switch
function doOK(ok_btn, evd, listbox)
    % 213 217
    % 214 217
    % 215 217
    selectIdx = get(listbox, 'value');
    selectObj = get(listbox, 'UserData');
    if isempty(selectObj)
        % 219 221
        return;
    end % if
    % 222 224
    selectObj = selectObj(selectIdx);
    % 224 226
    if isa(selectObj, 'RptgenML.LibraryCategory')
        selectObj.exploreAction;
    else
        % 228 230
        ad.selection = selectObj;
        setappdata(0.0, 'ListDialogAppData', ad)
        delete(gcbf);
    end % if
function doCancel(cancel_btn, evd, listbox)
    % 234 237
    % 235 237
    ad.selection = [];
    setappdata(0.0, 'ListDialogAppData', ad)
    delete(gcbf);
function doSelectAll(selectall_btn, evd, listbox)
    % 240 242
    set(selectall_btn, 'enable', 'off')
    set(listbox, 'value', 1.0:length(get(listbox, 'string')));
function doListboxClick(listbox, evd, ok_btn, selectall_btn)
    % 244 247
    % 245 247
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
        % 256 264
        % 257 264
        % 258 264
        % 259 264
        % 260 264
        % 261 264
        % 262 264
    end % if
function allLibElements = populateListbox(src, evd, listbox, lib)
    % 265 269
    % 266 269
    % 267 269
    allLibElements = lib.getChildren;
    for i=length(allLibElements):-1.0:1.0
        dispString{i} = allLibElements(i).getDisplayLabel;
    end % for
    % 272 274
    oldValue = get(listbox, 'value');
    % 274 281
    % 275 281
    % 276 281
    % 277 281
    % 278 281
    % 279 281
    set(listbox, 'String', dispString, 'Value', min(length(dispString), oldValue), 'UserData', allLibElements);
    % 281 284
    % 282 284
function figure_size = getnicedialoglocation(figure_size, figure_units)
    % 284 293
    % 285 293
    % 286 293
    % 287 293
    % 288 293
    % 289 293
    % 290 293
    % 291 293
    parentHandle = gcbf;
    propName = 'Position';
    if isempty(parentHandle)
        parentHandle = 0.0;
        propName = 'ScreenSize';
    end % if
    % 298 300
    old_u = get(parentHandle, 'Units');
    set(parentHandle, 'Units', figure_units);
    container_size = get(parentHandle, propName);
    set(parentHandle, 'Units', old_u);
    % 303 305
    figure_size(1.0) = plus(container_size(1.0), mtimes(.5, minus(container_size(3.0), figure_size(3.0))));
    figure_size(2.0) = plus(container_size(2.0), mtimes(.6666666666666666, minus(container_size(4.0), figure_size(4.0))));
