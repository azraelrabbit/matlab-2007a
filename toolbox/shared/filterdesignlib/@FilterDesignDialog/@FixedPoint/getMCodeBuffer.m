function hBuffer = getMCodeBuffer(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    laState = get(this, 'LastAppliedState');
    if isempty(laState)
        laState = this;
    end
    hBuffer = sigcodegen.mcodebuffer;
    switch lower(laState.Arithmetic)
    case 'double precision'
    case 'single precision'
        % 15 17
        hBuffer.add('set(Hd, ''Arithmetic'', ''single'');');
    case 'fixed point'
        addFixedPoint(laState, hBuffer);
    end
end
function addFixedPoint(laState, hBuffer)
    % 22 26
    % 23 26
    % 24 26
    hBuffer.add('set(Hd, ''Arithmetic'', ''fixed''');
    % 26 28
    addPair(hBuffer, 'InputWordLength', evaluatevars(laState.InputWordLength));
    addPair(hBuffer, 'InputFracLength', evaluatevars(laState.InputFracLength1));
    % 29 31
    switch lower(laState.Structure)
    case 'df1'
        addCoeff(laState, hBuffer, 'Num', 'Den');
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, false);
        addModes(laState, hBuffer);
    case 'df2'
        addCoeff(laState, hBuffer, 'Num', 'Den');
        addState(laState, hBuffer, false, 1.0);
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, true);
        addModes(laState, hBuffer);
    case 'df1t'
        addCoeff(laState, hBuffer, 'Num', 'Den');
        addFormat(laState, hBuffer, 'Multiplicand');
        addState(laState, hBuffer, true, 1.0, 'Num', 'Den');
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, true);
        addModes(laState, hBuffer);
    case 'df2t'
        addCoeff(laState, hBuffer, 'Num', 'Den');
        addState(laState, hBuffer, true, 1.0);
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, false);
        addModes(laState, hBuffer);
    case 'df1sos'
        addCoeff(laState, hBuffer, 'Num', 'Den', 'ScaleValue');
        addState(laState, hBuffer, false, 2.0, 'Num', 'Den');
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, true);
        addModes(laState, hBuffer);
    case 'df2sos'
        addCoeff(laState, hBuffer, 'Num', 'Den', 'ScaleValue');
        addFormat(laState, hBuffer, 'SectionInput', true);
        addFormat(laState, hBuffer, 'SectionOutput', true);
        addState(laState, hBuffer, false, 1.0);
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, true);
        addModes(laState, hBuffer);
    case 'df1tsos'
        addCoeff(laState, hBuffer, 'Num', 'Den', 'ScaleValue');
        addState(laState, hBuffer, true, 1.0, 'Num', 'Den');
        addFormat(laState, hBuffer, 'Multiplicand');
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, true);
        addModes(laState, hBuffer);
    case 'df2tsos'
        addCoeff(laState, hBuffer, 'Num', 'Den', 'ScaleValue');
        addFormat(laState, hBuffer, 'SectionInput');
        addFormat(laState, hBuffer, 'SectionOutput');
        addState(laState, hBuffer, true, 1.0);
        addProd(laState, hBuffer, 'Num', 'Den');
        addAccum(laState, hBuffer, 'Num', 'Den');
        addOutput(laState, hBuffer, true);
        addModes(laState, hBuffer);
    case {'dffir','dffirt','dfsymfir','dfasymfir','firdecim','firtdecim','firinterp','firsrc'}
        % 93 95
        addCoeff(laState, hBuffer, 'Num');
        addFilterInternals(laState, hBuffer);
        if strcmpi(laState.FilterInternals, 'Specify precision')
            addFormat(laState, hBuffer, 'Product');
            addFormat(laState, hBuffer, 'Accum');
            addOutput(laState, hBuffer, false);
            addModes(laState, hBuffer);
        end
    case 'linearinterp'
        addCoeff(laState, hBuffer, 'Num');
        addFilterInternals(laState, hBuffer);
        if strcmpi(laState.FilterInternals, 'Specify precision')
            addFormat(laState, hBuffer, 'Accum');
            addOutput(laState, hBuffer, false);
            addModes(laState, hBuffer);
        end
    case 'holdinterp'
    case 'fd'
        % 112 114
        addCoeff(laState, hBuffer, 'Coeff');
        addFormat(laState, hBuffer, 'FD', true);
        if strcmpi(laState.FilterInternals, 'Specify precision')
            addFormat(laState, hBuffer, 'Product');
            addFormat(laState, hBuffer, 'Accum');
            addFormat(laState, hBuffer, 'Multiplicand');
            addFormat(laState, hBuffer, 'FDProd');
            addOutput(laState, hBuffer, false);
            addModes(laState, hBuffer);
        end
    case {'cicdecim','cicinterp'}
        % 124 126
        addFilterInternals(laState, hBuffer);
        % 126 128
        switch lower(laState.FilterInternals)
        case 'full precision'
        case 'minimum word lengths'
            % 130 132
            addPair(hBuffer, 'OutputWordLength', evaluatevars(laState.OutputWordLength));
        case 'specify word lengths'
            % 133 135
            addPair(hBuffer, 'SectionWordLengths', evaluatevars(laState.SectionsWordLength));
            % 135 137
            addPair(hBuffer, 'OutputWordLength', evaluatevars(laState.OutputWordLength));
        case 'specify precision'
            % 138 140
            addPair(hBuffer, 'SectionWordLengths', evaluatevars(laState.SectionsWordLength));
            % 140 142
            addPair(hBuffer, 'SectionFracLengths', evaluatevars(laState.SectionsFracLength1));
            % 142 144
            addPair(hBuffer, 'OutputWordLength', evaluatevars(laState.OutputWordLength));
            % 144 146
            addPair(hBuffer, 'OutputWordLength', evaluatevars(laState.OutputFracLength));
            % 146 148
        end
    otherwise
        error('finish %s', laState.Structure);
    end
    hBuffer.add(');');
end
function addFormat(laState, hBuffer, format, hasMode)
    % 154 157
    % 155 157
    if lt(nargin, 4.0)
        hasMode = false;
    end
    % 159 161
    wlStr = sprintf('%sWordLength', format);
    % 161 163
    addPair(hBuffer, wlStr, evaluatevars(laState.(wlStr)));
    % 163 165
    addFrac = true;
    if hasMode
        % 166 168
        isAuto = strcmpi(laState.(sprintf('%sMode', format)), 'specify word length');
        % 168 170
        addPair(hBuffer, sprintf('%sAutoScale', format), isAuto);
        if isAuto
            addFrac = false;
        end
    end
    % 174 176
    if addFrac
        addPair(hBuffer, sprintf('%sFracLength', format), evaluatevars(laState.(sprintf('%sFracLength1', format))));
        % 177 179
    end
end
function addState(laState, hBuffer, hasMode, numberOfStates, varargin)
    % 181 184
    % 182 184
    if lt(nargin, 5.0)
        varargin = {''};
    end
    % 186 188
    if gt(numberOfStates, 1.0)
        for indx=1.0:numberOfStates
            addPair(hBuffer, sprintf('%sStateWordLength', varargin{indx}), evaluatevars(laState.(sprintf('StateWordLength%d', indx))));
            % 190 192
        end % for
    else
        addPair(hBuffer, 'StateWordLength', evaluatevars(laState.StateWordLength1));
    end
    % 195 197
    addFrac = true;
    % 197 199
    if hasMode
        addPair(hBuffer, 'StateAutoScale', strcmpi(laState.StateMode, 'specify word length'));
        % 200 202
        if ~(strcmpi(laState.StateMode, 'specify precision'))
            addFrac = false;
        end
    end
    % 205 207
    if addFrac
        for indx=1.0:length(varargin)
            addPair(hBuffer, sprintf('%sStateFracLength', varargin{indx}), evaluatevars(laState.(sprintf('StateFracLength%d', indx))));
            % 209 211
        end % for
    end
end
function addOutput(laState, hBuffer, hasMode)
    % 214 218
    % 215 218
    % 216 218
    addPair(hBuffer, 'OutputWordLength', evaluatevars(laState.OutputWordLength));
    % 218 220
    addFrac = true;
    % 220 222
    if hasMode
        addPair(hBuffer, 'OutputMode', strrep(laState.OutputMode, ' ', ''));
        if ~(strcmpi(laState.OutputMode, 'specify precision'))
            addFrac = false;
        end
    end
    % 227 229
    if addFrac
        addPair(hBuffer, 'OutputFracLength', evaluatevars(laState.OutputFracLength1));
    end
end
function addModes(laState, hBuffer)
    % 233 236
    % 234 236
    rmode = lower(laState.RoundMode);
    % 236 238
    switch lower(rmode)
    case 'ceiling'
        rmode = 'ceil';
    case 'zero'
        rmode = 'fix';
    end
    % 243 245
    addPair(hBuffer, 'RoundMode', rmode);
    addPair(hBuffer, 'OverflowMode', lower(laState.OverflowMode));
end
function addProd(laState, hBuffer, varargin)
    % 248 251
    % 249 251
    addProdAccum(laState, hBuffer, 'Product', 'Prod', varargin{:});
end
function addAccum(laState, hBuffer, varargin)
    % 253 256
    % 254 256
    addProdAccum(laState, hBuffer, 'Accum', 'Accum', varargin{:});
    % 256 259
    % 257 259
    if ~(strcmpi(laState.AccumMode, 'full precision'))
        addPair(hBuffer, 'CastBeforeSum', strcmpi(laState.CastBeforeSum, 'on'));
    end
end
function addProdAccum(laState, hBuffer, longstr, shortstr, varargin)
    % 263 266
    % 264 266
    modestr = sprintf('%sMode', longstr);
    % 266 268
    addPair(hBuffer, modestr, strrep(laState.(modestr), ' ', ''));
    % 268 270
    switch lower(laState.(modestr))
    case 'full precision'
    case {'keep lsb','keep msb'}
        % 272 274
        addPair(hBuffer, sprintf('%sWordLength', longstr), evaluatevars(laState.(sprintf('%sWordLength', longstr))));
    case 'specify precision'
        % 275 277
        addPair(hBuffer, sprintf('%sWordLength', longstr), evaluatevars(laState.(sprintf('%sWordLength', longstr))));
        % 277 279
        for indx=1.0:length(varargin)
            addPair(hBuffer, sprintf('%s%sFracLength', varargin{indx}, shortstr), evaluatevars(laState.(sprintf('%sFracLength%d', longstr, indx))));
            % 280 282
        end % for
    end
end
function addCoeff(laState, hBuffer, varargin)
    % 285 290
    % 286 290
    % 287 290
    % 288 290
    addPair(hBuffer, 'CoeffWordLength', evaluatevars(laState.CoeffWordLength));
    % 290 292
    if strcmpi(laState.CoeffMode, 'Specify word length')
        % 292 295
        % 293 295
        addPair(hBuffer, 'CoeffAutoScale', true);
    else
        % 296 299
        % 297 299
        addPair(hBuffer, 'CoeffAutoScale', false);
        for indx=1.0:length(varargin)
            addPair(hBuffer, sprintf('%sFracLength', varargin{indx}), evaluatevars(laState.(sprintf('CoeffFracLength%d', indx))));
            % 301 303
        end % for
        addPair(hBuffer, 'Signed', strcmpi(laState.CoeffSigned, 'on'));
    end
end
function addFilterInternals(laState, hBuffer)
    % 307 310
    % 308 310
    fi = strrep(laState.FilterInternals, ' ', '');
    if strcmpi(fi, 'minimumwordlengths')
        fi = 'minwordlengths';
    end
    % 313 315
    addPair(hBuffer, 'FilterInternals', fi);
end
function addPair(hBuffer, property, value)
    % 317 320
    % 318 320
    if ischar(value)
        value = horzcat('''', value, '''');
    else
        value = mat2str(value);
    end
    % 324 326
    hBuffer.add(', ...\n    ''%s'', %s', property, value);
end
