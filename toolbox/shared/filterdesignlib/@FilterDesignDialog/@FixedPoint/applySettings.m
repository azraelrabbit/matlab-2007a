function applySettings(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isa(Hd, 'dfilt.multistage')
        % 8 11
        % 9 11
        for indx=1.0:nstages(Hd)
            applySettings(this, Hd.Stage(indx));
        end % for
        return
    end
    % 15 17
    if not(isSupportedStructure(this, Hd))
        return
    end
    % 19 22
    % 20 22
    set(Hd, 'Arithmetic', this.Arithmetic(1.0:4.0));
    % 22 26
    % 23 26
    % 24 26
    if not(strcmpi(Hd.Arithmetic, 'fixed'))
        return
    end
    % 28 31
    % 29 31
    source = get(this, 'LastAppliedState');
    if isempty(source)
        source = this;
    end
    % 34 37
    % 35 37
    set(Hd, 'InputWordLength', evaluatevars(source.InputWordLength), 'InputFracLength', evaluatevars(source.InputFracLength1));
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    if not(any(strcmpi(class(Hd), {'mfilt.cicdecim','mfilt.cicinterp','dfilt.delay'})))
        set(Hd, 'CoeffWordLength', evaluatevars(source.CoeffWordLength), 'CoeffAutoscale', not(strncmpi(source.CoeffMode, 'binary', 6.0)), 'Signed', strcmpi(source.CoeffSigned, 'on'));
        % 43 47
        % 44 47
        % 45 47
    end
    % 47 49
    switch class(Hd)
    case {'mfilt.cicdecim','mfilt.cicinterp'}
        set(Hd, 'FilterInternals', mapFilterInternals(this.FilterInternals));
        switch lower(Hd.FilterInternals)
        case 'minwordlengths'
            set(Hd, 'OutputWordLength', evaluatevars(this.OutputWordLength));
        case 'specifywordlengths'
            swl = evaluatevars(this.SectionsWordLength);
            % 56 58
            if gt(length(swl), mtimes(2.0, Hd.NumberOfSections))
                swl(plus(mtimes(2.0, Hd.NumberOfSections), 1.0):end) = [];
                set(this, 'SectionsWordLength', mat2str(swl));
            else
                if lt(length(swl), mtimes(2.0, Hd.NumberOfSections))
                    swl(plus(end, 1.0):mtimes(2.0, Hd.NumberOfSections)) = swl(end);
                    set(this, 'SectionsWordLength', mat2str(swl));
                end
            end
            set(Hd, 'SectionWordLengths', evaluatevars(this.SectionsWordLength), 'OutputWordLength', evaluatevars(this.OutputWordLength));
        case 'specifyprecision'
            % 68 71
            % 69 71
            swl = evaluatevars(this.SectionsWordLength);
            sfl = evaluatevars(this.SectionsFracLength1);
            % 72 74
            if gt(length(swl), mtimes(2.0, Hd.NumberOfSections))
                swl(plus(mtimes(2.0, Hd.NumberOfSections), 1.0):end) = [];
                set(this, 'SectionsWordLength', mat2str(swl));
            else
                if lt(length(swl), mtimes(2.0, Hd.NumberOfSections))
                    swl(plus(end, 1.0):mtimes(2.0, Hd.NumberOfSections)) = swl(end);
                    set(this, 'SectionsWordLength', mat2str(swl));
                end
            end
            if gt(length(sfl), mtimes(2.0, Hd.NumberOfSections))
                sfl(plus(mtimes(2.0, Hd.NumberOfSections), 1.0):end) = [];
                set(this, 'SectionsFracLength1', mat2str(sfl));
            else
                if lt(length(sfl), mtimes(2.0, Hd.NumberOfSections))
                    sfl(plus(end, 1.0):mtimes(2.0, Hd.NumberOfSections)) = sfl(end);
                    set(this, 'SectionsFracLength1', mat2str(sfl));
                end
            end
            set(Hd, 'SectionWordLengths', swl, 'SectionFracLengths', sfl, 'OutputWordLength', evaluatevars(this.OutputWordLength), 'OutputFracLength', evaluatevars(this.OutputFracLength1));
            % 92 95
            % 93 95
        end
    case 'dfilt.scalar'
        % 96 99
        % 97 99
        set(Hd, 'OutputWordLength', evaluatevars(source.OutputWordLength), 'RoundMode', convertRoundMode(source), 'OverflowMode', source.OverflowMode);
        % 99 103
        % 100 103
        % 101 103
        if not(Hd.CoeffAutoScale)
            set(Hd, 'CoeffFracLength', evaluatevars(source.CoeffFracLength1));
        end
    case {'dfilt.dffir','dfilt.dffirt','dfilt.dfsymfir','mfilt.firdecim','dfilt.dfasymfir','mfilt.firtdecim','mfilt.firinterp'}
        % 106 110
        % 107 110
        % 108 110
        set(Hd, 'FilterInternals', source.FilterInternals(1.0:4.0));
        % 110 113
        % 111 113
        if not(Hd.CoeffAutoScale)
            set(Hd, 'NumFracLength', evaluatevars(source.CoeffFracLength1));
        end
        % 115 117
        if strncmpi(Hd.FilterInternals, 'spec', 4.0)
            set(Hd, 'ProductWordLength', evaluatevars(source.ProductWordLength), 'ProductFracLength', evaluatevars(source.ProductFracLength1), 'AccumWordLength', evaluatevars(source.AccumWordLength), 'AccumFracLength', evaluatevars(source.AccumFracLength1), 'OutputWordLength', evaluatevars(source.OutputWordLength), 'OutputFracLength', evaluatevars(source.OutputFracLength1), 'OverflowMode', source.OverflowMode, 'RoundMode', convertRoundMode(source));
            % 118 127
            % 119 127
            % 120 127
            % 121 127
            % 122 127
            % 123 127
            % 124 127
            % 125 127
        end
    case 'dfilt.df1sos'
        % 128 130
        if not(Hd.CoeffAutoScale)
            set(Hd, 'ScaleValueFracLength', evaluatevars(source.CoeffFracLength3));
        end
        % 132 134
        set(Hd, 'OutputMode', strrep(source.OutputMode, ' ', ''), 'NumStateWordLength', evaluatevars(source.StateWordLength1), 'NumStateFracLength', evaluatevars(source.StateFracLength1), 'DenStateWordLength', evaluatevars(source.StateWordLength2), 'DenStateFracLength', evaluatevars(source.StateFracLength2));
        % 134 141
        % 135 141
        % 136 141
        % 137 141
        % 138 141
        % 139 141
        if strcmpi(Hd.OutputMode, 'SpecifyPrecision')
            set(Hd, 'OutputFracLength', evaluatevars(source.OutputFracLength1));
        end
        % 143 145
        setIIRcommonProperties(source, Hd);
    case 'dfilt.df2sos'
        % 146 149
        % 147 149
        if not(Hd.CoeffAutoScale)
            set(Hd, 'ScaleValueFracLength', evaluatevars(source.CoeffFracLength3));
        end
        % 151 153
        set(Hd, 'SectionInputWordLength', evaluatevars(source.SectionInputWordLength), 'SectionInputAutoscale', strcmpi(source.SectionInputMode, 'specify word length'), 'SectionOutputWordLength', evaluatevars(source.SectionOutputWordLength), 'SectionOutputAutoscale', strcmpi(source.SectionOutputMode, 'specify word length'), 'OutputMode', strrep(source.OutputMode, ' ', ''), 'StateWordLength', evaluatevars(source.StateWordLength1), 'StateFracLength', evaluatevars(source.StateFracLength1));
        % 153 162
        % 154 162
        % 155 162
        % 156 162
        % 157 162
        % 158 162
        % 159 162
        % 160 162
        if not(Hd.SectionInputAutoscale)
            set(Hd, 'SectionInputFracLength', evaluatevars(source.SectionInputFracLength1));
        end
        % 164 166
        if not(Hd.SectionOutputAutoscale)
            set(Hd, 'SectionOutputFracLength', evaluatevars(source.SectionOutputFracLength1));
        end
        % 168 170
        if strcmpi(Hd.OutputMode, 'SpecifyPrecision')
            set(Hd, 'OutputFracLength', evaluatevars(source.OutputFracLength1));
        end
        % 172 174
        setIIRcommonProperties(source, Hd);
    case 'dfilt.df1tsos'
        % 175 178
        % 176 178
        if not(Hd.CoeffAutoScale)
            set(Hd, 'ScaleValueFracLength', evaluatevars(source.CoeffFracLength3));
        end
        % 180 182
        set(Hd, 'SectionInputWordLength', evaluatevars(source.SectionInputWordLength), 'SectionInputAutoscale', strcmpi(source.SectionInputMode, 'specify word length'), 'SectionOutputWordLength', evaluatevars(source.SectionOutputWordLength), 'SectionOutputAutoscale', strcmpi(source.SectionOutputMode, 'specify word length'), 'MultiplicandWordLength', evaluatevars(source.MultiplicandWordLength), 'MultiplicandFracLength', evaluatevars(source.MultiplicandFracLength1), 'OutputMode', strrep(source.OutputMode, ' ', ''), 'StateWordLength', evaluatevars(source.StateWordLength1), 'StateAutoscale', strcmpi(source.StateMode, 'specify word length'));
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
        if not(Hd.SectionInputAutoscale)
            set(Hd, 'SectionInputFracLength', evaluatevars(source.SectionInputFracLength1));
        end
        % 195 197
        if not(Hd.SectionOutputAutoscale)
            set(Hd, 'SectionOutputFracLength', evaluatevars(source.SectionOutputFracLength1));
        end
        % 199 201
        if not(Hd.StateAutoscale)
            set(Hd, 'NumStateFracLength', evaluatevars(source.StateFracLength1), 'DenStateFracLength', evaluatevars(source.StateFracLength2));
            % 202 205
            % 203 205
        end
        % 205 207
        if strcmpi(Hd.OutputMode, 'SpecifyPrecision')
            set(Hd, 'OutputFracLength', evaluatevars(source.OutputFracLength1));
        end
        % 209 211
        setIIRcommonProperties(source, Hd);
    case 'dfilt.df2tsos'
        % 212 214
        if not(Hd.CoeffAutoScale)
            set(Hd, 'ScaleValueFracLength', evaluatevars(source.CoeffFracLength3));
        end
        % 216 218
        set(Hd, 'SectionInputWordLength', evaluatevars(source.SectionInputWordLength), 'SectionInputFracLength', evaluatevars(source.SectionInputFracLength1), 'SectionOutputWordLength', evaluatevars(source.SectionOutputWordLength), 'SectionOutputFracLength', evaluatevars(source.SectionOutputFracLength1), 'OutputMode', strrep(source.OutputMode, ' ', ''), 'StateWordLength', evaluatevars(source.StateWordLength1), 'StateAutoscale', strcmpi(source.StateMode, 'specify word length'));
        % 218 227
        % 219 227
        % 220 227
        % 221 227
        % 222 227
        % 223 227
        % 224 227
        % 225 227
        if not(Hd.StateAutoscale)
            set(Hd, 'StateFracLength', evaluatevars(source.StateFracLength1));
        end
        % 229 231
        if strcmpi(Hd.OutputMode, 'SpecifyPrecision')
            set(Hd, 'OutputFracLength', evaluatevars(source.OutputFracLength1));
        end
        % 233 235
        setIIRcommonProperties(source, Hd);
    case 'dfilt.df1'
        % 236 238
        set(Hd, 'OutputFracLength', evaluatevars(source.OutputFracLength1));
        % 238 240
        setIIRcommonProperties(source, Hd);
    case 'dfilt.df2'
        % 241 244
        % 242 244
        set(Hd, 'OutputMode', strrep(source.OutputMode, ' ', ''), 'StateWordLength', evaluatevars(source.StateWordLength1), 'StateFracLength', evaluatevars(source.StateFracLength1));
        % 244 249
        % 245 249
        % 246 249
        % 247 249
        if strcmpi(Hd.OutputMode, 'SpecifyPrecision')
            set(Hd, 'OutputFracLength', evaluatevars(source.OutputFracLength1));
        end
        % 251 253
        setIIRcommonProperties(source, Hd);
    case 'dfilt.df1t'
        % 254 257
        % 255 257
        set(Hd, 'OutputMode', strrep(source.OutputMode, ' ', ''), 'StateWordLength', evaluatevars(source.StateWordLength1), 'MultiplicandWordLength', evaluatevars(source.MultiplicandWordLength), 'MultiplicandFracLength', evaluatevars(source.MultiplicandFracLength1), 'StateAutoscale', strcmpi(source.StateMode, 'specify word length'));
        % 257 264
        % 258 264
        % 259 264
        % 260 264
        % 261 264
        % 262 264
        if not(Hd.StateAutoscale)
            set(Hd, 'NumStateFracLength', evaluatevars(source.StateFracLength1), 'DenStateFracLength', evaluatevars(source.StateFracLength2));
            % 265 268
            % 266 268
        end
        % 268 270
        setIIRcommonProperties(source, Hd);
    case 'dfilt.df2t'
        % 271 273
        set(Hd, 'OutputFracLength', evaluatevars(source.OutputFracLength1), 'StateWordLength', evaluatevars(source.StateWordLength1), 'StateAutoscale', strcmpi(source.StateMode, 'specify word length'));
        % 273 278
        % 274 278
        % 275 278
        % 276 278
        if not(Hd.StateAutoscale)
            set(Hd, 'StateFracLength', evaluatevars(source.StateFracLength1));
        end
        % 280 282
        setIIRcommonProperties(source, Hd);
    case 'dfilt.delay'
    case 'farrow.fd'
        % 284 286
        set(Hd, 'FilterInternals', source.FilterInternals(1.0:4.0), 'FDWordLength', evaluatevars(source.FDWordLength), 'FDAutoScale', not(strncmpi(source.FDMode, 'binary', 6.0)));
        % 286 291
        % 287 291
        % 288 291
        % 289 291
        if not(Hd.CoeffAutoScale)
            set(Hd, 'CoeffFracLength', evaluatevars(source.CoeffFracLength1));
        end
        % 293 295
        if not(Hd.FDAutoScale)
            set(Hd, 'FDFracLength', evaluatevars(source.FDFracLength1));
        end
        % 297 299
        if strncmpi(Hd.FilterInternals, 'spec', 4.0)
            set(Hd, 'ProductWordLength', evaluatevars(source.ProductWordLength), 'ProductFracLength', evaluatevars(source.ProductFracLength1), 'AccumWordLength', evaluatevars(source.AccumWordLength), 'AccumFracLength', evaluatevars(source.AccumFracLength1), 'OutputWordLength', evaluatevars(source.OutputWordLength), 'OutputFracLength', evaluatevars(source.OutputFracLength1), 'MultiplicandWordLength', evaluatevars(source.MultiplicandWordLength), 'MultiplicandFracLength', evaluatevars(source.MultiplicandFracLength1), 'FDProdWordLength', evaluatevars(source.FDProdWordLength), 'FDProdFracLength', evaluatevars(source.FDProdFracLength1), 'OverflowMode', source.OverflowMode, 'RoundMode', convertRoundMode(source));
            % 300 313
            % 301 313
            % 302 313
            % 303 313
            % 304 313
            % 305 313
            % 306 313
            % 307 313
            % 308 313
            % 309 313
            % 310 313
            % 311 313
        end
    otherwise
        disp(sprintf('''%s'' not supported yet.', class(Hd)));
    end
end
function setIIRcommonProperties(source, Hd)
    % 318 322
    % 319 322
    % 320 322
    if not(Hd.CoeffAutoScale)
        set(Hd, 'NumFracLength', evaluatevars(source.CoeffFracLength1), 'DenFracLength', evaluatevars(source.CoeffFracLength2));
        % 323 326
        % 324 326
    end
    % 326 328
    set(Hd, 'OutputWordLength', evaluatevars(source.OutputWordLength), 'RoundMode', convertRoundMode(source), 'OverflowMode', source.OverflowMode, 'ProductMode', strrep(source.ProductMode, ' ', ''), 'AccumMode', strrep(source.AccumMode, ' ', ''));
    % 328 335
    % 329 335
    % 330 335
    % 331 335
    % 332 335
    % 333 335
    if not(strcmpi(Hd.ProductMode, 'FullPrecision'))
        set(Hd, 'ProductWordLength', evaluatevars(source.ProductWordLength));
        if strcmpi(Hd.ProductMode, 'SpecifyPrecision')
            set(Hd, 'NumProdFracLength', evaluatevars(source.ProductFracLength1), 'DenProdFracLength', evaluatevars(source.ProductFracLength2));
            % 338 341
            % 339 341
        end
    end
    % 342 344
    if not(strcmpi(Hd.AccumMode, 'FullPrecision'))
        set(Hd, 'CastBeforeSum', strcmpi(source.CastBeforeSum, 'on'), 'AccumWordLength', evaluatevars(source.AccumWordLength));
        % 345 348
        % 346 348
        if strcmpi(Hd.AccumMode, 'SpecifyPrecision')
            set(Hd, 'NumAccumFracLength', evaluatevars(source.AccumFracLength1), 'DenAccumFracLength', evaluatevars(source.AccumFracLength2));
            % 349 352
            % 350 352
        end
    end
end
function FI = mapFilterInternals(FI)
    % 355 358
    % 356 358
    switch lower(FI)
    case 'minimum word lengths'
        FI = 'minwordlengths';
    case 'specify word lengths'
        FI = 'specifywordlengths';
    case 'specify precision'
        FI = 'specifyprecision';
    case 'full precision'
        FI = 'fullprecision';
    end
end
function rMode = convertRoundMode(source)
    % 369 372
    % 370 372
    rMode = source.RoundMode;
    % 372 374
    switch lower(rMode)
    case 'ceiling'
        rMode = 'ceil';
    case 'zero'
        rMode = 'fix';
    end
end
