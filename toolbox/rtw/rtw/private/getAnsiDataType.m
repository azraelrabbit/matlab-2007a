function retVal = getAnsiDataType(modelName, type_id)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    retVal = [];
    % 10 12
    if isempty(modelName)
        return;
    end % if
    % 14 16
    h = get_param(modelName, 'MakeRTWSettingsObject');
    % 16 18
    if isempty(h)
        return;
    end % if
    % 20 24
    % 21 24
    % 22 24
    if isempty(h.AnsiDataTypeTable)
        % 24 26
        hardwareImp = rtwwordlengths(h.ModelName);
        % 26 28
        h.AnsiDataTypeTable.native_word_size = hardwareImp.WordSize;
        % 28 32
        % 29 32
        % 30 32
        if strcmp(get_param(h.ModelName, 'PurelyIntegerCode'), 'off')
            h.AnsiDataTypeTable.Real64 = 'double';
            h.AnsiDataTypeTable.Real32 = 'float';
            h.AnsiDataTypeTable.support_floating_point = true;
        else
            h.AnsiDataTypeTable.Real64 = [];
            h.AnsiDataTypeTable.Real32 = [];
            h.AnsiDataTypeTable.support_floating_point = false;
        end % if
        % 40 47
        % 41 47
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        if eq(hardwareImp.LongNumBits, 64.0)
            h.AnsiDataTypeTable.native_64_bit = true;
            h.AnsiDataTypeTable.UINT64 = 'unsigned long';
            h.AnsiDataTypeTable.INT64 = 'long';
        else
            % 51 53
            % 52 54
            h.AnsiDataTypeTable.native_64_bit = false;
            h.AnsiDataTypeTable.UINT64 = [];
            h.AnsiDataTypeTable.INT64 = [];
        end % if
        % 57 62
        % 58 62
        % 59 62
        % 60 62
        h.AnsiDataTypeTable.native_32_bit = true;
        % 62 65
        % 63 65
        if eq(hardwareImp.IntNumBits, 32.0)
            h.AnsiDataTypeTable.UINT32 = 'unsigned int';
            h.AnsiDataTypeTable.INT32 = 'int';
        else
            if eq(hardwareImp.LongNumBits, 32.0)
                h.AnsiDataTypeTable.UINT32 = 'unsigned long';
                h.AnsiDataTypeTable.INT32 = 'long';
            else
                if eq(hardwareImp.CharNumBits, 32.0)
                    h.AnsiDataTypeTable.UINT32 = 'unsigned char';
                    h.AnsiDataTypeTable.INT32 = 'signed char';
                else
                    if eq(hardwareImp.ShortNumBits, 32.0)
                        h.AnsiDataTypeTable.UINT32 = 'unsigned short';
                        h.AnsiDataTypeTable.INT32 = 'short';
                    else
                        % 80 82
                        % 81 83
                        h.AnsiDataTypeTable.native_32_bit = false;
                        h.AnsiDataTypeTable.UINT32 = [];
                        h.AnsiDataTypeTable.INT32 = [];
                    end % if
                    % 86 90
                    % 87 90
                    % 88 90
                end % if
            end % if
        end % if
        h.AnsiDataTypeTable.native_16_bit = true;
        if eq(hardwareImp.IntNumBits, 16.0)
            h.AnsiDataTypeTable.UINT16 = 'unsigned int';
            h.AnsiDataTypeTable.INT16 = 'int';
        else
            if eq(hardwareImp.LongNumBits, 16.0)
                h.AnsiDataTypeTable.UINT16 = 'unsigned long';
                h.AnsiDataTypeTable.INT16 = 'long';
            else
                if eq(hardwareImp.CharNumBits, 16.0)
                    h.AnsiDataTypeTable.UINT16 = 'unsigned char';
                    h.AnsiDataTypeTable.INT16 = 'signed char';
                else
                    if eq(hardwareImp.ShortNumBits, 16.0)
                        h.AnsiDataTypeTable.UINT16 = 'unsigned short';
                        h.AnsiDataTypeTable.INT16 = 'short';
                    else
                        % 109 111
                        h.AnsiDataTypeTable.native_16_bit = false;
                        if not(isempty(h.AnsiDataTypeTable.UINT32))
                            h.AnsiDataTypeTable.UINT16 = h.AnsiDataTypeTable.UINT32;
                            h.AnsiDataTypeTable.INT16 = h.AnsiDataTypeTable.INT32;
                        else
                            h.AnsiDataTypeTable.UINT16 = [];
                            h.AnsiDataTypeTable.INT16 = [];
                        end % if
                    end % if
                    % 119 123
                    % 120 123
                    % 121 123
                end % if
            end % if
        end % if
        h.AnsiDataTypeTable.native_8_bit = true;
        if eq(hardwareImp.IntNumBits, 8.0)
            h.AnsiDataTypeTable.UINT8 = 'unsigned int';
            h.AnsiDataTypeTable.INT8 = 'int';
        else
            if eq(hardwareImp.LongNumBits, 8.0)
                h.AnsiDataTypeTable.UINT8 = 'unsigned long';
                h.AnsiDataTypeTable.INT8 = 'long';
            else
                if eq(hardwareImp.CharNumBits, 8.0)
                    h.AnsiDataTypeTable.UINT8 = 'unsigned char';
                    h.AnsiDataTypeTable.INT8 = 'signed char';
                else
                    if eq(hardwareImp.ShortNumBits, 8.0)
                        h.AnsiDataTypeTable.UINT8 = 'unsigned short';
                        h.AnsiDataTypeTable.INT8 = 'short';
                    else
                        % 142 144
                        h.AnsiDataTypeTable.native_8_bit = false;
                        % 144 148
                        % 145 148
                        % 146 148
                        if not(isempty(h.AnsiDataTypeTable.UINT16))
                            h.AnsiDataTypeTable.UINT8 = h.AnsiDataTypeTable.UINT16;
                            h.AnsiDataTypeTable.INT8 = h.AnsiDataTypeTable.INT16;
                        else
                            h.AnsiDataTypeTable.UINT8 = [];
                            h.AnsiDataTypeTable.INT8 = [];
                        end % if
                    end % if
                    % 155 159
                    % 156 159
                    % 157 159
                end % if
            end % if
        end % if
        if not(isempty(h.AnsiDataTypeTable.UINT8))
            h.AnsiDataTypeTable.Boolean = h.AnsiDataTypeTable.UINT8;
        else
            h.AnsiDataTypeTable.Boolean = 'unsigned int';
        end % if
        % 166 190
        % 167 190
        % 168 190
        % 169 190
        % 170 190
        % 171 190
        % 172 190
        % 173 190
        % 174 190
        % 175 190
        % 176 190
        % 177 190
        % 178 190
        % 179 190
        % 180 190
        % 181 190
        % 182 190
        % 183 190
        % 184 190
        % 185 190
        % 186 190
        % 187 190
        % 188 190
        h.AnsiDataTypeTable.rtwtypes_id = sprintf('RTWTYPES_ID_C%02dS%02dI%02dL%02dN%02dF%01d', hardwareImp.CharNumBits, hardwareImp.ShortNumBits, hardwareImp.IntNumBits, hardwareImp.LongNumBits, h.AnsiDataTypeTable.native_word_size, h.AnsiDataTypeTable.support_floating_point);
        % 190 199
        % 191 199
        % 192 199
        % 193 199
        % 194 199
        % 195 199
        % 196 199
        % 197 199
    end % if
    % 199 203
    % 200 203
    % 201 203
    switch type_id
    case 'tSS_DOUBLE'
        % 204 206
        retVal.native_support = h.AnsiDataTypeTable.support_floating_point;
        retVal.val = h.AnsiDataTypeTable.Real64;
    case 'tSS_SINGLE'
        retVal.native_support = h.AnsiDataTypeTable.support_floating_point;
        retVal.val = h.AnsiDataTypeTable.Real32;
        % 211 213
    case 'tSS_UINT64'
        % 212 214
        retVal.native_support = h.AnsiDataTypeTable.native_64_bit;
        retVal.val = h.AnsiDataTypeTable.UINT64;
    case 'tSS_INT64'
        retVal.native_support = h.AnsiDataTypeTable.native_64_bit;
        retVal.val = h.AnsiDataTypeTable.INT64;
        % 219 221
    case 'tSS_UINT32'
        % 220 222
        retVal.native_support = h.AnsiDataTypeTable.native_32_bit;
        retVal.val = h.AnsiDataTypeTable.UINT32;
    case 'tSS_INT32'
        retVal.native_support = h.AnsiDataTypeTable.native_32_bit;
        retVal.val = h.AnsiDataTypeTable.INT32;
        % 227 229
    case 'tSS_UINT16'
        % 228 230
        retVal.native_support = h.AnsiDataTypeTable.native_16_bit;
        retVal.val = h.AnsiDataTypeTable.UINT16;
    case 'tSS_INT16'
        retVal.native_support = h.AnsiDataTypeTable.native_16_bit;
        retVal.val = h.AnsiDataTypeTable.INT16;
        % 235 237
    case 'tSS_UINT8'
        % 236 238
        retVal.native_support = h.AnsiDataTypeTable.native_8_bit;
        retVal.val = h.AnsiDataTypeTable.UINT8;
    case 'tSS_INT8'
        retVal.native_support = h.AnsiDataTypeTable.native_8_bit;
        retVal.val = h.AnsiDataTypeTable.INT8;
        % 243 245
    case 'tSS_BOOLEAN'
        % 244 246
        retVal.native_support = false;
        retVal.val = h.AnsiDataTypeTable.Boolean;
        % 248 250
    case 'NativeWordSize'
        % 249 251
        retVal = h.AnsiDataTypeTable.native_word_size;
        % 252 254
    case 'IntWordSize'
        % 253 255
        hardwareImp = rtwwordlengths(h.ModelName);
        retVal = hardwareImp.IntNumBits;
        % 257 259
    case 'SupportFloatingPoint'
        % 258 260
        retVal = h.AnsiDataTypeTable.support_floating_point;
        % 261 263
    case 'RtwTypesID'
        % 262 264
        retVal.val = h.AnsiDataTypeTable.rtwtypes_id;
    otherwise
        % 265 267
        % 266 268
        retVal = [];
        % 268 270
    end % switch
