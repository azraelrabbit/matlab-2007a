function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    doTrace(false);
    if doDebug(false)
        visibleParam = 'on';
    else
        visibleParam = 'off';
    end % if
    % 13 14
    loadSimulink = findpackage('Simulink');
    % 15 16
    pkg = findpackage('SSC');
    c = schema.class(pkg, 'RunTimeModule');
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if isempty(findtype('SSC_RTM_DialogParameterType'))
        schema.EnumType('SSC_RTM_DialogParameterType', doGetDialogParameterTypeValues);
        % 26 27
    end % if
    % 28 30
    % 29 30
    if isempty(findtype('SSC_RTM_EditingModeType'))
        schema.EnumType('SSC_RTM_EditingModeType', doGetEditingModeTypeValues);
        % 32 33
    end % if
    % 34 36
    % 35 36
    if isempty(findtype('SSC_RTM_PreferredLoadModeType'))
        schema.EnumType('SSC_RTM_PreferredLoadModeType', doGetPreferredLoadModeTypeValues);
        % 38 39
    end % if
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    m = schema.method(c, 'canPerformOperation');
    s = m.Signature;
    s.Varargin = 'on';
    s.InputTypes = {'handle','handle','SSC_CallbackType','mxArray'};
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    s.OutputTypes = {'bool'};
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    m = schema.method(c, 'isParameterEnabled');
    s = m.Signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle','SSC_RTM_DialogParameterType'};
    % 64 67
    % 65 67
    % 66 67
    s.OutputTypes = {'bool'};
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    m = schema.method(c, 'getModelEditingMode', 'static');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle'};
    % 78 79
    s.OutputTypes = {'SSC_RTM_EditingModeType','bool'};
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    m = schema.method(c, 'setModelEditingMode');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle','SSC_RTM_EditingModeType'};
    % 88 91
    % 89 91
    % 90 91
    s.OutputTypes = {'bool'};
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    % 96 97
    m = schema.method(c, 'update', 'static');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'string','handle'};
    % 101 103
    % 102 103
    s.OutputTypes = {'bool'};
    % 104 112
    % 105 112
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    % 111 112
    m = schema.method(c, 'denyProductLicense', 'static');
    s = m.signature;
    s.Varargin = 'on';
    s.InputTypes = {'mxArray'};
    % 116 117
    s.OutputTypes = {'mxArray'};
    % 118 122
    % 119 122
    % 120 122
    % 121 122
    m = schema.method(c, 'getParamTypeEnum', 'static');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'string'};
    % 126 127
    s.OutputTypes = {'SSC_RTM_DialogParameterType'};
    % 128 132
    % 129 132
    % 130 132
    % 131 132
    m = schema.method(c, 'getPreferredLoadModeTypeValues', 'static');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'mxArray'};
    % 136 137
    s.OutputTypes = {'mxArray'};
    % 138 142
    % 139 142
    % 140 142
    % 141 142
    m = schema.method(c, 'setPreferredLoadMode', 'static');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'SSC_RTM_PreferredLoadModeType'};
    % 146 147
    s.OutputTypes = {};
    % 148 152
    % 149 152
    % 150 152
    % 151 152
    m = schema.method(c, 'getPreferredLoadMode', 'static');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {};
    % 156 157
    s.OutputTypes = {'SSC_RTM_PreferredLoadModeType'};
    % 158 161
    % 159 161
    % 160 161
    m = schema.method(c, 'getCCPropertyList', 'static');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {};
    % 165 166
    s.OutputTypes = {'MATLAB array'};
    % 167 170
    % 168 170
    % 169 170
    fgPkg = findpackage('DAStudio');
    m = schema.method(c, 'getSlMenuCustomization', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'DAStudio.CallbackInfo'};
    % 175 176
    s.OutputTypes = {'DAStudio.ToolSchema'};
    % 177 180
    % 178 180
    % 179 180
    m = schema.method(c, 'blockGetParameterModes', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'mxArray'};
    % 184 185
    s.OutputTypes = {'mxArray'};
    % 186 189
    % 187 189
    % 188 189
    m = schema.method(c, 'getInstance', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {};
    % 193 194
    s.OutputTypes = {'handle'};
    % 195 198
    % 196 198
    % 197 198
    m = schema.method(c, 'determineModelProducts', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 202 203
    s.OutputTypes = {'mxArray'};
    % 204 208
    % 205 208
    % 206 208
    % 207 208
    m = schema.method(c, 'determineBlockProduct', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 212 213
    s.OutputTypes = {'mxArray'};
    % 214 217
    % 215 217
    % 216 217
    m = schema.method(c, 'getBlockDiagram', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 221 222
    s.OutputTypes = {'Simulink.BlockDiagram'};
    % 223 233
    % 224 233
    % 225 233
    % 226 233
    % 227 233
    % 228 233
    % 229 233
    % 230 233
    % 231 233
    % 232 233
    p = schema.prop(c, 'classDate', 'string');
    p.Visible = visibleParam;
    p.FactoryValue = datestr(now);
    % 236 237
    p = schema.prop(c, 'objectDate', 'string');
    p.Visible = visibleParam;
    % 239 242
    % 240 242
    % 241 242
    db = SSC.RtmModelRegistry;
    p = schema.prop(c, 'modelRegistry', class(db));
    p.Visible = visibleParam;
    p.FactoryValue = db;
    % 246 248
    % 247 248
    m = schema.method(c, 'propertySetFcn_editingMode', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    % 252 254
    % 253 254
    s.OutputTypes = {};
    % 255 257
    % 256 257
    if doTrace || doDebug
        p = schema.prop(c, 'debugMode', 'bool');
        p.FactoryValue = true;
        p.AccessFlags.PublicSet = 'off';
    end % if
end % function
