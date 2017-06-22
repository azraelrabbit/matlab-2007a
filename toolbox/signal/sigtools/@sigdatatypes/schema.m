function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    schema.package('sigdatatypes');
    % 8 11
    % 9 11
    if isempty(findtype('signalFrequencyUnits'))
        schema.EnumType('signalFrequencyUnits', {'Normalized (0 to 1)','Hz','kHz','MHz','GHz'});
    end
    % 13 15
    if isempty(findtype('SignalFdatoolFilterOrderMode'))
        schema.EnumType('SignalFdatoolFilterOrderMode', {'specify','minimum'});
    end
    % 17 19
    if isempty(findtype('gremezOrderMode'))
        schema.EnumType('gremezOrderMode', {'specify','minimum','minimum even','minimum odd'});
    end
    % 21 24
    % 22 24
    if isempty(findtype('siggui_magspecs_FIRUnits'))
        schema.EnumType('siggui_magspecs_FIRUnits', {'dB','Linear'});
    end
    % 26 29
    % 27 29
    if isempty(findtype('siggui_magspecs_IIRUnits'))
        schema.EnumType('siggui_magspecs_IIRUnits', {'dB','Squared'});
    end
    % 31 33
    if isempty(findtype('QToolOverflowMode'))
        schema.EnumType('QToolOverflowMode', {'Wrap','Saturate'});
    end
    % 35 37
    if isempty(findtype('filterdesign_arith'))
        schema.EnumType('filterdesign_arith', {'double','single','fixed'});
    end
    % 39 41
    if isempty(findtype('fxptmodes'))
        schema.EnumType('fxptmodes', {'signed','unsigned'});
    end
    % 43 45
    if isempty(findtype('passstoporboth'))
        schema.EnumType('passstoporboth', {'passband','stopband','both'});
    end
    % 47 50
    % 48 50
    if isempty(findtype('passstop'))
        schema.EnumType('passstop', {'passband','stopband'});
    end
    % 52 54
    if isempty(findtype('magrcosDesignType'))
        schema.EnumType('magrcosDesignType', {'Normal','Square root'});
    end
    % 56 58
    if isempty(findtype('magnyquistDesignType'))
        schema.EnumType('magnyquistDesignType', {'Normal','Nonnegative','Minphase'});
    end
    % 60 62
    if isempty(findtype('freqrcosTransitionMode'))
        schema.EnumType('freqrcosTransitionMode', {'Bandwidth','Rolloff'});
    end
    % 64 67
    % 65 67
    if isempty(findtype('SignalSpectrumTypeList'))
        schema.EnumType('SignalSpectrumTypeList', {'Onesided','Twosided'});
    end
    % 69 72
    % 70 72
    if isempty(findtype('SignalFrequencyRangeList'))
        schema.EnumType('SignalFrequencyRangeList', {'Half','Whole'});
    end
    % 74 76
    if isempty(findtype('signalNumeric'))
        schema.UserType('signalNumeric', 'MATLAB array', @check_numeric);
    end
    % 78 80
    if isempty(findtype('strictbool'))
        schema.UserType('strictbool', 'double', @check_strictbool);
    end
    % 82 84
    if isempty(findtype('spt_uint32'))
        schema.UserType('spt_uint32', 'int32', @check_sign);
    end
    % 86 88
    if isempty(findtype('posint_matrix'))
        schema.UserType('posint_matrix', 'MATLAB array', @check_posint);
    end
    % 90 92
    if isempty(findtype('posint_vector'))
        schema.UserType('posint_vector', 'posint_matrix', @check_vector);
    end
    % 94 97
    % 95 97
    if isempty(findtype('posint'))
        schema.UserType('posint', 'posint_matrix', @check_singular);
    end
    % 99 101
    if isempty(findtype('filterdesignIntDataTypes'))
        schema.UserType('filterdesignIntDataTypes', 'posint', @check_intvals);
    end
    % 103 105
    if isempty(findtype('evenuint32'))
        schema.UserType('evenuint32', 'posint', @check_even);
    end
    % 107 109
    if isempty(findtype('udouble'))
        schema.UserType('udouble', 'double', @check_sign);
    end
    % 111 114
    % 112 114
    if isempty(findtype('posdouble'))
        schema.UserType('posdouble', 'udouble', @check_posdouble);
    end
    % 116 118
    if isempty(findtype('double_vector'))
        schema.UserType('double_vector', 'MATLAB array', @check_double_vector);
    end
    % 120 122
    if isempty(findtype('twoelem_nonnegint_vector'))
        schema.UserType('twoelem_nonnegint_vector', 'double_vector', @check_twoelem_nonnegint);
    end
    % 124 126
    if isempty(findtype('double0t1'))
        schema.UserType('double0t1', 'udouble', @check_0t1);
        % 127 130
        % 128 130
    end
end
function check_posint(value)
    % 132 135
    % 133 135
    check_integer(value);
    check_greaterthan1(value);
end
function check_numeric(value)
    % 138 142
    % 139 142
    % 140 142
    if ~(isnumeric(value))
        error('Value must be numeric ([] or a number).');
    end
end
function check_posdouble(value)
    % 146 149
    % 147 149
    if le(value, 0.0)
        error('Value must be strictly positive.');
    end
end
function check_strictbool(value)
    % 153 155
    if ~(any(eq(value, [1.0 0.0])))
        error('Value must be 0 or 1.');
    end
end
function check_greaterthan1(value)
    % 159 162
    % 160 162
    c = lt(value, 1.0);
    if any(c(:))
        error('Value must be greater than 0.');
    end
end
function check_sign(value)
    % 167 171
    % 168 171
    % 169 171
    if lt(value, 0.0)
        error('Value must be positive.');
    end
end
function check_even(value)
    % 175 178
    % 176 178
    if rem(value, 2.0)
        error('Value must be an even integer.');
    end
end
function check_double_vector(value)
    % 182 185
    % 183 185
    check_vector(value);
    % 185 187
    if ~(isa(value, 'double'))
        error('Value must be a double.');
    end
end
function check_vector(value)
    % 191 194
    % 192 194
    if ~(isnumeric(value))
        error('Value must be numeric.');
    end
    % 196 198
    if all(gt(size(value), 1.0))
        error('Value must be a vector.');
    end
end
function check_twoelem_nonnegint(value)
    % 202 205
    % 203 205
    check_integer(value);
    % 205 207
    if ne(length(value), 2.0)
        error('Value must be a two element vector.');
    end
    % 209 211
    if any(lt(value, 0.0))
        error('Elements must be nonnegative.');
    end
end
function check_integer(value)
    % 215 218
    % 216 218
    if any(rem(value, 1.0))
        error('Value must be an integer.');
    end
end
function check_0t1(value)
    % 222 225
    % 223 225
    if (lt(value, 0.0)) | (gt(value, 1.0))
        error('Value must be between 0 and 1.');
    end
end
function check_singular(value)
    % 229 233
    % 230 233
    % 231 233
    if any(ne(size(value), 1.0))
        error('Value must be a scalar.');
    end
end
function check_intvals(value)
    % 237 242
    % 238 242
    % 239 242
    % 240 242
    if ~(any(eq([8.0 16.0 32.0], value)))
        error('Input/Output wordlengths must be 8, 16, or 32.');
    end
end
