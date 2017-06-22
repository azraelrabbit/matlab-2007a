function rtwconfiguremodel(varargin)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    if lt(nargin, 2.0)
        DAStudio.error('RTW:utility:invalidArgCount', 'rtwconfiguremodel', 'at least two');
        % 23 25
    end
    % 25 27
    model = varargin{1.0};
    % 27 29
    if ishandle(model)
        if not(isequal(get_param(model, 'Type'), 'block_diagram')) || not(isequal(get_param(model, 'BlockDiagramType'), 'model'))
            % 30 32
            DAStudio.error('RTW:targetSpecific:rtwconfiguremodelInvalidArgs');
        end
    else
        if ischar(model)
            if isempty(find_system(model, 'type', 'block_diagram')) || not(isequal(get_param(model, 'BlockDiagramType'), 'model'))
                DAStudio.error('RTW:targetSpecific:rtwconfiguremodelInvalidArgs');
            end
        else
            DAStudio.error('RTW:targetSpecific:rtwconfiguremodelInvalidArgs');
        end
    end
    % 42 44
    fxpMode = 'noop';
    forGRT = true;
    optimized = true;
    isDSP = true;
    nonFiniteOption = false;
    % 48 50
    mode = varargin{2.0};
    switch mode
    case 'ERT (optimized for fixed-point)'
        fxpMode = 'fixed';
        forGRT = false;
        optimized = true;
    case 'ERT (optimized for floating-point)'
        % 56 58
        fxpMode = 'floating';
        forGRT = false;
        optimized = true;
    case 'GRT (optimized for fixed/floating-point)'
        % 61 63
        fxpMode = 'noop';
        forGRT = true;
        optimized = true;
    case 'GRT (debug for fixed/floating-point)'
        % 66 68
        fxpMode = 'noop';
        forGRT = true;
        optimized = false;
    case 'Specified'
        % 71 73
        i = 3.0;
        while lt(i, nargin)
            var = varargin{i};
            setting = varargin{plus(i, 1.0)};
            if isequal(var, 'fxpMode')
                fxpMode = setting;
            else
                if isequal(var, 'forGRT')
                    forGRT = setting;
                else
                    if isequal(var, 'optimized')
                        optimized = setting;
                    else
                        if isequal(var, 'forDSP')
                            isDSP = setting;
                        else
                            if isequal(var, 'nonFinites')
                                nonFiniteOption = true;
                                nonFinites = setting;
                            end
                        end
                    end
                end
            end
            i = plus(i, 2.0);
        end % while
    otherwise
        assertMsg = 'Internal error: unrecognized configuration mode';
        rtwassert(false, assertMsg);
    end
    cs = getActiveConfigSet(model);
    if forGRT
        stf = 'grt.tlc';
    else
        stf = 'ert.tlc';
    end
    % 108 111
    % 109 111
    switchTarget(cs, stf, []);
    % 111 113
    isERT = strcmp(get_param(cs, 'IsERTTarget'), 'on');
    % 113 129
    % 114 129
    % 115 129
    % 116 129
    % 117 129
    % 118 129
    % 119 129
    % 120 129
    % 121 129
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    if optimized
        set_param(cs, 'BlockReduction', 'on');
        set_param(cs, 'ConditionallyExecuteInputs', 'on');
        set_param(cs, 'InlineParams', 'on');
        set_param(cs, 'BooleanDataType', 'on');
        set_param(cs, 'OptimizeBlockIOStorage', 'on');
        set_param(cs, 'LocalBlockOutputs', 'on');
        set_param(cs, 'BufferReuse', 'on');
        set_param(cs, 'ExpressionFolding', 'on');
        set_param(cs, 'EnforceIntegerDowncast', 'off');
        % 138 140
        set_param(cs, 'RollThreshold', 5.0);
        set_param(cs, 'InlineInvariantSignals', 'on');
        % 141 143
        set_param(cs, 'StateBitsets', 'on');
        % 143 145
        set_param(cs, 'DataBitsets', 'on');
        % 145 147
        set_param(cs, 'UseTempVars', 'on');
        % 147 149
        set_param(cs, 'FoldNonRolledExpr', 'on');
        % 149 151
        if isERT
            set_param(cs, 'ZeroExternalMemoryAtStartup', 'off');
            % 152 154
            set_param(cs, 'ZeroInternalMemoryAtStartup', 'off');
            % 154 156
            set_param(cs, 'InitFltsAndDblsToZero', 'off');
            set_param(cs, 'InlinedParameterPlacement', 'NonHierarchical');
            % 157 159
            set_param(cs, 'NoFixptDivByZeroProtection', 'on');
            % 159 161
            set_param(cs, 'IncludeERTFirstTime', 'off');
        end
        set_param(cs, 'EfficientFloat2IntCast', 'on');
    else
        % 164 166
        set_param(cs, 'BlockReduction', 'off');
        set_param(cs, 'ConditionallyExecuteInputs', 'off');
        set_param(cs, 'InlineParams', 'off');
        set_param(cs, 'OptimizeBlockIOStorage', 'off');
        set_param(cs, 'EnforceIntegerDowncast', 'on');
        % 170 172
        set_param(cs, 'InlineInvariantSignals', 'off');
        % 172 174
        set_param(cs, 'StateBitsets', 'off');
        % 174 176
        set_param(cs, 'DataBitsets', 'off');
        % 176 178
        set_param(cs, 'UseTempVars', 'off');
        % 178 180
        set_param(cs, 'FoldNonRolledExpr', 'off');
        % 180 182
        if isERT
            set_param(cs, 'ZeroExternalMemoryAtStartup', 'on');
            % 183 185
            set_param(cs, 'ZeroInternalMemoryAtStartup', 'on');
            % 185 187
            set_param(cs, 'InitFltsAndDblsToZero', 'on');
            set_param(cs, 'InlinedParameterPlacement', 'Hierarchical');
            % 188 190
            set_param(cs, 'NoFixptDivByZeroProtection', 'off')
            % 190 192
        end
        set_param(cs, 'EfficientFloat2IntCast', 'off');
        % 193 195
    end
    % 195 218
    % 196 218
    % 197 218
    % 198 218
    % 199 218
    % 200 218
    % 201 218
    % 202 218
    % 203 218
    % 204 218
    % 205 218
    % 206 218
    % 207 218
    % 208 218
    % 209 218
    % 210 218
    % 211 218
    % 212 218
    % 213 218
    % 214 218
    % 215 218
    % 216 218
    set_param(cs, 'GenerateReport', 'on');
    set_param(cs, 'LaunchReport', 'on');
    if isERT
        set_param(cs, 'IncludeHyperlinkInReport', 'on');
    end
    % 222 226
    % 223 226
    % 224 226
    set_param(cs, 'GenerateComments', 'on');
    set_param(cs, 'SimulinkBlockComments', 'on');
    set_param(cs, 'ShowEliminatedStatement', 'off');
    set_param(cs, 'ForceParamTrailComments', 'on');
    % 229 231
    if isERT
        set_param(cs, 'InsertBlockDesc', 'on');
        set_param(cs, 'SimulinkDataObjDesc', 'on');
        % 233 235
    end
    % 235 240
    % 236 240
    % 237 240
    % 238 240
    if isERT
        set_param(cs, 'MangleLength', 1.0);
        set_param(cs, 'CustomSymbolStrGlobalVar', 'rt$N$M');
        set_param(cs, 'CustomSymbolStrType', '$N$M');
        set_param(cs, 'CustomSymbolStrField', '$N$M');
        set_param(cs, 'CustomSymbolStrFcn', '$N$M$F');
        set_param(cs, 'CustomSymbolStrTmpVar', '$N$M');
        set_param(cs, 'CustomSymbolStrBlkIO', 'rtb_$N$M');
        set_param(cs, 'CustomSymbolStrMacro', '$N$M');
        set_param(cs, 'InlinedPrmAccess', 'Literals');
        set_param(cs, 'IgnoreCustomStorageClasses', 'off');
        % 250 254
        % 251 254
        % 252 254
    end
    % 254 261
    % 255 261
    % 256 261
    % 257 261
    % 258 261
    % 259 261
    if isERT
        if strcmp(fxpMode, 'fixed')
            set_param(cs, 'PurelyIntegerCode', 'on');
        else
            if strcmp(fxpMode, 'floating')
                set_param(cs, 'PurelyIntegerCode', 'off');
                % 266 268
            end
        end
        if nonFiniteOption
            if nonFinites
                set_param(cs, 'SupportNonFinite', 'on');
            else
                set_param(cs, 'SupportNonFinite', 'off');
            end
        end
        if isDSP
            set_param(cs, 'SupportComplex', 'on');
        else
            set_param(cs, 'SupportComplex', 'off');
        end
        % 281 302
        % 282 302
        % 283 302
        % 284 302
        % 285 302
        % 286 302
        % 287 302
        % 288 302
        % 289 302
        % 290 302
        % 291 302
        % 292 302
        % 293 302
        % 294 302
        % 295 302
        % 296 302
        % 297 302
        % 298 302
        % 299 302
        % 300 302
    end
    % 302 306
    % 303 306
    % 304 306
    if isERT
        set_param(cs, 'IncludeMdlTerminateFcn', 'off');
        % 307 313
        % 308 313
        % 309 313
        % 310 313
        % 311 313
        set_param(cs, 'GRTInterface', 'off');
        set_param(cs, 'CombineOutputUpdateFcns', 'on');
    end
    % 315 327
    % 316 327
    % 317 327
    % 318 327
    % 319 327
    % 320 327
    % 321 327
    % 322 327
    % 323 327
    % 324 327
    % 325 327
    if isERT
        set_param(cs, 'ERTCustomFileTemplate', 'example_file_process.tlc');
        % 328 330
        set_param(cs, 'GenerateSampleERTMain', 'on');
        % 330 334
        % 331 334
        % 332 334
        set_param(cs, 'ERTSrcFileBannerTemplate', 'ert_code_template.cgt');
        % 334 336
        set_param(cs, 'ERTHdrFileBannerTemplate', 'ert_code_template.cgt');
        % 336 338
        set_param(cs, 'ERTDataSrcFileTemplate', 'ert_code_template.cgt');
        % 338 340
        set_param(cs, 'ERTDataHdrFileTemplate', 'ert_code_template.cgt');
        % 340 342
    end
    % 342 349
    % 343 349
    % 344 349
    % 345 349
    % 346 349
    % 347 349
    set_param(cs, 'MatFileLogging', 'off');
    set_param(cs, 'SaveTime', 'off');
    set_param(cs, 'SaveOutput', 'off');
    set_param(cs, 'SaveState', 'off');
    set_param(cs, 'SaveFinalState', 'off');
    % 353 357
    % 354 357
    % 355 357
    if optimized
        set_param(cs, 'RTWVerbose', 'off');
        set_param(cs, 'RetainRTWFile', 'off');
    else
        % 360 362
        set_param(cs, 'RTWVerbose', 'on');
        set_param(cs, 'RetainRTWFile', 'on');
        % 363 365
    end
    % 365 368
    % 366 368
    if isERT
        % 368 379
        % 369 379
        % 370 379
        % 371 379
        % 372 379
        % 373 379
        % 374 379
        % 375 379
        % 376 379
        % 377 379
    end
end
