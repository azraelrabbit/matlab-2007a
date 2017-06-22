function hStatusBar = uistatusbase(varargin)
    % 1 50
    % 2 50
    % 3 50
    % 4 50
    % 5 50
    % 6 50
    % 7 50
    % 8 50
    % 9 50
    % 10 50
    % 11 50
    % 12 50
    % 13 50
    % 14 50
    % 15 50
    % 16 50
    % 17 50
    % 18 50
    % 19 50
    % 20 50
    % 21 50
    % 22 50
    % 23 50
    % 24 50
    % 25 50
    % 26 50
    % 27 50
    % 28 50
    % 29 50
    % 30 50
    % 31 50
    % 32 50
    % 33 50
    % 34 50
    % 35 50
    % 36 50
    % 37 50
    % 38 50
    % 39 50
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    hStatusBar = spcwidgets.uistatusbase;
    if eq(mod(nargin, 2.0), 1.0)
        varargin = horzcat('Parent', varargin);
    end
    set(hStatusBar, varargin{:});
    installSetFunctions(hStatusBar);
    localInit(hStatusBar);
end
function localInit(hStatusBar)
    % 58 62
    % 59 62
    % 60 62
    createStatusBar(hStatusBar);
    installPropertyListeners(hStatusBar);
end
function installSetFunctions(hStatusBar)
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    p = findprop(hStatusBar, 'Visible');
    p.SetFunction = @sf_Visible;
end
function createStatusBar(hStatusBar)
    % 74 88
    % 75 88
    % 76 88
    % 77 88
    % 78 88
    % 79 88
    % 80 88
    % 81 88
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    hParent = hStatusBar.parent;
    if isempty(hParent)
        hParent = gcf;
    end
    if isa(handle(hParent), 'figure')
        % 92 103
        % 93 103
        % 94 103
        % 95 103
        % 96 103
        % 97 103
        % 98 103
        % 99 103
        % 100 103
        % 101 103
        hWidgetObj = handle(hParent);
        % 103 105
        if isempty(findprop(hWidgetObj, 'hFlowContainer'))
            hFlow = uiflowcontainer('parent', hParent, 'flowdirection', 'bottomup', 'margin', 2.0);
            % 106 109
            % 107 109
            hParent = uicontainer('parent', hFlow);
            % 109 112
            % 110 112
            hg_pkg = findpackage('hg');
            findclass(hg_pkg, 'uiflowcontainer');
            schema.prop(hWidgetObj, 'hFlowContainer', 'hg.uiflowcontainer');
            hWidgetObj.hFlowContainer = hFlow;
            % 115 117
            findclass(hg_pkg, 'uicontainer');
            schema.prop(hWidgetObj, 'hStatusParent', 'hg.uicontainer');
            hWidgetObj.hStatusParent = hParent;
        else
            hParent = hWidgetObj.hStatusParent;
        end
        % 122 131
        % 123 131
        % 124 131
        % 125 131
        % 126 131
        % 127 131
        % 128 131
        % 129 131
    end
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
    optHeight = 18.0;
    allHeight = plus(plus(optHeight, 1.0), 4.0);
    allStatus = uiflowcontainer('parent', hParent, 'visible', hStatusBar.visible, 'flowdirection', 'bottomup');
    % 144 147
    % 145 147
    hStatusBar.hContainer = allStatus;
    % 147 154
    % 148 154
    % 149 154
    % 150 154
    % 151 154
    % 152 154
    set(handle(hParent), 'HeightLimits', horzcat(allHeight, allHeight));
    % 154 160
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    statusbar = uicontainer('parent', allStatus);
    set(handle(statusbar), 'HeightLimits', horzcat(optHeight, optHeight));
    % 161 164
    % 162 164
    topline = uipanel('parent', allStatus, 'bordertype', 'none', 'background', 'w');
    % 164 167
    % 165 167
    set(handle(topline), 'HeightLimits', [1.0 1.0]);
    % 167 170
    % 168 170
    hStatusFlow = uiflowcontainer('parent', statusbar, 'flowdirection', 'lefttoright', 'backgroundcolor', 'none', 'margin', 1.0);
    % 170 176
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    hStatusBar.hStatusText = uicontrol('parent', hStatusFlow, 'style', 'text', 'string', '', 'horiz', 'left');
    % 176 182
    % 177 182
    % 178 182
    % 179 182
    % 180 182
    hStatusBar.hOptionText = [];
    nOpts = hStatusBar.NumOptions;
    for idx=1.0:nOpts
        w = hStatusBar.OptionWidths(idx);
        hOptPanel = uipanel('parent', hStatusFlow, 'hittest', 'off', 'bordertype', 'beveledin', 'highlight', 'w', 'shadow', [.4 .4 .4]);
        % 186 192
        % 187 192
        % 188 192
        % 189 192
        % 190 192
        set(handle(hOptPanel), 'WidthLimits', horzcat(w, w));
        hOptTxt = uicontrol('parent', hOptPanel, 'style', 'text', 'string', '', 'units', 'pix', 'pos', horzcat(2.0, 1.0, minus(w, 3.0), minus(optHeight, 4.0)), 'horiz', 'left');
        % 193 200
        % 194 200
        % 195 200
        % 196 200
        % 197 200
        % 198 200
        hStatusBar.hAllOptions(idx) = hOptPanel;
        hStatusBar.hOptionText(idx) = hOptTxt;
        % 201 206
        % 202 206
        % 203 206
        % 204 206
        schema.prop(handle(hOptTxt), 'OptionTruncate', 'on/off');
        set(hOptTxt, 'OptionTruncate', 'off');
        % 207 210
        % 208 210
        schema.prop(handle(hOptTxt), 'OptionOrigString', 'string');
        set(hOptTxt, 'OptionOrigString', '');
    end % for
    % 212 215
    % 213 215
    str = ' ';
    if strcmp(computer, 'PCWIN') || strcmp(computer, 'PCWIN64')
        str = 'o';
    end
    % 218 220
    if strcmpi(hStatusBar.GrabBar, 'on')
        g = 12.0;
        hGrab = uicontainer('parent', hStatusFlow);
        set(handle(hGrab), 'WidthLimits', horzcat(g, g));
        h = uicontrol('parent', hGrab, 'style', 'text', 'units', 'pix', 'horiz', 'left', 'fontname', 'Marlett', 'fontweight', 'bold', 'fontsize', 12.0, 'enable', 'on', 'string', str, 'pos', [0.0 -5.0 20.0 19.0], 'foregr', [.5 .5 .5]);
        % 224 238
        % 225 238
        % 226 238
        % 227 238
        % 228 238
        % 229 238
        % 230 238
        % 231 238
        % 232 238
        % 233 238
        % 234 238
        % 235 238
        % 236 238
        ex = get(h, 'extent');
        if gt(ex(4.0), 20.0)
            set(h, 'vis', 'off');
        end
    end
end
function installPropertyListeners(hStatusBar)
    % 244 251
    % 245 251
    % 246 251
    % 247 251
    % 248 251
    % 249 251
    delete(hStatusBar.listeners);
    hStatusBar.listeners = [];
    % 252 254
    hStatusBar.listeners = handle.listener(hStatusBar, hStatusBar.findprop('OptionWidths'), 'PropertyPostSet', @(h,e)Redraw(hStatusBar));
    % 254 258
    % 255 258
    % 256 258
    hStatusBar.listeners(2.0) = handle.listener(hStatusBar, hStatusBar.findprop('GrabBar'), 'PropertyPostSet', @(h,e)Redraw(hStatusBar));
    % 258 260
end
function val = sf_Visible(hStatusBar, val)
    % 261 269
    % 262 269
    % 263 269
    % 264 269
    % 265 269
    % 266 269
    % 267 269
    set(hStatusBar.hContainer, 'visible', val);
end
function Redraw(hStatusBar)
    % 271 276
    % 272 276
    % 273 276
    % 274 276
    optionCache = OptionCache(hStatusBar);
    statusCache = StatusCache(hStatusBar);
    % 277 290
    % 278 290
    % 279 290
    % 280 290
    % 281 290
    % 282 290
    % 283 290
    % 284 290
    % 285 290
    % 286 290
    % 287 290
    % 288 290
    udCache = get(hStatusBar.hContainer, 'userdata');
    % 290 294
    % 291 294
    % 292 294
    delete(hStatusBar);
    % 294 297
    % 295 297
    localInit(hStatusBar);
    % 297 305
    % 298 305
    % 299 305
    % 300 305
    % 301 305
    % 302 305
    % 303 305
    set(hStatusBar.hContainer, 'userdata', udCache);
    % 305 308
    % 306 308
    drawnow('expose');
    StatusRestore(hStatusBar, statusCache);
    OptionRestore(hStatusBar, optionCache);
end
