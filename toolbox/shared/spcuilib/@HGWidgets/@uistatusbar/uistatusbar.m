function hStatusBar = uistatusbar(varargin)
    % 1 41
    % 2 41
    % 3 41
    % 4 41
    % 5 41
    % 6 41
    % 7 41
    % 8 41
    % 9 41
    % 10 41
    % 11 41
    % 12 41
    % 13 41
    % 14 41
    % 15 41
    % 16 41
    % 17 41
    % 18 41
    % 19 41
    % 20 41
    % 21 41
    % 22 41
    % 23 41
    % 24 41
    % 25 41
    % 26 41
    % 27 41
    % 28 41
    % 29 41
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    hStatusBar = HGWidgets.uistatusbar;
    % 41 43
    if eq(mod(nargin, 2.0), 1.0)
        varargin = horzcat('Parent', varargin);
    end % if
    set(hStatusBar, varargin{:});
    % 46 48
    local_CreateStatusBar(hStatusBar);
    InstallPropertyListeners(hStatusBar);
    % 49 53
    % 50 53
    % 51 53
    local_change_Visible(hStatusBar);
    local_change_AutoResize(hStatusBar);
end % function
function local_CreateStatusBar(hStatusBar)
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    if isempty(hStatusBar.parent)
        hStatusBar.parent = gcf;
    end % if
    hfig = hStatusBar.parent;
    % 64 67
    % 65 67
    hfig_pos = get(hfig, 'pos');
    region_dx = plus(hfig_pos(3.0), 2.0);
    region_dy = 22.0;
    region_pos = horzcat(0.0, 0.0, region_dx, region_dy);
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    hStatusBar.hContainer = uicontainer('parent', hfig, 'units', 'pix', 'pos', region_pos, 'HitTest', 'off', 'DeleteFcn', cellhorzcat(@DeleteContainerFcn, hStatusBar), 'tag', 'uistatusbar');
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    hStatusBar.hRegionFrame = uicontrol('parent', hStatusBar.hContainer, 'style', 'frame', 'units', 'pix', 'pos', region_pos, 'backgr', hStatusBar.BackgroundColor, 'foregr', [1.0 1.0 1.0]);
    % 84 92
    % 85 92
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    local_CreateAreas(hStatusBar);
end % function
function local_RemoveAreas(hStatusBar)
    % 94 98
    % 95 98
    % 96 98
    delete(hStatusBar.hStatusAndOptions);
end % function
function DeleteContainerFcn(hco, ev, hStatusBar)
    % 100 108
    % 101 108
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    hStatusBar.Parent = [];
    hStatusBar.hContainer = [];
    hStatusBar.hStatusAndOptions = [];
    hStatusBar.hAllOptions = [];
    hStatusBar.hRegionFrame = [];
    hStatusBar.hStatusText = [];
    hStatusBar.hOptionText = [];
    hStatusBar.listeners = [];
end % function
function local_CreateAreas(hStatusBar)
    % 117 123
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    hStatusBar.hStatusAndOptions = uicontainer('parent', hStatusBar.hContainer, 'HitTest', 'off');
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    options_region_y = 2.0;
    options_region_dy = 17.0;
    x_gutter = 4.0;
    nOpts = hStatusBar.NumOptions;
    % 132 137
    % 133 137
    % 134 137
    % 135 137
    options_region_extent = plus(sum(hStatusBar.OptionWidths), mtimes(plus(nOpts, 1.0), x_gutter));
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    region_pos = get(hStatusBar.hRegionFrame, 'position');
    region_x = region_pos(1.0);
    region_dx = region_pos(3.0);
    % 145 150
    % 146 150
    % 147 150
    % 148 150
    status_text_y = 1.0;
    status_text_dy = 16.0;
    status_text_x = plus(region_x, 2.0);
    % 152 156
    % 153 156
    % 154 156
    status_text_dx = minus(minus(region_dx, 2.0), options_region_extent);
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    hStatusBar.hStatusText = uicontrol('parent', hStatusBar.hStatusAndOptions, 'style', 'text', 'units', 'pix', 'pos', horzcat(status_text_x, status_text_y, status_text_dx, status_text_dy), 'string', '', 'horiz', 'left', 'backgr', hStatusBar.BackgroundColor, 'foregr', 'k');
    % 161 175
    % 162 175
    % 163 175
    % 164 175
    % 165 175
    % 166 175
    % 167 175
    % 168 175
    % 169 175
    % 170 175
    % 171 175
    % 172 175
    % 173 175
    options_region_x = plus(plus(status_text_x, status_text_dx), cumsum(plus(x_gutter, horzcat(0.0, hStatusBar.OptionWidths(1.0:minus(nOpts, 1.0))))));
    % 175 179
    % 176 179
    % 177 179
    hStatusBar.hAllOptions = [];
    hStatusBar.hOptionText = [];
    for i=1.0:nOpts
        pos_i = horzcat(options_region_x(i), options_region_y, hStatusBar.OptionWidths(i), options_region_dy);
        % 182 185
        % 183 185
        makeStatusBarIndent(i, hStatusBar, pos_i);
        % 185 190
        % 186 190
        % 187 190
        % 188 190
    end % for
    % 190 192
    ResizeFcn(hStatusBar);
end % function
function makeStatusBarIndent(idx, hStatusBar, pos1)
    % 194 201
    % 195 201
    % 196 201
    % 197 201
    % 198 201
    % 199 201
    hStatusBar.hAllOptions(idx) = uicontainer('parent', hStatusBar.hStatusAndOptions, 'HitTest', 'off');
    % 201 204
    % 202 204
    hParent = hStatusBar.hAllOptions(idx);
    % 204 206
    bg = hStatusBar.BackgroundColor;
    % 206 211
    % 207 211
    % 208 211
    % 209 211
    uicontrol('parent', hParent, 'style', 'frame', 'units', 'pix', 'pos', pos1, 'backgr', bg, 'foregr', [.4 .4 .4]);
    % 211 218
    % 212 218
    % 213 218
    % 214 218
    % 215 218
    % 216 218
    pos2 = pos1;
    pos2(4.0) = 1.0;
    uicontrol('parent', hParent, 'style', 'frame', 'units', 'pix', 'pos', pos2, 'backgr', [1.0 1.0 1.0], 'foregr', [1.0 1.0 1.0]);
    % 220 227
    % 221 227
    % 222 227
    % 223 227
    % 224 227
    % 225 227
    pos2 = horzcat(minus(plus(pos1(1.0), pos1(3.0)), 1.0), pos1(2.0), 1.0, pos1(4.0));
    uicontrol('parent', hParent, 'style', 'frame', 'units', 'pix', 'pos', pos2, 'backgr', [1.0 1.0 1.0], 'foregr', [1.0 1.0 1.0]);
    % 228 236
    % 229 236
    % 230 236
    % 231 236
    % 232 236
    % 233 236
    % 234 236
    hStatusBar.hOptionText(idx) = uicontrol('parent', hParent, 'style', 'text', 'units', 'pix', 'horiz', 'left', 'fontweight', 'light', 'fontsize', 8.0, 'pos', plus(pos1, [2.0 2.0 -3.0 -3.0]), 'backgr', bg, 'foregr', [0.0 0.0 0.0]);
    % 236 244
    % 237 244
    % 238 244
    % 239 244
    % 240 244
    % 241 244
    % 242 244
end % function
function InstallPropertyListeners(hStatusBar)
    % 245 252
    % 246 252
    % 247 252
    % 248 252
    % 249 252
    % 250 252
    hStatusBar.listeners = [];
    % 252 261
    % 253 261
    % 254 261
    % 255 261
    % 256 261
    % 257 261
    % 258 261
    % 259 261
    hStatusBar.listeners = handle.listener(handle(hStatusBar.parent), 'ResizeEvent', @local_ResizeEvent);
    % 261 263
    hStatusBar.listeners.CallbackTarget = hStatusBar;
    % 263 267
    % 264 267
    % 265 267
    hgw_pk = findpackage('HGWidgets');
    cl = findclass(hgw_pk, 'uistatusbar');
    prop = cl.findprop('OptionWidths');
    hStatusBar.listeners(2.0) = handle.listener(hStatusBar, prop, 'PropertyPostSet', @local_change_OptionWidths);
    % 270 272
    hStatusBar.listeners(2.0).CallbackTarget = hStatusBar;
    % 272 276
    % 273 276
    % 274 276
    prop = cl.findprop('Visible');
    hStatusBar.listeners(3.0) = handle.listener(hStatusBar, prop, 'PropertyPostSet', @local_change_Visible);
    % 277 279
    hStatusBar.listeners(3.0).CallbackTarget = hStatusBar;
    % 279 283
    % 280 283
    % 281 283
    prop = cl.findprop('AutoResize');
    hStatusBar.listeners(4.0) = handle.listener(hStatusBar, prop, 'PropertyPostSet', @local_change_AutoResize);
    % 284 286
    hStatusBar.listeners(4.0).CallbackTarget = hStatusBar;
    % 286 290
    % 287 290
    % 288 290
    prop = cl.findprop('BackgroundColor');
    hStatusBar.listeners(5.0) = handle.listener(hStatusBar, prop, 'PropertyPostSet', @local_change_BackgroundColor);
    % 291 293
    hStatusBar.listeners(5.0).CallbackTarget = hStatusBar;
end % function
function local_change_BackgroundColor(hStatusBar, ev)
    % 295 298
    % 296 298
    warning('Change in BackgroundColor not implemented')
end % function
function local_change_Visible(hStatusBar, ev)
    % 300 303
    % 301 303
    set(hStatusBar.hContainer, 'visible', hStatusBar.Visible);
    % 303 306
    % 304 306
    if strcmp(hStatusBar.AutoResize, 'on') && strcmp(hStatusBar.Visible, 'on')
        hStatusBar.ResizeFcn;
    end % if
end % function
function local_change_AutoResize(hStatusBar, ev)
    % 310 313
    % 311 313
    hStatusBar.listeners(1.0).Enable = hStatusBar.AutoResize;
    % 313 316
    % 314 316
    if strcmp(hStatusBar.AutoResize, 'on')
        hStatusBar.ResizeFcn;
    end % if
end % function
function local_ResizeEvent(hStatusBar, eventStruct)
    % 320 323
    % 321 323
    hStatusBar.ResizeFcn;
end % function
function local_change_OptionWidths(hStatusBar, ev)
    % 325 328
    % 326 328
    local_RemoveAreas(hStatusBar);
    local_CreateAreas(hStatusBar);
end % function
