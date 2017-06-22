function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock;
    % 9 11
    pk = findpackage('hdlcoderui');
    parentcls = findclass(findpackage('Simulink'), 'CustomCC');
    % 12 15
    % 13 15
    c = schema.class(pk, 'hdlcc', parentcls);
    % 15 17
    if hdlcoderui.isslhdlcinstalled
        % 17 20
        % 18 20
        p = schema.prop(c, 'HDLConfigFile', 'mxArray');
        set(p, 'FactoryValue', {' '}, 'Visible', 'off');
        set(p, 'SetFunction', @set_HDLConfigFile);
        % 22 25
        % 23 25
        p = schema.prop(c, 'HDLConfigFileStr', 'string');
        % 25 28
        % 26 28
        p.AccessFlags.Serialize = 'off';
        set(p, 'SetFunction', @set_HDLConfigFileStr, 'GetFunction', @get_HDLConfigFileStr, 'Visible', 'off');
        % 29 37
        % 30 37
        % 31 37
        % 32 37
        % 33 37
        % 34 37
        % 35 37
        findclass(findpackage('slhdlcoder'), 'HDLCoder');
        p = schema.prop(c, 'HDLCoder', 'slhdlcoder.HDLCoder');
        p.AccessFlags.PublicSet = 'off';
        p.AccessFlags.Serialize = 'off';
        % 40 42
        set(p, 'SetFunction', @set_HDLCoder, 'Visible', 'off');
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        p = schema.prop(c, 'CodeGenOptions', 'int');
        p.AccessFlags.PublicSet = 'off';
        % 48 50
        p.AccessFlags.Serialize = 'off';
        p.AccessFlags.Init = 'off';
        set(p, 'SetFunction', @set_CodeGenOptions, 'GetFunction', @get_CodeGenOptions, 'Visible', 'off');
        % 52 56
        % 53 56
        % 54 56
        p = schema.prop(c, 'TargetDirectory', 'string');
        p.AccessFlags.PublicSet = 'off';
        % 57 59
        p.AccessFlags.Serialize = 'off';
        p.AccessFlags.Init = 'off';
        set(p, 'SetFunction', @set_TargetDirectory, 'GetFunction', @get_TargetDirectory, 'Visible', 'off');
        % 61 69
        % 62 69
        % 63 69
        % 64 69
        % 65 69
        % 66 69
        % 67 69
        p = schema.prop(c, 'HDLCActiveTab', 'int');
        set(p, 'FactoryValue', 0.0, 'Visible', 'off');
        % 70 74
        % 71 74
        % 72 74
        p = schema.prop(c, 'SubComponents', 'mxArray');
        p.AccessFlags.PublicSet = 'off';
        % 75 77
        p.AccessFlags.Serialize = 'off';
        set(p, 'Visible', 'off');
        % 78 82
        % 79 82
        % 80 82
        p = schema.prop(c, 'mdlName', 'string');
        set(p, 'FactoryValue', '', 'Visible', 'off');
        p.AccessFlags.Serialize = 'off';
        % 84 100
        % 85 100
        % 86 100
        % 87 100
        % 88 100
        % 89 100
        % 90 100
        % 91 100
        % 92 100
        % 93 100
        % 94 100
        % 95 100
        % 96 100
        % 97 100
        % 98 100
        lp = schema.prop(c, 'HDLListener', 'handle.listener vector');
        lp.AccessFlags.PublicSet = 'on';
        lp.AccessFlags.PublicGet = 'on';
        lp.AccessFlags.Serialize = 'off';
        set(lp, 'Visible', 'off');
        % 104 106
        if isempty(findtype('CodeGenerationOutputType'))
            schema.EnumType('CodeGenerationOutputType', {'GenerateHDLCode','DisplayGeneratedModelOnly','GenerateHDLCodeAndDisplayGeneratedModel'});
            % 107 111
            % 108 111
            % 109 111
        end % if
        % 111 113
    end % if
    % 113 118
    % 114 118
    % 115 118
    % 116 118
    m = schema.method(c, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 122 124
    m = schema.method(c, 'dialogCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
    % 128 130
    m = schema.method(c, 'compareComponentWithChild');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 134 136
    m = schema.method(c, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 140 142
    m = schema.method(c, 'isVisible');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 146 148
    m = schema.method(c, 'registerEventsForModel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 152 154
    m = schema.method(c, 'getModelName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 158 161
    % 159 161
    hPreSetListener = handle.listener(c, c.Properties, 'PropertyPreSet', @preSetFcn_Prop);
    % 161 165
    % 162 165
    % 163 165
    schema.prop(m, 'PreSetListener', 'handle');
    m.PreSetListener = hPreSetListener;
end % function
function hdlfile = set_HDLConfigFileStr(this, hdlfile)
    % 168 173
    % 169 173
    % 170 173
    % 171 173
    if isempty(this.HDLConfigFile)
        this.HDLConfigFile{1.0} = hdlfile;
    else
        this.HDLConfigFile{end} = hdlfile;
    end % if
end % function
function hdlfile = get_HDLConfigFileStr(this, hdlfile)
    % 179 182
    % 180 182
    if not(isempty(this.HDLConfigFile))
        hdlfile = this.HDLConfigFile{end};
    else
        hdlfile = '';
    end % if
end % function
function value = set_CodeGenOptions(this, value)
    % 188 192
    % 189 192
    % 190 192
    switch value
    case 0.0
        this.HDLCoder.CoderParameterObject.CLI.CodeGenerationOutput = 'GenerateHDLCode';
    case 1.0
        this.HDLCoder.CoderParameterObject.CLI.CodeGenerationOutput = 'DisplayGeneratedModelOnly';
    case 2.0
        this.HDLCoder.CoderParameterObject.CLI.CodeGenerationOutput = 'GenerateHDLCodeAndDisplayGeneratedModel';
    end % switch
end % function
function value = get_CodeGenOptions(this, value)
    % 201 205
    % 202 205
    % 203 205
    switch this.HDLCoder.CoderParameterObject.CLI.CodeGenerationOutput
    case 'GenerateHDLCode'
        value = 0.0;
    case 'DisplayGeneratedModelOnly'
        value = 1.0;
    case 'GenerateHDLCodeAndDisplayGeneratedModel'
        value = 2.0;
    end % switch
end % function
function value = set_TargetDirectory(this, value)
    % 214 218
    % 215 218
    % 216 218
    this.HDLCoder.CoderParameterObject.CLI.TargetDirectory = value;
end % function
function value = get_TargetDirectory(this, value)
    % 220 224
    % 221 224
    % 222 224
    value = this.HDLCoder.CoderParameterObject.CLI.TargetDirectory;
end % function
function hdlcoder = set_HDLCoder(this, hdlcoder)
    % 226 235
    % 227 235
    % 228 235
    % 229 235
    % 230 235
    % 231 235
    % 232 235
    % 233 235
    if isempty(this.mdlName)
        modelName = getModelName(this);
    else
        modelName = this.mdlName;
    end % if
    % 239 241
    if isempty(strfind(horzcat(hdlcoder.StartNodeName, '/'), horzcat(modelName, '/'))) || ne(strfind(horzcat(hdlcoder.StartNodeName, '/'), horzcat(modelName, '/')), 1.0)
        hdlcoder = slhdlcoder.HDLCoder;
        hdlcoder.updateStartNodeName(modelName);
        % 243 249
        % 244 249
        % 245 249
        % 246 249
        % 247 249
    end % if
end % function
function valueOut = set_HDLConfigFile(this, value)
    % 251 254
    % 252 254
    errmsg = 'HDLConfigFile must be a cell array of strings.';
    if not(iscell(value))
        error(errmsg);
    else
        for ix=1.0:numel(value)
            if not(isempty(value{ix})) && not(ischar(value{ix}))
                error(errmsg);
            end % if
        end % for
    end % if
    valueOut = value;
end % function
function preSetFcn_Prop(hProp, eventData)
    % 266 271
    % 267 271
    % 268 271
    % 269 271
    hObj = eventData.AffectedObject;
    % 271 273
    if strcmpi(hProp.Name, 'mdlName')
        return;
    end % if
    % 275 277
    modelName = hObj.mdlName;
    if isempty(modelName)
        return;
    end % if
    % 280 282
    if isequal(hObj.Name, 'HDL Coder') && not(isequal(hProp.AccessFlags.PublicSet, 'off')) && not(isempty(get(hObj, hProp.Name))) && not(isequal(get(hObj, hProp.Name), eventData.NewVal))
        % 282 284
        if isequal(hProp.Name, 'HDLConfigFile')
            % 284 286
            if iscell(eventData.NewVal)
                set_param(modelName, 'dirty', 'on');
            end % if
        else
            set_param(modelName, 'dirty', 'on');
        end % if
    end % if
end % function
