function updateSettings(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    set(this, 'structure', getClassName(Hd));
    % 8 10
    if not(isSupportedStructure(this))
        return;
    end % if
    % 12 14
    if isa(Hd, 'dfilt.multistage')
        % 14 17
        % 15 17
        updateSettings(this, Hd.Stage(1.0));
        return;
    end % if
    % 19 21
    set(this, 'Arithmetic', get(Hd, 'Arithmetic'));
    % 21 23
    if not(strcmpi(Hd.Arithmetic, 'fixed'))
        return;
    end % if
    % 25 27
    set(this, 'InputWordLength', mat2str(Hd.InputWordLength), 'InputFracLength1', mat2str(Hd.InputFracLength));
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    if not(any(strcmpi(class(Hd), {'mfilt.cicdecim','mfilt.cicinterp'})))
        if Hd.Signed
            cSigned = 'on';
        else
            cSigned = 'off';
        end % if
        if Hd.CoeffAutoScale
            cMode = 'Specify word length';
        else
            cMode = 'Binary point scaling';
        end % if
        set(this, 'CoeffWordLength', mat2str(Hd.CoeffWordLength), 'CoeffSigned', cSigned, 'CoeffMode', cMode);
    end % if
    switch class(Hd)
    case {'mfilt.cicdecim','mfilt.cicinterp'}
        swl = get(Hd, 'SectionWordLengths');
        if eq(length(unique(swl)), 1.0)
            swl = swl(1.0);
        end % if
        sfl = get(Hd, 'SectionFracLengths');
        if eq(length(unique(sfl)), 1.0)
            sfl = sfl(1.0);
        end % if
        % 54 56
        set(this, 'FilterInternals', mapFilterInternals(Hd.FilterInternals));
        switch lower(Hd.FilterInternals)
        case 'minwordlengths'
            set(this, 'OutputWordLength', mat2str(Hd.OutputWordLength));
        case 'specifywordlengths'
            set(this, 'SectionsWordLength', mat2str(swl), 'OutputWordLength', mat2str(Hd.OutputWordLength));
            % 62 64
        case 'specifyprecision'
            % 63 65
            set(this, 'SectionsWordLength', mat2str(swl), 'SectionsFracLength1', mat2str(sfl), 'OutputWordLength', mat2str(Hd.OutputWordLength), 'OutputFracLength1', mat2str(Hd.OutputFracLength));
            % 65 70
            % 66 70
            % 67 70
            % 68 70
        end % switch
    case {'dfilt.dffir','dfilt.dffirt','dfilt.dfsymfir','dfilt.dfasymfir','mfilt.firdecim','mfilt.firinterp','mfilt.firtdecim'}
        % 71 75
        % 72 75
        % 73 75
        set(this, 'FilterInternals', mapFilterInternals(Hd.FilterInternals), 'CoeffFracLength1', mat2str(Hd.NumFracLength), 'ProductWordLength', mat2str(Hd.ProductWordLength), 'ProductFracLength1', mat2str(Hd.ProductFracLength), 'AccumWordLength', mat2str(Hd.AccumWordLength), 'AccumFracLength1', mat2str(Hd.AccumFracLength), 'OutputWordLength', mat2str(Hd.OutputWordLength), 'OutputFracLength1', mat2str(Hd.OutputFracLength), 'OverflowMode', Hd.OverflowMode, 'RoundMode', convertRoundMode(Hd));
        % 76 86
        % 77 86
        % 78 86
        % 79 86
        % 80 86
        % 81 86
        % 82 86
        % 83 86
        % 84 86
    case 'dfilt.df1'
        % 85 87
        setIIRcommonProperties(this, Hd);
    case 'dfilt.df2'
        % 88 90
        set(this, 'OutputMode', convertOutputMode(Hd), 'StateWordLength1', mat2str(Hd.StateWordLength), 'StateFracLength1', mat2str(Hd.StateFracLength));
        % 90 95
        % 91 95
        % 92 95
        % 93 95
        setIIRcommonProperties(this, Hd);
    case 'dfilt.df1t'
        set(this, 'OutputMode', convertOutputMode(Hd), 'MultiplicandWordLength', mat2str(Hd.MultiplicandWordLength), 'MultiplicandFracLength1', mat2str(Hd.MultiplicandFracLength), 'StateWordLength1', mat2str(Hd.StateWordLength), 'StateMode', convertAutoscale(Hd.StateAutoscale), 'StateFracLength1', mat2str(Hd.NumStateFracLength), 'StateFracLength2', mat2str(Hd.DenStateFracLength));
        % 97 106
        % 98 106
        % 99 106
        % 100 106
        % 101 106
        % 102 106
        % 103 106
        % 104 106
        setIIRcommonProperties(this, Hd);
    case 'dfilt.df2t'
        % 107 109
        set(this, 'StateWordLength1', mat2str(Hd.StateWordLength), 'StateFracLength1', mat2str(Hd.StateFracLength));
        % 109 113
        % 110 113
        % 111 113
        setIIRcommonProperties(this, Hd);
    case 'dfilt.df1sos'
        % 114 116
        set(this, 'CoeffFracLength3', mat2str(Hd.ScaleValueFracLength), 'StateWordLength1', mat2str(Hd.NumStateWordLength), 'StateFracLength1', mat2str(Hd.NumStateFracLength), 'StateWordLength2', mat2str(Hd.DenStateWordLength), 'StateFracLength2', mat2str(Hd.DenStateFracLength), 'OutputMode', convertOutputMode(Hd));
        % 116 124
        % 117 124
        % 118 124
        % 119 124
        % 120 124
        % 121 124
        % 122 124
        setIIRcommonProperties(this, Hd);
    case 'dfilt.df2sos'
        % 125 127
        set(this, 'CoeffFracLength3', mat2str(Hd.ScaleValueFracLength), 'SectionInputWordLength', mat2str(Hd.SectionInputWordLength), 'SectionInputMode', convertAutoscale(Hd.SectionInputAutoscale), 'SectionInputFracLength1', mat2str(Hd.SectionInputFracLength), 'SectionOutputWordLength', mat2str(Hd.SectionOutputWordLength), 'SectionOutputMode', convertAutoscale(Hd.SectionOutputAutoscale), 'SectionOutputFracLength1', mat2str(Hd.SectionOutputFracLength), 'StateWordLength1', mat2str(Hd.StateWordLength), 'StateFracLength1', mat2str(Hd.StateFracLength), 'OutputMode', convertOutputMode(Hd));
        % 127 139
        % 128 139
        % 129 139
        % 130 139
        % 131 139
        % 132 139
        % 133 139
        % 134 139
        % 135 139
        % 136 139
        % 137 139
        setIIRcommonProperties(this, Hd);
    case 'dfilt.df1tsos'
        % 140 143
        % 141 143
        set(this, 'CoeffFracLength3', mat2str(Hd.ScaleValueFracLength), 'SectionInputWordLength', mat2str(Hd.SectionInputWordLength), 'SectionInputMode', convertAutoscale(Hd.SectionInputAutoscale), 'SectionInputFracLength1', mat2str(Hd.SectionInputFracLength), 'SectionOutputWordLength', mat2str(Hd.SectionOutputWordLength), 'SectionOutputMode', convertAutoscale(Hd.SectionOutputAutoscale), 'SectionOutputFracLength1', mat2str(Hd.SectionOutputFracLength), 'StateWordLength1', mat2str(Hd.StateWordLength), 'StateMode', convertAutoscale(Hd.StateAutoscale), 'StateFracLength1', mat2str(Hd.NumStateFracLength), 'StateFracLength2', mat2str(Hd.DenStateFracLength), 'OutputMode', convertOutputMode(Hd));
        % 143 157
        % 144 157
        % 145 157
        % 146 157
        % 147 157
        % 148 157
        % 149 157
        % 150 157
        % 151 157
        % 152 157
        % 153 157
        % 154 157
        % 155 157
        setIIRcommonProperties(this, Hd);
    case 'dfilt.df2tsos'
        % 158 160
        set(this, 'CoeffFracLength3', mat2str(Hd.ScaleValueFracLength), 'SectionInputWordLength', mat2str(Hd.SectionInputWordLength), 'SectionInputFracLength1', mat2str(Hd.SectionInputFracLength), 'SectionOutputWordLength', mat2str(Hd.SectionOutputWordLength), 'SectionOutputFracLength1', mat2str(Hd.SectionOutputFracLength), 'StateWordLength1', mat2str(Hd.StateWordLength), 'StateMode', convertAutoscale(Hd.StateAutoscale), 'StateFracLength1', mat2str(Hd.StateFracLength), 'OutputMode', convertOutputMode(Hd));
        % 160 171
        % 161 171
        % 162 171
        % 163 171
        % 164 171
        % 165 171
        % 166 171
        % 167 171
        % 168 171
        % 169 171
        setIIRcommonProperties(this, Hd);
    case 'farrow.fd'
        % 172 174
        set(this, 'CoeffFracLength1', mat2str(Hd.CoeffFracLength), 'FDWordLength', mat2str(Hd.FDWordLength), 'FDMode', convertAutoscale(Hd.FDAutoScale), 'FDFracLength', mat2str(Hd.FDFracLength), 'FilterInternals', mapFilterInternals(Hd.FilterInternals), 'ProductWordLength', mat2str(Hd.ProductWordLength), 'ProductFracLength1', mat2str(Hd.ProductFracLength), 'AccumWordLength', mat2str(Hd.AccumWordLength), 'AccumFracLength1', mat2str(Hd.AccumFracLength), 'OutputWordLength', mat2str(Hd.OutputWordLength), 'OutputFracLength1', mat2str(Hd.OutputFracLength), 'MultiplicandWordLength', mat2str(Hd.MultiplicandWordLength), 'MultiplicandFracLength1', mat2str(Hd.MultiplicandFracLength), 'FDProdWordLength', mat2str(Hd.FDProdWordLength), 'FDProdFracLength', mat2str(Hd.FDProdFracLength), 'OverflowMode', Hd.OverflowMode, 'RoundMode', convertRoundMode(Hd));
    otherwise
        % 175 193
        % 176 193
        % 177 193
        % 178 193
        % 179 193
        % 180 193
        % 181 193
        % 182 193
        % 183 193
        % 184 193
        % 185 193
        % 186 193
        % 187 193
        % 188 193
        % 189 193
        % 190 193
        % 191 193
        % 192 194
        disp(sprintf('''%s'' not supported yet.', class(Hd)));
    end % switch
function cls = getClassName(Hd)
    % 196 200
    % 197 200
    % 198 200
    cls = get(classhandle(Hd), 'Name');
    % 200 202
    switch cls
    case {'cascade','parallel'}
        % 203 207
        % 204 207
        % 205 207
        for indx=1.0:nstages(Hd)
            cls = getClassName(Hd.Stage(indx));
            if not(isempty(cls))
                return;
            end % if
        end % for
    case 'scalar'
        % 213 217
        % 214 217
        % 215 217
        cls = '';
    end % switch
function auto = convertAutoscale(auto)
    % 219 224
    % 220 224
    % 221 224
    % 222 224
    if auto
        auto = 'Specify word length';
    else
        auto = 'Binary point scaling';
    end % if
function setIIRcommonProperties(this, Hd)
    % 229 233
    % 230 233
    % 231 233
    if Hd.CastBeforeSum
        cbs = 'on';
    else
        cbs = 'off';
    end % if
    % 237 239
    set(this, 'CoeffFracLength1', mat2str(Hd.NumFracLength), 'CoeffFracLength2', mat2str(Hd.DenFracLength), 'OutputWordLength', mat2str(Hd.OutputWordLength), 'OutputFracLength1', mat2str(Hd.OutputFracLength), 'RoundMode', convertRoundMode(Hd), 'OverflowMode', Hd.overflowmode, 'ProductMode', convertMode(Hd, 'Product'), 'ProductWordLength', mat2str(Hd.ProductWordLength), 'ProductFracLength1', mat2str(Hd.NumProdFracLength), 'ProductFracLength2', mat2str(Hd.DenProdFracLength), 'AccumMode', convertMode(Hd, 'Accum'), 'AccumWordLength', mat2str(Hd.AccumWordLength), 'AccumFracLength1', mat2str(Hd.NumAccumFracLength), 'AccumFracLength2', mat2str(Hd.DenAccumFracLength), 'CastBeforeSum', cbs);
    % 239 254
    % 240 254
    % 241 254
    % 242 254
    % 243 254
    % 244 254
    % 245 254
    % 246 254
    % 247 254
    % 248 254
    % 249 254
    % 250 254
    % 251 254
    % 252 254
function FI = mapFilterInternals(FI)
    % 254 259
    % 255 259
    % 256 259
    % 257 259
    switch lower(FI)
    case 'minwordlengths'
        FI = 'minimum word lengths';
    case 'specifywordlengths'
        FI = 'specify word lengths';
    case 'specifyprecision'
        FI = 'specify precision';
    case 'fullprecision'
        FI = 'full precision';
    end % switch
function oMode = convertOutputMode(Hd)
    % 269 273
    % 270 273
    % 271 273
    oMode = get(Hd, 'OutputMode');
    % 273 275
    switch oMode
    case 'AvoidOverflow'
        oMode = 'Avoid overflow';
    case 'BestPrecision'
        oMode = 'Best precision';
    case 'SpecifyPrecision'
        oMode = 'Specify precision';
    end % switch
function mode = convertMode(Hd, mode)
    % 283 287
    % 284 287
    % 285 287
    mode = get(Hd, horzcat(mode, 'Mode'));
    % 287 289
    switch mode
    case 'SpecifyPrecision'
        mode = 'Specify precision';
    case 'KeepLSB'
        mode = 'Keep LSB';
    case 'KeepMSB'
        mode = 'Keep MSB';
    case 'FullPrecision'
        mode = 'Full precision';
    end % switch
function rMode = convertRoundMode(Hd)
    % 299 303
    % 300 303
    % 301 303
    rMode = get(Hd, 'RoundMode');
    % 303 305
    switch rMode
    case 'ceil'
        rMode = 'ceiling';
    case 'fix'
        rMode = 'zero';
    end % switch
