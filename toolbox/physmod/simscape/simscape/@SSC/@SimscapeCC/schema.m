function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    doTrace(false);
    if doDebug(false)
        PROP_PRIVATE_ISPUBLIC = 'off';
    else
        PROP_PRIVATE_ISPUBLIC = 'on';
    end % if
    % 12 13
    pkg = findpackage('SSC');
    % 14 15
    parentpkg = findpackage('Simulink');
    parentcls = findclass(parentpkg, 'CustomCC');
    cls = schema.class(pkg, 'SimscapeCC', parentcls);
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    propList = getClientPropertyList;
    for prop=propList
        p = schema.prop(cls, prop.Name, prop.DataType);
        p.SetFunction = prop.SetFcn;
    end % for
    % 31 32
    p = schema.prop(cls, 'SelectedTab', 'string');
    p = schema.prop(cls, 'Version', 'string');
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    p = schema.prop(cls, 'ComponentsAttached', 'bool');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicGet = PROP_PRIVATE_ISPUBLIC;
    p.AccessFlags.PublicSet = PROP_PRIVATE_ISPUBLIC;
    % 45 47
    % 46 47
    p = schema.prop(cls, 'Listener', 'handle.listener vector');
    p.AccessFlags.Serialize = 'off';
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    p.AccessFlags.PublicSet = PROP_PRIVATE_ISPUBLIC;
    % 55 57
    % 56 57
    p = schema.prop(cls, 'someListenersNotInstalled', 'bool');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicGet = PROP_PRIVATE_ISPUBLIC;
    p.AccessFlags.PublicSet = PROP_PRIVATE_ISPUBLIC;
    p.FactoryValue = true;
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    p = schema.prop(cls, 'instanceId', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    if doDebug
        p.GetFunction = @queryInstanceId;
    end % if
    % 74 76
    % 75 76
    if doDebug
        p = schema.prop(cls, 'instanceIdImpl', 'mxArray');
        p.AccessFlags.PublicSet = 'off';
        p.AccessFlags.PublicGet = 'off';
        p.AccessFlags.Serialize = 'off';
        p.AccessFlags.Copy = 'off';
    end % if
    % 83 84
    if doTrace || doDebug
        p = schema.prop(cls, 'debugMode', 'bool');
        p.FactoryValue = true;
        p.AccessFlags.PublicSet = 'off';
    end % if
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    % 94 95
    m = schema.method(cls, 'initialize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 99 100
    s.OutputTypes = {};
    % 101 104
    % 102 104
    % 103 104
    m = schema.method(cls, 'getSlMenuCustomization', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'DAStudio.CallbackInfo'};
    % 108 109
    s.OutputTypes = {'DAStudio.ToolSchema'};
    % 110 113
    % 111 113
    % 112 113
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    % 117 119
    % 118 119
    s.OutputTypes = {'mxArray'};
    % 120 127
    % 121 127
    % 122 127
    % 123 127
    % 124 127
    % 125 127
    % 126 127
    m = schema.method(cls, 'getClientClasses', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    % 131 132
    s.OutputTypes = {'mxArray'};
    % 133 136
    % 134 136
    % 135 136
    m = schema.method(cls, 'getClientProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','bool'};
    % 140 142
    % 141 142
    s.OutputTypes = {'mxArray'};
    % 143 145
    % 144 145
    m = schema.method(cls, 'getComponentName', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    % 149 150
    s.OutputTypes = {'string'};
    % 151 153
    % 152 153
    m = schema.method(cls, 'getConfigSetCC');
    % 154 158
    % 155 158
    % 156 158
    % 157 158
    s = m.Signature;
    s.varargin = 'on';
    s.InputTypes = {'handle','mxArray','int32'};
    % 161 164
    % 162 164
    % 163 164
    s.OutputTypes = {'handle','handle vector'};
    % 165 169
    % 166 169
    % 167 169
    % 168 169
    m = schema.method(cls, 'getSubComponent');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    % 173 175
    % 174 175
    s.OutputTypes = {'handle'};
    % 176 179
    % 177 179
    % 178 179
    m = schema.method(cls, 'tabChangeCallback', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','mxArray'};
    % 183 186
    % 184 186
    % 185 186
    s.OutputTypes = {};
    % 187 190
    % 188 190
    % 189 190
    m = schema.method(cls, 'preSave_pruneProducts', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    % 194 196
    % 195 196
    s.OutputTypes = {};
    % 197 200
    % 198 200
    % 199 200
    m = schema.method(cls, 'postSave_restoreProducts', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 204 205
    s.OutputTypes = {};
    % 206 211
    % 207 211
    % 208 211
    % 209 211
    % 210 211
    m = schema.method(cls, 'getActiveTab');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 215 216
    s.OutputTypes = {'mxArray'};
    % 217 220
    % 218 220
    % 219 220
    m = schema.method(cls, 'setActiveTab');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    % 224 226
    % 225 226
    s.OutputTypes = {};
    % 227 230
    % 228 230
    % 229 230
    m = schema.method(cls, 'attachAllSubComponents');
    s = m.Signature;
    s.varargin = 'on';
    s.InputTypes = {'handle','mxArray'};
    % 234 236
    % 235 236
    s.OutputTypes = {};
    % 237 239
    % 238 239
    m = schema.method(cls, 'detachAllSubComponents');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 243 244
    s.OutputTypes = {};
    % 245 250
    % 246 250
    % 247 250
    % 248 250
    % 249 250
    m = schema.method(cls, 'getSubComponentList');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 254 255
    s.OutputTypes = {'mxArray'};
    % 256 259
    % 257 259
    % 258 259
    m = schema.method(cls, 'attachToConfigSet');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','Simulink.ConfigSet'};
    % 263 265
    % 264 265
    s.OutputTypes = {};
    % 266 270
    % 267 270
    % 268 270
    % 269 270
    m = schema.method(cls, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    % 274 276
    % 275 276
    s.OutputTypes = {};
    % 277 284
    % 278 284
    % 279 284
    % 280 284
    % 281 284
    % 282 284
    % 283 284
    m = schema.method(cls, 'setListeners');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 288 289
    s.OutputTypes = {};
    % 290 293
    % 291 293
    % 292 293
    m = schema.method(cls, 'propertyChanged');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    % 297 299
    % 298 299
    s.OutputTypes = {};
    % 300 303
    % 301 303
    % 302 303
    m = schema.method(cls, 'makeCopy');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 307 308
    s.OutputTypes = {'handle'};
    % 309 312
    % 310 312
    % 311 312
    m = schema.method(cls, 'makeCleanCopy');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 316 317
    s.OutputTypes = {'handle'};
    % 318 321
    % 319 321
    % 320 321
    m = schema.method(cls, 'getBlockDiagram');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 325 326
    s.OutputTypes = {'handle'};
    % 327 330
    % 328 330
    % 329 330
    m = schema.method(cls, 'compareComponentWithChild');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    % 334 336
    % 335 336
    s.OutputTypes = {'mxArray'};
end % function
