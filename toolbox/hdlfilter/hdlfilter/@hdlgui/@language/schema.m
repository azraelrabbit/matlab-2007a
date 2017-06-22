function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pk = findpackage('hdlgui');
    c = schema.class(pk, 'language', pk.findclass('abstracthdlgui'));
    set(c, 'Description', 'Filter settings');
    % 9 11
    findpackage('sigdatatypes');
    % 11 14
    % 12 14
    findclass(findpackage('hdlcoderprops'), 'CLI');
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    if isempty(findtype('FDHDLCArchitectureType'))
        schema.EnumType('FDHDLCArchitectureType', {'Fully parallel','Fully serial','Partly serial','Cascade serial','Distributed arithmetic (DA)'});
    end
    % 30 32
    if isempty(findtype('FIRAdderStyleType'))
        schema.EnumType('FIRAdderStyleType', {'Linear','Tree'});
    end
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    p = schema.prop(c, 'TargetLanguage', 'HDLTargetLanguageType');
    set(p, 'Description', 'Filter target language');
    % 41 43
    p = schema.prop(c, 'Name', 'string');
    set(p, 'SetFunction', @setname);
    % 44 46
    p = schema.prop(c, 'TargetDirectory', 'string');
    set(p, 'Description', 'Target directory');
    % 47 49
    p = schema.prop(c, 'ResetType', 'HDLResetTypes');
    set(p, 'Description', 'Reset type');
    % 50 52
    p = schema.prop(c, 'ResetAssertedLevel', 'ResetAssertedLevelType');
    set(p, 'Description', 'Reset asserted level ');
    % 53 55
    p = schema.prop(c, 'OptimizeForHDL', 'on/off');
    set(p, 'Description', 'Optimize for HDL');
    % 56 58
    p = schema.prop(c, 'CoeffMultipliers', 'HDLMultipliersType');
    set(p, 'Description', 'Coefficient multipliers');
    % 59 61
    p = schema.prop(c, 'Architectures', 'FDHDLCArchitectureType');
    set(p, 'Description', 'Architecture');
    % 62 64
    schema.prop(c, 'EnableCoeffMultipliers', 'on/off');
    % 64 66
    p = schema.prop(c, 'FIRAdderStyle', 'FIRAdderStyleType');
    set(p, 'Description', 'FIR adder style');
    % 67 69
    schema.prop(c, 'EnableFIRAdderStyle', 'on/off');
    schema.prop(c, 'OldFIRAdderStyle', 'FIRAdderStyleType');
    % 70 72
    schema.prop(c, 'EnableArchitectures', 'on/off');
    schema.prop(c, 'EnableAddPipelineRegisters', 'on/off');
    % 73 75
    p = schema.prop(c, 'AddPipelineRegisters', 'on/off');
    set(p, 'Description', 'Add pipeline registers');
    % 76 78
    p = schema.prop(c, 'ClockInputs', 'HDLClockInputsType');
    set(p, 'Description', 'Clock Inputs', 'GetFunction', @getclockinputs);
    % 79 82
    % 80 82
    p = schema.prop(c, 'DialogListener', 'handle.listener');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 83 86
    % 84 86
    p = schema.prop(c, 'SerialPartitionStr', 'string');
    set(p, 'Description', 'Serial partition');
    set(p, 'SetFunction', @set_SerialPartitionStr);
    % 88 90
    p = schema.prop(c, 'DARadixStr', 'string');
    set(p, 'Description', 'DA Radix');
    set(p, 'SetFunction', @set_DARadixStr);
    % 92 94
    schema.prop(c, 'EnableClockInputs', 'on/off');
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    p = schema.prop(c, 'DARadix', 'mxArray');
    % 100 104
    % 101 104
    % 102 104
    p = schema.prop(c, 'SerialPartition', 'mxArray');
    % 104 108
    % 105 108
    % 106 108
    p = schema.prop(c, 'DALutPartition', 'mxArray');
    % 108 111
    % 109 111
    p = schema.prop(c, 'FullySerialPartition', 'mxArray');
    % 111 114
    % 112 114
    p = schema.prop(c, 'PartlySerialPartition', 'mxArray');
    % 114 116
    p = schema.prop(c, 'Filter', 'mxArray');
    % 116 124
    % 117 124
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    findclass(findpackage('hdlcoderprops'), 'CLI');
    findclass(findpackage('hdlcoderui'), 'hdledas');
    findclass(findpackage('DAStudio'), 'Dialog');
    % 126 129
    % 127 129
    schema.prop(c, 'hEDAScripts', 'hdlcoderui.hdledas');
    % 129 132
    % 130 132
    schema.prop(c, 'hEDADlg', 'DAStudio.Dialog');
    % 132 135
    % 133 135
    schema.prop(c, 'CLIprops', 'hdlcoderprops.CLI');
end
function name = setname(this, name)
    % 137 140
    % 138 140
    [newpath, name, ext] = fileparts(name);
    % 140 142
    if not(isempty(newpath))
        if isempty(strfind(newpath, ':')) && not(isempty(this.TargetDirectory))
            this.TargetDirectory = fullfile(this.TargetDirectory, newpath);
        else
            this.TargetDirectory = newpath;
        end
    end
    % 148 150
    if not(isempty(ext))
        this.FileExtension = ext;
    end
end
function val = getclockinputs(this, val)
    if strcmpi(this.enableclockinputs, 'off')
        val = 'Single';
    end
end
function value = set_SerialPartitionStr(this, value)
    % 159 163
    % 160 163
    % 161 163
    isLutPartition = strcmpi(get(this, 'Architectures'), 'Distributed arithmetic (DA)');
    if eq(isLutPartition, true)
        this.DALutPartition = str2num(value);
    else
        this.PartlySerialPartition = str2num(value);
    end
end
function result = checkPositive(value, strPartition)
    % 170 290
    % 171 290
    % 172 290
    % 173 290
    % 174 290
    % 175 290
    % 176 290
    % 177 290
    % 178 290
    % 179 290
    % 180 290
    % 181 290
    % 182 290
    % 183 290
    % 184 290
    % 185 290
    % 186 290
    % 187 290
    % 188 290
    % 189 290
    % 190 290
    % 191 290
    % 192 290
    % 193 290
    % 194 290
    % 195 290
    % 196 290
    % 197 290
    % 198 290
    % 199 290
    % 200 290
    % 201 290
    % 202 290
    % 203 290
    % 204 290
    % 205 290
    % 206 290
    % 207 290
    % 208 290
    % 209 290
    % 210 290
    % 211 290
    % 212 290
    % 213 290
    % 214 290
    % 215 290
    % 216 290
    % 217 290
    % 218 290
    % 219 290
    % 220 290
    % 221 290
    % 222 290
    % 223 290
    % 224 290
    % 225 290
    % 226 290
    % 227 290
    % 228 290
    % 229 290
    % 230 290
    % 231 290
    % 232 290
    % 233 290
    % 234 290
    % 235 290
    % 236 290
    % 237 290
    % 238 290
    % 239 290
    % 240 290
    % 241 290
    % 242 290
    % 243 290
    % 244 290
    % 245 290
    % 246 290
    % 247 290
    % 248 290
    % 249 290
    % 250 290
    % 251 290
    % 252 290
    % 253 290
    % 254 290
    % 255 290
    % 256 290
    % 257 290
    % 258 290
    % 259 290
    % 260 290
    % 261 290
    % 262 290
    % 263 290
    % 264 290
    % 265 290
    % 266 290
    % 267 290
    % 268 290
    % 269 290
    % 270 290
    % 271 290
    % 272 290
    % 273 290
    % 274 290
    % 275 290
    % 276 290
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
    result = true;
    if ~(eq(floor(value), value) && ge(value, 0.0))
        expected_pos_int = '%d is not a valid entry. %s must be positive integers.';
        str = sprintf(expected_pos_int, value, strPartition);
        f = errordlg(str, 'FDATool Error', 'modal');
        waitfor(f);
        result = false;
    end
end
function result = checkCalar(value)
    result = true;
    if not(isscalar(value))
        str = 'Input must be a scalar.';
        errordlg(str, 'FDATool Error', 'modal');
        result = false;
        return
    end
end
function value = set_DARadixStr(this, value)
    % 308 312
    % 309 312
    % 310 312
    this.DARadix = str2num(value);
    return
end
