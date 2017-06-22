function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('hdlgui');
    c = schema.class(pk, 'vhdloptionsdlg', findclass(findpackage('siggui'), 'helpdialog'));
    set(c, 'Description', 'More HDL Settings');
    % 10 13
    % 11 13
    findclass(findpackage('hdlcoderprops'), 'CLI');
    % 13 15
    p = schema.prop(c, 'Filter', 'mxArray');
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = schema.prop(c, 'VHDLFileExtension', 'string');
    set(p, 'Description', 'VHDL file extension');
    % 22 24
    p = schema.prop(c, 'EnableVHDLFileExtension', 'on/off');
    % 24 26
    p = schema.prop(c, 'VerilogFileExtension', 'string');
    set(p, 'Description', 'Verilog file extension');
    % 27 29
    p = schema.prop(c, 'EnableVerilogFileExtension', 'on/off');
    % 29 31
    p = schema.prop(c, 'UserComment', 'string');
    set(p, 'Description', 'Comment in header');
    % 32 34
    p = schema.prop(c, 'CoeffPrefix', 'string');
    set(p, 'Description', 'Coefficient prefix');
    % 35 37
    p = schema.prop(c, 'PackagePostfix', 'string');
    set(p, 'Description', 'Package postfix');
    % 38 40
    set(p, 'SetFunction', @setpackagepostfix);
    % 40 42
    schema.prop(c, 'EnablePackagePostfix', 'on/off');
    % 42 44
    p = schema.prop(c, 'SplitEntityArch', 'on/off');
    set(p, 'Description', 'Split entity and architecture');
    % 45 47
    p = schema.prop(c, 'EnableSplitEntityArch', 'on/off');
    set(p, 'SetFunction', @setEnableSplitEntityArch);
    % 48 50
    p = schema.prop(c, 'SplitEntityFilePostfix', 'string');
    set(p, 'Description', 'Split entity file postfix', 'SetFunction', @setsplitentityfilepostfix);
    % 51 54
    % 52 54
    p = schema.prop(c, 'SplitArchFilePostfix', 'string');
    set(p, 'Description', 'Split arch. file postfix', 'SetFunction', @setsplitarchfilepostfix);
    % 55 58
    % 56 58
    p = schema.prop(c, 'EntityConflictPostfix', 'string');
    set(p, 'Description', 'Entity conflict postfix');
    % 59 61
    p = schema.prop(c, 'ReservedWordPostfix', 'string');
    set(p, 'Description', 'Reserved word postfix');
    % 62 64
    p = schema.prop(c, 'ClockProcessPostfix', 'string');
    set(p, 'Description', 'Clocked process postfix');
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    p = schema.prop(c, 'InputPort', 'string');
    set(p, 'Description', 'Input port');
    % 72 74
    p = schema.prop(c, 'FracDelayPort', 'string');
    set(p, 'Description', 'Fractional delay port');
    % 75 77
    schema.prop(c, 'EnableFracDelayPort', 'on/off');
    % 77 80
    % 78 80
    p = schema.prop(c, 'InputType', 'HDLInputTypes');
    set(p, 'Description', 'Input data type');
    % 81 83
    schema.prop(c, 'EnableInputType', 'on/off');
    % 83 85
    p = schema.prop(c, 'OutputPort', 'string');
    set(p, 'Description', 'Output port');
    % 86 89
    % 87 89
    p = schema.prop(c, 'OutputType', 'HDLOutputTypes');
    set(p, 'Description', 'Output data type');
    % 90 92
    schema.prop(c, 'EnableOutputType', 'on/off');
    % 92 94
    p = schema.prop(c, 'ClockInputPort', 'string');
    set(p, 'Description', 'Clock port');
    % 95 97
    p = schema.prop(c, 'ClockEnableInputPort', 'string');
    set(p, 'Description', 'Clock enable port');
    % 98 100
    p = schema.prop(c, 'ResetInputPort', 'string');
    set(p, 'Description', 'Reset input port');
    % 101 103
    p = schema.prop(c, 'ClockEnableOutputPort', 'string');
    set(p, 'Description', 'Clock enable output port', 'SetFunction', @setclockenableoutputport);
    % 104 107
    % 105 107
    schema.prop(c, 'EnableClockEnableOutputPort', 'on/off');
    % 107 109
    p = schema.prop(c, 'AddInputRegister', 'on/off');
    set(p, 'Description', 'Add input register');
    % 110 112
    p = schema.prop(c, 'AddOutputRegister', 'on/off');
    set(p, 'Description', 'Add output register');
    % 113 119
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    p = schema.prop(c, 'ScaleWarnBits', 'string');
    set(p, 'Description', 'Minimum overlap of scale values (bits)');
    % 120 122
    p = schema.prop(c, 'InlineConfigurations', 'on/off');
    set(p, 'Description', 'Inline VHDL configuration');
    % 123 125
    p = schema.prop(c, 'EnableInlineConfigurations', 'on/off');
    set(p, 'SetFunction', @setEnableInlineConfigurations);
    % 126 128
    p = schema.prop(c, 'LoopUnrolling', 'on/off');
    set(p, 'Description', 'Loop unrolling');
    % 129 131
    p = schema.prop(c, 'EnableLoopUnrolling', 'on/off');
    set(p, 'SetFunction', @setEnableLoopUnrolling);
    % 132 134
    p = schema.prop(c, 'UseRisingEdge', 'on/off');
    set(p, 'Description', 'Use ''rising_edge'' for registers');
    % 135 137
    p = schema.prop(c, 'EnableUseRisingEdge', 'on/off');
    set(p, 'SetFunction', @setEnableUseRisingEdge);
    % 138 140
    p = schema.prop(c, 'SafeZeroConcat', 'on/off');
    set(p, 'Description', 'Concatenate type safe zeros');
    % 141 143
    p = schema.prop(c, 'EnableSafeZeroConcat', 'on/off');
    set(p, 'SetFunction', @setEnableSafeZeroConcat);
    % 144 146
    p = schema.prop(c, 'UseAggregatesForConst', 'on/off');
    set(p, 'Description', 'Represent constant values by aggregates');
    % 147 149
    p = schema.prop(c, 'EnableUseAggregatesForConst', 'on/off');
    set(p, 'SetFunction', @setEnableUseAggregatesForConst);
    % 150 152
    p = schema.prop(c, 'CastBeforeSum', 'on/off');
    set(p, 'Description', 'Cast before sum');
    % 153 155
    schema.prop(c, 'EnableCastBeforeSum', 'on/off');
    % 155 157
    p = schema.prop(c, 'UseVerilogTimescale', 'on/off');
    set(p, 'Description', 'Use Verilog `timescale directives');
    % 158 160
    schema.prop(c, 'EnableUseVerilogTimescale', 'on/off');
    % 160 168
    % 161 168
    % 162 168
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    p = schema.prop(c, 'PreviousState', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end
function val = setEnableSplitEntityArch(this, val)
    % 171 174
    % 172 174
    if strcmpi(val, 'off')
        this.SplitEntityArch = 'off';
    end
end
function val = setEnableLoopUnrolling(this, val)
    % 178 181
    % 179 181
    if strcmpi(val, 'off')
        this.LoopUnrolling = 'on';
    end
end
function val = setEnableInlineConfigurations(this, val)
    % 185 188
    % 186 188
    if strcmpi(val, 'off')
        this.InlineConfigurations = 'off';
    end
end
function val = setEnableUseRisingEdge(this, val)
    % 192 195
    % 193 195
    if strcmpi(val, 'off')
        this.UseRisingEdge = 'off';
    end
end
function val = setEnableSafeZeroConcat(this, val)
    % 199 202
    % 200 202
    if strcmpi(val, 'off')
        this.SafeZeroConcat = 'off';
    end
end
function val = setEnableUseAggregatesForConst(this, val)
    % 206 209
    % 207 209
    if strcmpi(val, 'off')
        this.UseAggregatesForConst = 'off';
    end
end
function val = setpackagepostfix(this, val)
    % 213 216
    % 214 216
    if ~(validateEmptyString(val, 'Package postfix'))
        uicontrol(this.handles.packagepostfix);
    end
end
function val = setsplitentityfilepostfix(this, val)
    % 220 222
    if ~(validateEmptyString(val, 'Split entity file postfix'))
        uicontrol(this.handles.splitentityfilepostfix);
    end
end
function val = setsplitarchfilepostfix(this, val)
    % 226 229
    % 227 229
    if ~(validateEmptyString(val, 'Split architecture file postfix'))
        uicontrol(this.handles.splitarchfilepostfix);
    end
end
function val = setclockenableoutputport(this, val)
    % 233 236
    % 234 236
    if ~(validateEmptyString(val, 'Clock enable output port'))
        uicontrol(this.handles.packagepostfix);
    end
end
function result = validateEmptyString(val, strProp)
    % 240 243
    % 241 243
    result = true;
    if (isempty(val)) | (isspace(val))
        msg = '%s can not be an empty string. Please entry a value.';
        str = sprintf(msg, strProp);
        errordlg(str, 'FDATool Error', 'modal');
        result = false;
    end
end
