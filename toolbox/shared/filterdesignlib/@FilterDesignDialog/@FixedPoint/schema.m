function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'FixedPoint');
    % 10 11
    definetypes;
    % 12 13
    p = schema.prop(c, 'Structure', 'FDDlgStructure');
    set(p, 'SetFunction', @set_structure);
    % 15 16
    schema.prop(c, 'Arithmetic', 'FDDlgArithmetic');
    % 17 18
    p = schema.prop(c, 'InputWordLength', 'string');
    set(p, 'FactoryValue', '16');
    % 20 21
    p = schema.prop(c, 'InputFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 23 24
    schema.prop(c, 'CoeffMode', 'FDDlgFixModes');
    % 25 26
    p = schema.prop(c, 'CoeffSigned', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 28 29
    p = schema.prop(c, 'CoeffWordLength', 'string');
    set(p, 'FactoryValue', '16');
    % 31 32
    p = schema.prop(c, 'CoeffFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 34 35
    p = schema.prop(c, 'CoeffFracLength2', 'string');
    set(p, 'FactoryValue', '15');
    % 37 38
    p = schema.prop(c, 'CoeffFracLength3', 'string');
    set(p, 'FactoryValue', '15');
    % 40 41
    p = schema.prop(c, 'FDWordLength', 'string');
    set(p, 'FactoryValue', '6');
    % 43 44
    schema.prop(c, 'FDMode', 'FDDlgFixModes');
    % 45 46
    p = schema.prop(c, 'FDFracLength1', 'string');
    set(p, 'FactoryValue', '5');
    % 48 49
    schema.prop(c, 'FilterInternals', 'FDDlgFixInternals');
    % 50 51
    p = schema.prop(c, 'StateWordLength1', 'string');
    set(p, 'FactoryValue', '16');
    % 53 54
    p = schema.prop(c, 'StateWordLength2', 'string');
    set(p, 'FactoryValue', '16');
    % 56 57
    schema.prop(c, 'StateMode', 'FDDlgFixModes');
    % 58 59
    p = schema.prop(c, 'StateFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 61 62
    p = schema.prop(c, 'StateFracLength2', 'string');
    set(p, 'FactoryValue', '15');
    % 64 65
    p = schema.prop(c, 'MultiplicandWordLength', 'string');
    set(p, 'FactoryValue', '16');
    % 67 68
    p = schema.prop(c, 'MultiplicandFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 70 71
    p = schema.prop(c, 'SectionInputWordLength', 'string');
    set(p, 'FactoryValue', '16');
    % 73 74
    schema.prop(c, 'SectionInputMode', 'FDDlgFixModes');
    % 75 76
    p = schema.prop(c, 'SectionInputFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 78 79
    p = schema.prop(c, 'SectionOutputWordLength', 'string');
    set(p, 'FactoryValue', '16');
    % 81 82
    schema.prop(c, 'SectionOutputMode', 'FDDlgFixModes');
    % 83 84
    p = schema.prop(c, 'SectionOutputFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 86 87
    schema.prop(c, 'ProductMode', 'FDDlgProductModes');
    % 88 89
    p = schema.prop(c, 'ProductWordLength', 'string');
    set(p, 'FactoryValue', '32');
    % 91 92
    p = schema.prop(c, 'ProductFracLength1', 'string');
    set(p, 'FactoryValue', '29');
    % 94 95
    p = schema.prop(c, 'ProductFracLength2', 'string');
    set(p, 'FactoryValue', '29');
    % 97 98
    p = schema.prop(c, 'AccumMode', 'FDDlgProductModes');
    set(p, 'FactoryValue', 'Keep MSB');
    % 100 101
    p = schema.prop(c, 'AccumWordLength', 'string');
    set(p, 'FactoryValue', '40');
    % 103 104
    p = schema.prop(c, 'AccumFracLength1', 'string');
    set(p, 'FactoryValue', '29');
    % 106 107
    p = schema.prop(c, 'AccumFracLength2', 'string');
    set(p, 'FactoryValue', '29');
    % 109 110
    p = schema.prop(c, 'FDProdWordLength', 'string');
    set(p, 'FactoryValue', '39');
    % 112 113
    p = schema.prop(c, 'FDProdFracLength1', 'string');
    set(p, 'FactoryValue', '34');
    % 115 116
    p = schema.prop(c, 'SectionsWordLength', 'string');
    set(p, 'FactoryValue', '18');
    % 118 119
    p = schema.prop(c, 'SectionsFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 121 122
    p = schema.prop(c, 'CastBeforeSum', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 124 125
    schema.prop(c, 'RoundMode', 'FDDlgRoundModes');
    % 126 127
    schema.prop(c, 'OverflowMode', 'FDDlgOverflowModes');
    % 128 129
    p = schema.prop(c, 'OutputWordLength', 'string');
    set(p, 'FactoryValue', '16');
    % 131 132
    schema.prop(c, 'OutputMode', 'FDDlgOutputModes');
    % 133 134
    p = schema.prop(c, 'OutputFracLength1', 'string');
    set(p, 'FactoryValue', '15');
    % 136 137
    p = schema.prop(c, 'LastAppliedState', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
    % 139 140
    m = schema.method(c, 'getDialogSchema');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle','string'}, 'OutputTypes', {'mxArray'});
end % function
function structure = set_structure(this, structure)
    % 144 148
    % 145 148
    % 146 148
    % 147 148
    if any(strcmpi(structure, {'cicdecim','cicinterp'}))
        set(this, 'Arithmetic', 'fixed');
        return;
    end % if
    % 152 153
    sameFixed = {'dffir','dffirt','dfsymfir','dfasymfir','firdecim','firtdecim','firinterp'};
    % 154 158
    % 155 158
    % 156 158
    % 157 158
    if any(strcmpi(this.Structure, sameFixed)) && any(strcmpi(structure, sameFixed))
        return;
    end % if
    % 161 162
    set(this, 'Arithmetic', 'double');
end % function
function definetypes
    % 165 167
    % 166 167
    if isempty(findtype('FDDlgStructure'))
        % 168 170
        % 169 170
        schema.EnumType('FDDlgStructure', {'fd','dffir','dffirt','dfsymfir','dfasymfir','fftfir','df1','df2','df1t','df2t','df1sos','df2sos','df1tsos','df2tsos','firdecim','firtdecim','cicdecim','iirdecim','iirwdfdecim','firinterp','cicinterp','linearinterp','holdinterp','firsrc','fftfirinterp','iirinterp','iirwdfinterp','cascadeallpass','cascadewdfallpass','firfracdecim','firfracinterp'});
        % 171 177
        % 172 177
        % 173 177
        % 174 177
        % 175 177
        % 176 177
    end % if
    % 178 179
    if isempty(findtype('FDDlgOutputModes'))
        schema.EnumType('FDDlgOutputModes', {'Avoid overflow','Best precision','Specify precision'});
        % 181 182
    end % if
    % 183 184
    if isempty(findtype('FDDlgProductModes'))
        schema.EnumType('FDDlgProductModes', {'Full precision','Keep LSB','Keep MSB','Specify precision'});
        % 186 187
    end % if
    % 188 189
    if isempty(findtype('FDDlgArithmetic'))
        schema.EnumType('FDDlgArithmetic', {'Double precision','Single precision','Fixed point'});
        % 191 192
    end % if
    % 193 194
    if isempty(findtype('FDDlgOverflowModes'))
        schema.EnumType('FDDlgOverflowModes', {'Wrap','Saturate'});
    end % if
    % 197 198
    if isempty(findtype('FDDlgRoundModes'))
        schema.EnumType('FDDlgRoundModes', {'Convergent','Ceiling','Zero','Floor','Nearest'});
        % 200 201
    end % if
    % 202 203
    if isempty(findtype('FDDlgFixModes'))
        schema.EnumType('FDDlgFixModes', {'Specify word length','Binary point scaling'});
        % 205 206
    end % if
    % 207 208
    if isempty(findtype('FDDlgFixInternals'))
        schema.EnumType('FDDlgFixInternals', {'Full precision','Minimum word lengths','Specify word lengths','Specify precision'});
        % 210 212
        % 211 212
    end % if
end % function
