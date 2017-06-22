function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('uimgr');
    this = schema.class(pkg, 'uiitem');
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    p = schema.prop(this, 'Enable', 'on/off');
    p.FactoryValue = 'on';
    p.SetFunction = @sf_Enable;
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    schema.prop(this, 'Parent', 'handle');
    % 22 24
    % 23 24
    schema.prop(this, 'Name', 'string');
    % 25 44
    % 26 44
    % 27 44
    % 28 44
    % 29 44
    % 30 44
    % 31 44
    % 32 44
    % 33 44
    % 34 44
    % 35 44
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    p = schema.prop(this, 'Placement', 'double');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @sf_Placement;
    p.GetFunction = @gf_Placement;
    % 48 58
    % 49 58
    % 50 58
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    % 57 58
    p = schema.prop(this, 'StateName', 'string');
    p.FactoryValue = '';
    % 60 63
    % 61 63
    % 62 63
    p = schema.prop(this, 'Type', 'string');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_Type;
    p.SetFunction = @sf_Type;
    % 67 69
    % 68 69
    p = schema.prop(this, 'Visible', 'on/off');
    p.FactoryValue = 'on';
    p.SetFunction = @sf_Visible;
    % 72 74
    % 73 74
    schema.prop(this, 'WidgetFcn', 'MATLAB array');
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    p = schema.prop(this, 'WidgetHandle', 'MATLAB array');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @sf_widgethandle;
    p.GetFunction = @gf_widgethandle;
    % 83 91
    % 84 91
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    p = schema.prop(this, 'WidgetProperties', 'MATLAB array');
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    % 96 97
    p = schema.prop(this, 'ActualPlacement', 'double');
    p.FactoryValue = 0.0;
    p.Visible = 'off';
    % 100 107
    % 101 107
    % 102 107
    % 103 107
    % 104 107
    % 105 107
    % 106 107
    p = schema.prop(this, 'AllowSelectionConstraint', 'bool');
    p.FactoryValue = true;
    p.Visible = 'off';
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    % 115 116
    p = schema.prop(this, 'AllowWidgetFcnArg', 'bool');
    p.FactoryValue = true;
    p.Visible = 'off';
    % 119 122
    % 120 122
    % 121 122
    p = schema.prop(this, 'AppData', 'MATLAB array');
    p.Visible = 'off';
    % 124 127
    % 125 127
    % 126 127
    p = schema.prop(this, 'AutoPlacement', 'bool');
    p.FactoryValue = true;
    p.Visible = 'off';
    % 130 132
    % 131 132
    pkg.findclass('uiexplorer');
    p = schema.prop(this, 'Explorer', 'uimgr.uiexplorer');
    p.Visible = 'off';
    % 135 138
    % 136 138
    % 137 138
    p = schema.prop(this, 'GraphicalParent', 'handle');
    p.Visible = 'off';
    % 140 146
    % 141 146
    % 142 146
    % 143 146
    % 144 146
    % 145 146
    p = schema.prop(this, 'hWidget', 'MATLAB array');
    p.Visible = 'off';
    % 148 151
    % 149 151
    % 150 151
    p = schema.prop(this, 'isGroup', 'bool');
    p.FactoryValue = false;
    p.Visible = 'off';
    % 154 157
    % 155 157
    % 156 157
    p = schema.prop(this, 'isFirstPlace', 'bool');
    p.FactoryValue = false;
    p.Visible = 'off';
    % 160 165
    % 161 165
    % 162 165
    % 163 165
    % 164 165
    p = schema.prop(this, 'RenderCache', 'MATLAB array');
    p.FactoryValue = {};
    p.Visible = 'off';
    % 168 174
    % 169 174
    % 170 174
    % 171 174
    % 172 174
    % 173 174
    p = schema.prop(this, 'CustomPropertyCacheList', 'string vector');
    p.FactoryValue = {};
    p.Visible = 'off';
    % 177 181
    % 178 181
    % 179 181
    % 180 181
    p = schema.prop(this, 'CustomRenderCache', 'MATLAB array');
    p.FactoryValue = {};
    p.Visible = 'off';
    % 184 187
    % 185 187
    % 186 187
    p = schema.prop(this, 'Separator', 'on/off');
    p.FactoryValue = 'on';
    % 189 190
    p.Visible = 'off';
    % 191 193
    % 192 193
    findclass(pkg, 'uisynclist');
    p = schema.prop(this, 'SyncList', 'uimgr.uisynclist');
    p.Visible = 'off';
end % function
function val = gf_Placement(h, val)
    % 198 202
    % 199 202
    % 200 202
    % 201 202
    val = h.ActualPlacement;
end % function
function val = sf_Placement(h, val)
    % 205 207
    % 206 207
    h.ActualPlacement = val;
    h.AutoPlacement = false;
end % function
function val = sf_Enable(h, val)
    % 211 213
    % 212 213
    updateEnable(h, val);
end % function
function val = sf_Visible(h, val)
    % 216 218
    % 217 218
    priv_updateVisible(h, val);
end % function
function val = sf_widgethandle(h, val)
    % 221 222
    error('uimgr:ReadOnly', 'WidgetHandle property is read-only.');
end % function
function val = gf_widgethandle(h, val)
    % 225 227
    % 226 227
    val = h.hWidget;
end % function
function val = gf_Type(h, val)
    % 230 231
    s = class(h);
    idx = find(eq(s, '.'));
    if isempty(idx)
        val = s;
    else
        val = s(plus(idx, 1.0):end);
    end % if
end % function
function val = sf_Type(h, val)
    error('uimgr:ReadOnly', 'Type property is read-only.');
end % function
