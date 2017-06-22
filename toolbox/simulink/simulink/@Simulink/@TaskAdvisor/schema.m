function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage1 = findpackage('DAStudio');
    hDeriveFromClass1 = findclass(hDeriveFromPackage1, 'Object');
    hCreateInPackage = findpackage('Simulink');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'TaskAdvisor', hDeriveFromClass1);
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    hThisProp = schema.prop(hThisClass, 'ID', 'string');
    hThisProp.FactoryValue = '';
    % 23 25
    % 24 25
    hThisProp = schema.prop(hThisClass, 'DisplayName', 'string');
    hThisProp.FactoryValue = '';
    % 27 29
    % 28 29
    hThisProp = schema.prop(hThisClass, 'Help', 'string');
    hThisProp.FactoryValue = '';
    % 31 33
    % 32 33
    hThisProp = schema.prop(hThisClass, 'HelpMethod', 'string');
    hThisProp.FactoryValue = '';
    % 35 37
    % 36 37
    hThisProp = schema.prop(hThisClass, 'HelpArgs', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 39 41
    % 40 41
    hThisProp = schema.prop(hThisClass, 'Selected', 'bool');
    hThisProp.FactoryValue = true;
    % 43 45
    % 44 45
    hThisProp = schema.prop(hThisClass, 'Severity', 'string');
    hThisProp.FactoryValue = 'Advisory';
    % 47 49
    % 48 49
    hThisProp = schema.prop(hThisClass, 'Type', 'string');
    hThisProp.FactoryValue = '';
    % 51 53
    % 52 53
    hThisProp = schema.prop(hThisClass, 'State', 'string');
    hThisProp.FactoryValue = 'None';
    % 55 57
    % 56 57
    hThisProp = schema.prop(hThisClass, 'WaiveFailure', 'bool');
    hThisProp.FactoryValue = false;
    hThisProp.GetFunction = @getWaiveFailure;
    hThisProp.SetFunction = @setWaiveFailure;
    % 61 63
    % 62 63
    hThisProp = schema.prop(hThisClass, 'ShowWaiveFailure', 'bool');
    hThisProp.FactoryValue = false;
    % 65 68
    % 66 68
    % 67 68
    hThisProp = schema.prop(hThisClass, 'InternalState', 'string');
    hThisProp.FactoryValue = '';
    % 70 72
    % 71 72
    hThisProp = schema.prop(hThisClass, 'MAC', 'string');
    hThisProp.FactoryValue = '';
    % 74 77
    % 75 77
    % 76 77
    hThisProp = schema.prop(hThisClass, 'MAT', 'string');
    hThisProp.FactoryValue = '';
    % 79 81
    % 80 81
    hThisProp = schema.prop(hThisClass, 'MACVersion', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 83 85
    % 84 85
    hThisProp = schema.prop(hThisClass, 'Children', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 87 89
    % 88 89
    hThisProp = schema.prop(hThisClass, 'ChildrenObj', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 91 93
    % 92 93
    hThisProp = schema.prop(hThisClass, 'ParentObj', 'handle');
    % 94 96
    % 95 96
    hThisProp = schema.prop(hThisClass, 'Version', 'string');
    hThisProp.FactoryValue = '';
    % 98 100
    % 99 100
    hThisProp = schema.prop(hThisClass, 'Dependency', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 102 104
    % 103 104
    hThisProp = schema.prop(hThisClass, 'LicenseName', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 106 108
    % 107 108
    hThisProp = schema.prop(hThisClass, 'Visible', 'bool');
    hThisProp.FactoryValue = true;
    % 110 112
    % 111 112
    hThisProp = schema.prop(hThisClass, 'Enable', 'bool');
    hThisProp.FactoryValue = true;
    % 114 118
    % 115 118
    % 116 118
    % 117 118
    hThisProp = schema.prop(hThisClass, 'Value', 'MATLAB array');
    hThisProp.FactoryValue = '';
    % 120 122
    % 121 122
    hThisProp = schema.prop(hThisClass, 'ByTaskMode', 'bool');
    hThisProp.FactoryValue = false;
    % 124 126
    % 125 126
    hThisProp = schema.prop(hThisClass, 'OverwriteHTML', 'bool');
    hThisProp.FactoryValue = true;
    % 128 130
    % 129 130
    hThisProp = schema.prop(hThisClass, 'LaunchReport', 'bool');
    hThisProp.FactoryValue = false;
    % 132 139
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    % 138 139
    hThisProp = schema.prop(hThisClass, 'CheckBoxMode', 'string');
    hThisProp.FactoryValue = 'All';
    % 141 147
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    % 146 147
    hThisProp = schema.prop(hThisClass, 'Index', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 149 151
    % 150 151
    hThisProp = schema.prop(hThisClass, 'AllChildrenIndex', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 153 155
    % 154 155
    hThisProp = schema.prop(hThisClass, 'DependencyObj', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 157 159
    % 158 159
    hThisProp = schema.prop(hThisClass, 'ReverseDependencyObj', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 161 163
    % 162 163
    hThisProp = schema.prop(hThisClass, 'CallbackFcnPath', 'string');
    hThisProp.FactoryValue = '';
    % 165 168
    % 166 168
    % 167 168
    hThisProp = schema.prop(hThisClass, 'CustomDialogSchema', 'MATLAB callback');
    hThisProp.FactoryValue = [];
    % 170 172
    % 171 172
    hThisProp = schema.prop(hThisClass, 'MACIndex', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 174 176
    % 175 176
    hThisProp = schema.prop(hThisClass, 'MATIndex', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 178 180
    % 179 180
    hThisProp = schema.prop(hThisClass, 'ChildrenMACIndex', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 182 188
    % 183 188
    % 184 188
    % 185 188
    % 186 188
    % 187 188
    hThisProp = schema.prop(hThisClass, 'MAObj', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 190 194
    % 191 194
    % 192 194
    % 193 194
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 199 200
    m = schema.method(hThisClass, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 205 212
    % 206 212
    % 207 212
    % 208 212
    % 209 212
    % 210 212
    % 211 212
    m = schema.method(hThisClass, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
    % 217 218
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 223 224
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 229 230
    m = schema.method(hThisClass, 'isHierarchyReadonly');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 235 242
    % 236 242
    % 237 242
    % 238 242
    % 239 242
    % 240 242
    % 241 242
    m = schema.method(hThisClass, 'runTaskAdvisor');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 247 248
    m = schema.method(hThisClass, 'runAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 253 254
    m = schema.method(hThisClass, 'viewReport');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 259 260
    m = schema.method(hThisClass, 'isUnderDeactiveWorkflow');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 265 266
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 271 272
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 277 278
    m = schema.method(hThisClass, 'handleCheckEvent');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {};
    % 283 286
    % 284 286
    % 285 286
    m = schema.method(hThisClass, 'select', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    s.OutputTypes = {'mxArray'};
    % 291 294
    % 292 294
    % 293 294
    m = schema.method(hThisClass, 'deselect', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    s.OutputTypes = {'mxArray'};
    % 299 302
    % 300 302
    % 301 302
    m = schema.method(hThisClass, 'run', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    s.OutputTypes = {};
    % 307 310
    % 308 310
    % 309 310
    m = schema.method(hThisClass, 'toggleSourcetab', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    s.OutputTypes = {};
    % 315 318
    % 316 318
    % 317 318
    m = schema.method(hThisClass, 'closeExplorer', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    s.OutputTypes = {};
end % function
