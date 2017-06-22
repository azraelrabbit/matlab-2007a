function notes = fixpt_advisor(curModel, action)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    notes = {};
    % 7 9
    if lt(nargin, 2.0)
        action = 'all';
    end
    % 11 13
    curRoot = bdroot(curModel);
    % 13 15
    new_notes = checkHardwareRounding(curRoot);
    % 15 17
    notes = cellhorzcat(notes{:}, new_notes{:});
    % 17 19
    switch action
    case 'rndmeth'
        % 20 22
        try
            new_notes = check_product_rounding(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point rounding check for ', '''Product blocks'', error occurred: ''', lasterr, ''''));
            % 26 28
        end % try
        % 28 31
        % 29 31
        try
            new_notes = check_lookup_rounding(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point rounding check for ', '''Lookup blocks'', error occurred: ''', lasterr, ''''));
            % 35 37
        end % try
    otherwise
        % 38 41
        % 39 41
        try
            new_notes = lookup_spacing(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Lookup blocks'', error occurred: ''', lasterr, ''''));
            % 45 47
        end % try
        % 47 51
        % 48 51
        % 49 51
        try
            new_notes = PreLookup_division(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''PreLookup blocks'', error occurred: ''', lasterr, ''''));
            % 55 57
        end % try
        % 57 60
        % 58 60
        try
            new_notes = check_gain_blocks(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Gain blocks'', error occurred: ''', lasterr, ''''));
            % 64 66
        end % try
        % 66 69
        % 67 69
        try
            new_notes = check_product_blocks(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Product blocks'', error occurred: ''', lasterr, ''''));
            % 73 75
        end % try
        % 75 78
        % 76 78
        try
            new_notes = check_dot_product_blocks(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Dot product blocks'', error occurred: ''', lasterr, ''''));
            % 82 84
        end % try
        % 84 90
        % 85 90
        % 86 90
        % 87 90
        % 88 90
        try
            new_notes = check_sum_blocks(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Sum blocks'', error occurred: ''', lasterr, ''''));
            % 94 96
        end % try
        % 96 99
        % 97 99
        try
            new_notes = check_relop_blocks(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Relop blocks'', error occurred: ''', lasterr, ''''));
            % 103 105
        end % try
        % 105 108
        % 106 108
        try
            new_notes = check_minmax_blocks(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Minmax blocks'', error occurred: ''', lasterr, ''''));
            % 112 114
        end % try
        % 114 117
        % 115 117
        try
            new_notes = check_dintegrate_blocks(curModel);
            notes = cellhorzcat(notes{:}, new_notes{:});
        catch
            warning(horzcat('Unable to perform Model Advisor fixed-point check for ', '''Discrete integrator blocks'', error occurred: ''', lasterr, ''''));
            % 121 123
        end % try
    end
end
function notes = lookup_spacing(curModel)
    % 126 128
    notes = {};
    % 128 130
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'graphical', 'BlockType', 'Lookup');
    % 130 132
    for iBlk=1.0:length(foundBlks)
        % 132 134
        curBlk = foundBlks{iBlk};
        % 134 136
        rtp = get_runtimeparam_by_name(curBlk, 'InputValues');
        % 136 138
        new_notes = evenSpacing(curBlk, rtp);
        % 138 140
        notes = cellhorzcat(notes{:}, new_notes{:});
        % 140 142
    end % for
    % 142 144
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'graphical', 'BlockType', 'Lookup2D');
    % 144 146
    for iBlk=1.0:length(foundBlks)
        % 146 148
        curBlk = foundBlks{iBlk};
        % 148 150
        rtp = get_runtimeparam_by_name(curBlk, 'RowIndex');
        % 150 152
        new_notes = evenSpacing(curBlk, rtp);
        % 152 154
        notes = cellhorzcat(notes{:}, new_notes{:});
        % 154 156
        rtp = get_runtimeparam_by_name(curBlk, 'ColumnIndex');
        % 156 158
        new_notes = evenSpacing(curBlk, rtp);
        % 158 160
        notes = cellhorzcat(notes{:}, new_notes{:});
        % 160 162
    end % for
end
function notes = PreLookup_division(curModel)
    % 164 167
    % 165 167
    notes = {};
    % 167 169
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'PreLookup');
    % 169 171
    for iBlk=1.0:length(foundBlks)
        % 171 173
        curBlk = foundBlks{iBlk};
        % 173 176
        % 174 176
        blkHasDivision = strcmp(get_param(curBlk, 'IndexSearchMethod'), 'Evenly spaced points');
        % 176 178
        if blkHasDivision
            notes{plus(end, 1.0)}.path = curBlk;
            notes{end}.issue = 'The index search method ''Evenly-spaced points'' requires a division operation, which can be computationally expensive. Try specifying a different index search method to avoid the division operation.';
            % 180 183
            % 181 183
        end
    end % for
end
function notes = evenSpacing(curBlk, runtimeParam)
    % 186 196
    % 187 196
    % 188 196
    % 189 196
    % 190 196
    % 191 196
    % 192 196
    % 193 196
    % 194 196
    notes = {};
    % 196 198
    CR = sprintf('\n');
    % 198 200
    if not(isempty(runtimeParam))
        % 200 202
        fxpProp = fixdt(runtimeParam.Datatype);
        % 202 204
        xdata = double(runtimeParam.Data);
    else
        fxpProp = fixdt('double');
        xdata = 0.0;
    end
    % 208 210
    if isFixpt(fxpProp)
        % 210 212
        [xdata_adjusted, spacingStatus, evenSpacingValue] = fixpt_evenspace_cleanup(xdata, fxpProp);
        % 212 214
        switch spacingStatus
        case 'Significantly uneven spacing'
            % 215 218
            % 216 218
            notes{plus(end, 1.0)}.path = curBlk;
            % 218 220
            notes{end}.issue = horzcat('The following lookup table input data is not evenly spaced. If the data is non-tunable,', CR, 'then an evenly spaced table might be more efficient. See fixpt_look1_func_approx.');
            % 221 223
        case 'Slightly uneven spacing, modified to be evenly spaced'
            % 222 225
            % 223 225
            notes{plus(end, 1.0)}.path = curBlk;
            % 225 227
            notes{end}.issue = horzcat('The following lookup table input data is NOT evenly spaced when quantized,', CR, 'but it is very close to being evenly spaced. If the data is not tunable,', CR, 'then it is strongly recommend that you consider adjusting the table', CR, 'to be evenly spaced.  See fixpt_evenspace_cleanup.');
            % 228 232
            % 229 232
            % 230 232
        case 'Perfectly even spacing'
            % 231 234
            % 232 234
            [fff, eee] = log2(evenSpacingValue);
            % 234 236
            if ne(fff, .5)
                % 236 238
                notes{plus(end, 1.0)}.path = curBlk;
                % 238 240
                notes{end}.issue = horzcat('The following lookup table input data is evenly spaced, but the spacing is not a power-of-two.', CR, 'If the data is non-tunable, then a simplified implementation can result if you can', CR, 'reimplement the table with even power-of-2 spacing. See fixpt_look1_func_approx.');
                % 240 244
                % 241 244
                % 242 244
            end
        end
    end
end
function notes = check_relop_blocks(curModel)
    % 248 250
    notes = {};
    % 250 252
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'RelationalOperator');
    % 252 254
    for iBlk=1.0:length(foundBlks)
        % 254 256
        curBlk = foundBlks{iBlk};
        % 256 258
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        % 258 260
        fxpPropU1 = fixdt(pdt.Inport{1.0});
        % 260 262
        fxpPropU2 = fixdt(pdt.Inport{2.0});
        % 262 264
        new_notes = relopCheck(curBlk, fxpPropU1, fxpPropU2);
        % 264 266
        notes = cellhorzcat(notes{:}, new_notes{:});
        % 266 268
    end % for
end
function notes = check_minmax_blocks(curModel)
    % 270 274
    % 271 274
    % 272 274
    notes = {};
    % 274 276
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'MinMax');
    % 276 279
    % 277 279
    foundBlksOld = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'MaskType', 'Fixed-Point MinMax');
    % 279 281
    foundBlks = transpose(cellhorzcat(foundBlks{:}, foundBlksOld{:}));
    % 281 283
    for iBlk=1.0:length(foundBlks)
        % 283 285
        curBlk = foundBlks{iBlk};
        % 285 287
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        % 287 289
        fxpPropY = fixdt(pdt.Outport{1.0});
        % 289 291
        for iOps=1.0:length(pdt.Inport)
            % 291 293
            fxpPropU = fixdt(pdt.Inport{iOps});
            % 293 295
            new_notes = minmaxCheck(curBlk, fxpPropU, fxpPropY);
            % 295 297
            notes = cellhorzcat(notes{:}, new_notes{:});
        end % for
        % 298 300
    end % for
end
function notes = check_dintegrate_blocks(curModel)
    % 302 306
    % 303 306
    % 304 306
    notes = {};
    % 306 308
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'DiscreteIntegrator', 'InitialConditionMode', 'State and output');
    % 308 310
    CR = sprintf('\n');
    % 310 312
    for iBlk=1.0:length(foundBlks)
        % 312 314
        curBlk = foundBlks{iBlk};
        % 314 316
        notes{plus(end, 1.0)}.path = curBlk;
        % 316 318
        notes{end}.issue = horzcat('The following Discrete Integerators have a complicated initial condition mode. ', CR, 'The initial condition is used to initialize the state and the output. ', CR, 'As a result, the output equation requires extra generated code and an extra', CR, 'global variable is required.  Setting the initial condition mode so that ', CR, 'only the state is initialized is more efficient.');
        % 318 325
        % 319 325
        % 320 325
        % 321 325
        % 322 325
        % 323 325
    end % for
end
function notes = check_sum_blocks(curModel)
    % 327 333
    % 328 333
    % 329 333
    % 330 333
    % 331 333
    notes = {};
    % 333 335
    CR = sprintf('\n');
    % 335 337
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'Sum');
    % 337 339
    for iBlk=1.0:length(foundBlks)
        % 339 341
        curBlk = foundBlks{iBlk};
        % 341 343
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        % 343 345
        satMode = get_param(curBlk, 'SaturateOnIntegerOverflow');
        % 345 347
        rndMode = get_param(curBlk, 'RndMeth');
        % 347 349
        ops = get_param(curBlk, 'Inputs');
        % 349 351
        ops = strrep(ops, '|', '');
        % 351 353
        if not(strncmp('+', ops, 1.0)) && not(strncmp('-', ops, 1.0))
            ops = repmat('+', 1.0, eval(ops));
        end
        % 355 357
        nOps = length(ops);
        % 357 359
        fxpPropY = fixdt(pdt.Outport{1.0});
        % 359 361
        netBias = 0.0;
        % 361 363
        for iOps=1.0:nOps
            % 363 365
            fxpPropU = fixdt(pdt.Inport{iOps});
            % 365 367
            if eq(ops(iOps), '+')
                netBias = plus(netBias, fxpPropU.Bias);
            else
                netBias = minus(netBias, fxpPropU.Bias);
            end
            % 371 373
            new_notes = sumCheck(curBlk, fxpPropU, fxpPropY, satMode, rndMode);
            % 373 375
            notes = cellhorzcat(notes{:}, new_notes{:});
        end % for
        % 376 378
        if eq(nOps, 1.0)
            % 378 380
            pdim = get_param(curBlk, 'CompiledPortWidths');
            % 380 382
            netBias = mtimes(netBias, pdim.Inport(1.0))
        end
        % 383 385
        netBias = minus(netBias, fxpPropY.Bias);
        % 385 387
        if ne(netBias, 0.0)
            % 387 389
            notes{plus(end, 1.0)}.path = curBlk;
            % 389 391
            notes{end}.issue = horzcat('For this Sum block, the net sum of the input biases', CR, 'does not equal the bias of the output. The implementation will include one extra', CR, 'addition or subtraction instruction to correctly account for the net', CR, 'bias adjustment. You can change the bias of the output scaling to make', CR, 'the net bias adjustment zero, and eliminate the need for the extra', CR, 'operation.');
            % 391 399
            % 392 399
            % 393 399
            % 394 399
            % 395 399
            % 396 399
            % 397 399
        end
    end % for
end
function notes = check_dot_product_blocks(curModel)
    % 402 405
    % 403 405
    notes = {};
    % 405 407
    CR = sprintf('\n');
    % 407 409
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'MaskType', 'Dot Product');
    % 409 412
    % 410 412
    foundBlksOld = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'MaskType', 'Fixed-Point Dot Product');
    % 412 414
    foundBlks = transpose(cellhorzcat(foundBlks{:}, foundBlksOld{:}));
    % 414 416
    for iBlk=1.0:length(foundBlks)
        % 416 418
        curBlk = foundBlks{iBlk};
        % 418 420
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        % 420 422
        fxpPropU = fixdt(pdt.Inport{1.0});
        % 422 424
        fxpPropU2 = fixdt(pdt.Inport{2.0});
        % 424 426
        fxpPropY = fixdt(pdt.Outport{1.0});
        % 426 428
        satMode = get_param(curBlk, 'SaturateOnIntegerOverflow');
        % 428 430
        rndMode = get_param(curBlk, 'RndMeth');
        % 430 432
        new_notes = mulCheck(curBlk, fxpPropU, fxpPropU2, fxpPropY, satMode, rndMode);
        % 432 434
        notes = cellhorzcat(notes{:}, new_notes{:});
        % 434 436
    end % for
end
function notes = check_gain_blocks(curModel)
    % 438 441
    % 439 441
    notes = {};
    % 441 443
    CR = sprintf('\n');
    % 443 445
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'Gain');
    % 445 447
    for iBlk=1.0:length(foundBlks)
        % 447 449
        curBlk = foundBlks{iBlk};
        % 449 451
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        fxpPropU = fixdt(pdt.Inport{1.0});
        fxpPropY = fixdt(pdt.Outport{1.0});
        % 453 455
        rtp = get_runtimeparam_by_name(curBlk, 'Gain');
        % 455 457
        if not(isempty(rtp))
            fxpPropK = fixdt(rtp.Datatype);
        else
            fxpPropK = fxpPropU;
        end
        % 461 463
        satMode = get_param(curBlk, 'SaturateOnIntegerOverflow');
        % 463 465
        rndMode = get_param(curBlk, 'RndMeth');
        % 465 467
        new_notes = mulCheck(curBlk, fxpPropU, fxpPropK, fxpPropY, satMode, rndMode);
        % 467 469
        notes = cellhorzcat(notes{:}, new_notes{:});
        % 469 471
    end % for
end
function notes = check_product_rounding(curModel)
    % 473 476
    % 474 476
    notes = {};
    % 476 478
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'Product');
    % 478 480
    for iBlk=1.0:length(foundBlks)
        % 480 482
        curBlk = foundBlks{iBlk};
        % 482 484
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        % 484 486
        BlkHasSignedMultiplication = false;
        BlkHasDivision = false;
        BlkHasSignedDivision = false;
        PrecisionLossOnMultiplication = false;
        % 489 492
        % 490 492
        if gt(length(pdt.Outport), 0.0)
            if strcmp(pdt.Outport{1.0}, 'single') || strcmp(pdt.Outport{1.0}, 'double')
                continue;
            end
        end
        % 496 498
        rndMode = get_param(curBlk, 'RndMeth');
        % 498 500
        ops = get_param(curBlk, 'Inputs');
        if not(strncmp('*', ops, 1.0)) && not(strncmp('/', ops, 1.0))
            ops = repmat('*', 1.0, eval(ops));
        end
        % 503 505
        nOps = length(ops);
        fxpPropY = fixdt(pdt.Outport{1.0});
        % 506 510
        % 507 510
        % 508 510
        if HasMessySlopeOrBias(fxpPropY)
            PrecisionLossOnMultiplication = true;
        end
        % 512 514
        if eq(nOps, 1.0)
            % 514 519
            % 515 519
            % 516 519
            % 517 519
            fxpPropU = fixdt(pdt.Inport{1.0});
            % 519 521
            if ismember(fxpPropU.DataTypeMode, {'Double','Single'})
                continue;
            end
            % 523 525
            if eq(ops, '/')
                BlkHasDivision = true;
                % 526 529
                % 527 529
                if fxpPropU.Signed
                    BlkHasSignedDivision = true;
                end
            else
                pdim = get_param(curBlk, 'CompiledPortWidths');
                if eq(PrecisionReductionMulCheckCollapse(fxpPropU, pdim.Inport, fxpPropY), true)
                    PrecisionLossOnMultiplication = true;
                end
                % 536 539
                % 537 539
                if fxpPropU.Signed
                    BlkHasSignedMultiplication = true;
                end
            end
        else
            if ge(nOps, 2.0)
                % 544 549
                % 545 549
                % 546 549
                % 547 549
                fxpPropURight = fixdt(pdt.Inport{1.0});
                % 549 551
                if eq(ops(1.0), '/')
                    BlkHasDivision = true;
                    % 552 555
                    % 553 555
                    PrecisionLossOnMultiplication = true;
                    if fxpPropURight.Signed
                        BlkHasSignedDivision = true;
                    end
                else
                    % 559 561
                    if fxpPropURight.Signed
                        BlkHasSignedMultiplication = true;
                    end
                end
                % 564 566
                for iOps=2.0:nOps
                    curOp = ops(iOps);
                    % 567 570
                    % 568 570
                    if eq(iOps, 2.0)
                        fxpPropULeft = fxpPropURight;
                    else
                        fxpPropULeft = fxpPropY;
                    end
                    fxpPropURight = fixdt(pdt.Inport{iOps});
                    % 575 578
                    % 576 578
                    if ismember(fxpPropURight.DataTypeMode, {'Double','Single'})
                        continue;
                    end
                    % 580 582
                    if eq(curOp, '/')
                        % 582 584
                        BlkHasDivision = true;
                        % 584 586
                        if fxpPropULeft.Signed || fxpPropURight.Signed
                            BlkHasSignedDivision = true;
                        end
                    else
                        % 589 593
                        % 590 593
                        % 591 593
                        if eq(PrecisionReductionMulCheck(fxpPropULeft, fxpPropURight, fxpPropY), true)
                            PrecisionLossOnMultiplication = true;
                        end
                        % 595 598
                        % 596 598
                        if fxpPropULeft.Signed || fxpPropURight.Signed
                            BlkHasSignedMultiplication = true;
                        end
                    end
                end % for
            end
        end
        % 604 608
        % 605 608
        % 606 608
        PossibleRoundings = {'Zero','Floor','Nearest','Ceiling','Simplest'};
        % 608 610
        if PrecisionLossOnMultiplication
            if BlkHasSignedMultiplication
                PossibleRoundings = intersect(PossibleRoundings, {'Floor','Simplest'});
            else
                PossibleRoundings = intersect(PossibleRoundings, {'Floor','Zero','Simplest'});
            end
        end
        % 616 618
        if BlkHasDivision
            % 618 620
            HwRndMeth = 'Zero';
            cs = getActiveConfigSet(curModel);
            if cs.isValidParam('TargetIntDivRoundTo')
                HwRndMeth = get_param(curModel, 'TargetIntDivRoundTo');
                % 623 625
                if strcmpi(HwRndMeth, 'Undefined')
                    HwRndMeth = 'Zero';
                end
            end
            % 628 630
            if BlkHasSignedDivision
                PossibleRoundings = intersect(PossibleRoundings, cellhorzcat('Simplest', HwRndMeth));
            else
                PossibleRoundings = intersect(PossibleRoundings, cellhorzcat('Floor', 'Simplest', HwRndMeth));
            end
        end
        % 635 640
        % 636 640
        % 637 640
        % 638 640
        if isempty(PossibleRoundings)
            new_notes = couldNotComputeRounding(curBlk);
            notes = cellhorzcat(notes{:}, new_notes{:});
        else
            if not(ismember(rndMode, PossibleRoundings))
                new_notes = suggestMoreEfficientRounding(curBlk, PossibleRoundings);
                notes = cellhorzcat(notes{:}, new_notes{:});
            end
        end
        % 648 650
    end % for
end
function pr_flag = PrecisionReductionMulCheck(fxpPropULeft, fxpPropURight, fxpPropY)
    % 652 655
    % 653 655
    pr_flag = false;
    if gt(plus(fxpPropULeft.FractionLength, fxpPropURight.FractionLength), fxpPropY.FractionLength)
        pr_flag = true;
    end
end
function pr_flag = PrecisionReductionMulCheckCollapse(fxpPropU, USize, fxpPropY)
    pr_flag = false;
    if gt(mtimes(fxpPropU.FractionLength, USize), fxpPropY.FractionLength)
        pr_flag = true;
    end
end
function messy_sob_flag = HasMessySlopeOrBias(fxpProp)
    messy_sob_flag = false;
    if ne(fxpProp.Bias, 0.0)
        % 668 670
        messy_sob_flag = true;
    else
        % 671 673
        if ne(fxpProp.Slope, 0.0) && ne(log2(fxpProp.Slope), fix(log2(fxpProp.Slope)))
            messy_sob_flag = true;
        end
    end
end
function notes = couldNotComputeRounding(curBlk)
    % 678 680
    notes = {};
    % 680 682
    CR = sprintf('\n');
    % 682 684
    notes{plus(end, 1.0)}.path = curBlk;
    % 684 686
    notes{end}.issue = horzcat('The model advisor could not calculate the most efficient rounding method for', CR, 'the following Product block.');
    % 686 689
    % 687 689
end
function notes = suggestMoreEfficientRounding(curBlk, roundings)
    % 690 694
    % 691 694
    % 692 694
    notes = {};
    % 694 696
    CR = sprintf('\n');
    % 696 698
    notes{plus(end, 1.0)}.path = curBlk;
    % 698 700
    switch length(roundings)
    case 1.0
        RoundingText = horzcat('<code>', roundings{1.0}, '</code>');
    case 2.0
        RoundingText = horzcat('either <code>', roundings{1.0}, '</code> or <code>', roundings{2.0}, '</code>');
    otherwise
        RoundingText = '';
        for ri=1.0:minus(length(roundings), 1.0)
            RoundingText = horzcat(RoundingText, '<code>', roundings{ri}, '</code>, ');
        end % for
        RoundingText = horzcat(RoundingText, 'or <code>', roundings{end}, '</code>');
    end
    notes{end}.issue = horzcat('To obtain the most efficient generated code, you should change the <b>Round', CR, 'integer calculations toward</b> parameter of the following block to ', RoundingText, '.');
    % 712 715
    % 713 715
end
function notes = check_lookup_rounding(curModel)
    % 716 722
    % 717 722
    % 718 722
    % 719 722
    % 720 722
    notes = {};
    paths = {};
    % 723 725
    foundBlks = find_system(curModel, 'Regexp', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'graphical', 'BlockType', 'Lookup');
    % 725 727
    for iBlk=1.0:length(foundBlks)
        % 727 729
        curBlk = foundBlks{iBlk};
        % 729 732
        % 730 732
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        if gt(length(pdt.Outport), 0.0)
            if strcmp(pdt.Outport{1.0}, 'single') || strcmp(pdt.Outport{1.0}, 'double')
                continue;
            end
        end
        % 737 739
        rndMode = get_param(curBlk, 'RndMeth');
        % 739 741
        if not(isequal(rndMode, 'Simplest'))
            paths{plus(end, 1.0)} = curBlk;
        end
        % 743 745
    end % for
    % 745 747
    if not(isempty(paths))
        CR = sprintf('\n');
        notes{1.0}.path = paths;
        notes{1.0}.issue = horzcat('To obtain the most efficient generated code, you should change the <b>Round', CR, 'integer calculations toward</b> parameter of the following blocks to <code>Simplest</code>.');
        % 750 754
        % 751 754
        % 752 754
    end
end
function notes = check_product_blocks(curModel)
    % 756 761
    % 757 761
    % 758 761
    % 759 761
    notes = {};
    % 761 763
    foundBlks = find_system(curModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'Product');
    % 763 765
    for iBlk=1.0:length(foundBlks)
        % 765 767
        curBlk = foundBlks{iBlk};
        % 767 769
        pdt = get_param(curBlk, 'CompiledPortDataTypes');
        % 769 771
        BlkhasfloatOutport = false;
        if gt(length(pdt.Outport), 0.0)
            if strcmp(pdt.Outport{1.0}, 'single') || strcmp(pdt.Outport{1.0}, 'double')
                BlkhasfloatOutport = true;
            end
        end
        % 776 778
        satMode = get_param(curBlk, 'SaturateOnIntegerOverflow');
        % 778 780
        rndMode = get_param(curBlk, 'RndMeth');
        % 780 782
        ops = get_param(curBlk, 'Inputs');
        % 782 784
        if not(strncmp('*', ops, 1.0)) && not(strncmp('/', ops, 1.0))
            ops = repmat('*', 1.0, eval(ops));
        end
        % 786 788
        nOps = length(ops);
        % 788 790
        if eq(nOps, 1.0)
            % 790 792
            pdim = get_param(curBlk, 'CompiledPortWidths');
            % 792 794
            if eq(ops, '/')
                % 794 796
                if gt(pdim.Inport(1.0), 1.0)
                    % 796 798
                    new_notes = manyDivSameBlock(curBlk);
                    % 798 800
                    notes = cellhorzcat(notes{:}, new_notes{:});
                end
            else
                % 802 804
                if gt(pdim.Inport(1.0), 2.0) && not(BlkhasfloatOutport)
                    % 804 806
                    new_notes = manyMulDivSameBlock(curBlk);
                    % 806 808
                    notes = cellhorzcat(notes{:}, new_notes{:});
                end
            end
            % 810 812
            fxpPropU = fixdt(pdt.Inport{1.0});
            % 812 814
            fxpPropY = fixdt(pdt.Outport{1.0});
            % 814 816
            new_notes = mulCheck(curBlk, fxpPropU, fxpPropU, fxpPropY, satMode, rndMode);
            % 816 818
            notes = cellhorzcat(notes{:}, new_notes{:});
        else
            if ge(nOps, 2.0)
                % 820 822
                fxpPropY = fixdt(pdt.Outport{1.0});
                % 822 824
                if eq(ops(1.0), '/') && eq(ops(2.0), '*')
                    % 824 826
                    new_notes = doDivSecond(curBlk);
                    % 826 828
                    notes = cellhorzcat(notes{:}, new_notes{:});
                end
                % 829 831
                if gt(length(ops), 2.0) && not(BlkhasfloatOutport)
                    % 831 833
                    new_notes = manyMulDivSameBlock(curBlk);
                    % 833 835
                    notes = cellhorzcat(notes{:}, new_notes{:});
                end
                % 836 838
                if gt(sum(eq(ops, '/')), 1.0)
                    % 838 840
                    new_notes = manyDivSameBlock(curBlk);
                    % 840 842
                    notes = cellhorzcat(notes{:}, new_notes{:});
                end
                % 843 845
                for iOps=2.0:nOps
                    % 845 847
                    curOp = ops(iOps);
                    % 847 849
                    if eq(curOp, '*')
                        % 849 851
                        fxpPropULeft = fixdt(pdt.Inport{minus(iOps, 1.0)});
                        % 851 853
                        fxpPropURght = fixdt(pdt.Inport{iOps});
                        % 853 855
                        new_notes = mulCheck(curBlk, fxpPropULeft, fxpPropURght, fxpPropY, satMode, rndMode);
                        % 855 857
                        notes = cellhorzcat(notes{:}, new_notes{:});
                        % 857 859
                    end
                    % 859 861
                end % for
                % 861 863
                sampTime = get_param(curBlk, 'CompiledSampleTime');
                % 863 865
                blockExecutes = isfinite(sampTime(1.0));
                % 865 867
                if blockExecutes
                    % 867 869
                    CR = sprintf('\n');
                    % 869 871
                    for iOps=1.0:nOps
                        % 871 873
                        if eq(ops(iOps), '/')
                            % 873 875
                            hPorts = get_param(curBlk, 'PortHandles');
                            % 875 877
                            hInportCur = hPorts.Inport(iOps);
                            interfaceForPort = get_param(hInportCur, 'UDDObject');
                            hSource = interfaceForPort.getActualSrc;
                            sourceBlk = get_param(hSource(1.0), 'Parent');
                            sampTimeSource = get_param(sourceBlk, 'CompiledSampleTime');
                            % 881 883
                            if isinf(sampTimeSource(1.0))
                                % 883 885
                                notes{plus(end, 1.0)}.path = curBlk;
                                % 885 887
                                notes{end}.issue = horzcat('An input with an invariant constant value (sample time color magenta) is used as the', CR, 'denominator in an on-line division operation.  If the operation is changed to multiplication,', CR, 'and the invariant input is replaced by its reciprocal, then the division will', CR, 'be done off-line and the on-line operation will be multiplication.  This often', CR, 'gives satisfactory numerics and usually leads to faster and smaller generated', CR, 'code.');
                                % 887 894
                                % 888 894
                                % 889 894
                                % 890 894
                                % 891 894
                                % 892 894
                            end
                        end
                    end % for
                end
            end
        end
    end % for
end
function notes = mulCheck(curBlk, fxpPropU0, fxpPropU1, fxpPropY, satMode, rndMode)
    % 902 905
    % 903 905
    notes = {};
    % 905 907
    CR = sprintf('\n');
    % 907 909
    curModel = bdroot(curBlk);
    % 909 911
    wordSizes = getMicroSizes(curModel);
    % 911 913
    if isFixpt(fxpPropU0) && isFixpt(fxpPropU1) && isFixpt(fxpPropY)
        % 913 917
        % 914 917
        % 915 917
        idealNumBits = plus(fxpPropU0.WordLength, fxpPropU1.WordLength);
        % 917 919
        if lt(wordSizes.long, idealNumBits)
            % 919 921
            if strcmp(satMode, 'on')
                % 921 923
                notes{plus(end, 1.0)}.path = curBlk;
                % 923 925
                notes{end}.issue = horzcat('The following blocks require a very cumbersome multiplication.', CR, sprintf('The first input has   %2d bits.', fxpPropU0.WordLength), CR, sprintf('The second input has  %2d bits.', fxpPropU1.WordLength), CR, sprintf('The ideal product has %2d bits.', idealNumBits), CR, sprintf('The largest integer size for the target has only %d bits.', wordSizes.long), CR, 'Saturation is ON, so it is necessary to determine all ', sprintf('%d', idealNumBits), CR, 'bits of the ideal product in the C code.', CR, 'The C code required to do this multiplication is large and slow.', CR, 'For this target, restricting multiplications to', CR, sprintf('%d bits times %d bits is strongly recommended.', mrdivide(wordSizes.long, 2.0), mrdivide(wordSizes.long, 2.0)));
            else
                % 926 938
                % 927 938
                % 928 938
                % 929 938
                % 930 938
                % 931 938
                % 932 938
                % 933 938
                % 934 938
                % 935 938
                % 936 938
                % 937 940
                % 938 940
                msBitOutput = plus(minus(fxpPropY.WordLength, 1.0), fxpPropY.FixedExponent);
                % 940 942
                msEasyBitIdealProd = plus(plus(minus(wordSizes.long, 1.0), fxpPropU0.FixedExponent), fxpPropU1.FixedExponent);
                % 942 944
                if gt(msBitOutput, msEasyBitIdealProd)
                    % 944 946
                    notes{plus(end, 1.0)}.path = curBlk;
                    % 946 948
                    notes{end}.issue = horzcat('The following blocks require a very cumbersome multiplication.', CR, sprintf('The first input has   %2d bits.', fxpPropU0.WordLength), CR, sprintf('The second input has  %2d bits.', fxpPropU1.WordLength), CR, sprintf('The ideal product has %2d bits.', idealNumBits), CR, sprintf('The largest integer size for the target has only %d bits.', wordSizes.long), CR, 'The relative scaling of the inputs and the output requires that some of the', CR, sprintf('%d most significant bits of the ideal product be determined in the C code.', minus(idealNumBits, wordSizes.long)), CR, 'The C code required to do this multiplication is large and slow.', CR, 'For this target, restricting multiplications to', CR, sprintf('%d bits times %d bits is strongly recommended.', mrdivide(wordSizes.long, 2.0), mrdivide(wordSizes.long, 2.0)));
                    % 948 960
                    % 949 960
                    % 950 960
                    % 951 960
                    % 952 960
                    % 953 960
                    % 954 960
                    % 955 960
                    % 956 960
                    % 957 960
                    % 958 960
                end
            end
            % 961 963
        end
        if ne(fxpPropU0.Bias, 0.0) || ne(fxpPropU1.Bias, 0.0) || ne(fxpPropY.Bias, 0.0)
            % 964 968
            % 965 968
            % 966 968
            notes{plus(end, 1.0)}.path = curBlk;
            % 968 970
            notes{end}.issue = horzcat('The following blocks are multiplying signals with nonzero bias.', CR, 'It is recommended that you avoid this when possible because', CR, 'extra steps are required to implement the multiplication.', CR, 'To avoid this, insert a Data Type Conversion block before', CR, 'and/or after the block doing the multiplication.  This allows the biases', CR, 'to be removed, and allows you to control data type and', CR, 'scaling for intermediate calculations. In many cases the', CR, 'Data Type Conversion blocks can be moved to the "edges" of a (sub)system.', CR, 'The conversion is only done once, and all blocks in the', CR, 'subsystem can benefit from simpler, bias-free math.');
            % 970 982
            % 971 982
            % 972 982
            % 973 982
            % 974 982
            % 975 982
            % 976 982
            % 977 982
            % 978 982
            % 979 982
            % 980 982
        end
        % 982 984
        netSlopeAdj = mrdivide(mtimes(fxpPropU0.SlopeAdjustmentFactor, fxpPropU1.SlopeAdjustmentFactor), fxpPropY.SlopeAdjustmentFactor);
        % 984 988
        % 985 988
        % 986 988
        quantNetSlopeAdj = num2fixpt(netSlopeAdj, sfix(33.0), fixptbestprec(netSlopeAdj, sfix(33.0)));
        % 988 990
        if ne(round(log2(quantNetSlopeAdj)), log2(quantNetSlopeAdj))
            % 990 992
            notes{plus(end, 1.0)}.path = curBlk;
            % 992 994
            notes{end}.issue = horzcat('The following blocks are multiplying signals with mismatched fractional slopes.', CR, sprintf('The first  input has fractional slope %-15g', fxpPropU0.SlopeAdjustmentFactor), CR, sprintf('The second input has fractional slope %-15g', fxpPropU1.SlopeAdjustmentFactor), CR, sprintf('The       output has fractional slope %-15g', fxpPropY.SlopeAdjustmentFactor), CR, sprintf('The net slope adjustment is           %-15g', netSlopeAdj), CR, 'This mismatch causes the overall operation to involve two multiply', CR, 'instructions rather than just one as expected. To remove the mismatch,', CR, 'change the scaling of the output so that its fractional slope is', CR, 'the product of the input fractional slopes.');
            % 994 1005
            % 995 1005
            % 996 1005
            % 997 1005
            % 998 1005
            % 999 1005
            % 1000 1005
            % 1001 1005
            % 1002 1005
            % 1003 1005
        end
    end
end
function notes = sumCheck(curBlk, fxpPropU, fxpPropY, satMode, rndMode)
    % 1008 1012
    % 1009 1012
    % 1010 1012
    notes = {};
    % 1012 1014
    CR = sprintf('\n');
    % 1014 1016
    curModel = bdroot(curBlk);
    % 1016 1018
    wordSizes = getMicroSizes(curModel);
    % 1018 1020
    if isFixpt(fxpPropU) && isFixpt(fxpPropY)
        % 1020 1023
        % 1021 1023
        fxpPropU_nobias = fxpPropU;
        fxpPropU_nobias.Bias = 0.0;
        % 1024 1026
        uMin = num2fixpt(-1.7976931348623157e+308, fxpPropU_nobias, [], 'Nearest', 'on');
        uMax = num2fixpt(1.7976931348623157e+308, fxpPropU_nobias, [], 'Nearest', 'on');
        % 1027 1029
        fxpPropY_nobias = fxpPropY;
        fxpPropY_nobias.Bias = 0.0;
        % 1030 1032
        yMin = num2fixpt(-1.7976931348623157e+308, fxpPropY_nobias, [], 'Nearest', 'on');
        yMax = num2fixpt(1.7976931348623157e+308, fxpPropY_nobias, [], 'Nearest', 'on');
        % 1033 1035
        if lt(uMin, yMin) || gt(uMax, uMax)
            % 1035 1037
            notes{plus(end, 1.0)}.path = curBlk;
            % 1037 1039
            if ne(fxpPropU.Bias, 0.0) || ne(fxpPropY.Bias, 0.0)
                biasNote = horzcat('Note that for better accuracy and efficiency,', CR, 'nonzero bias terms are handled separately and are not included', CR, 'in the conversion from input to output. The ranges given', CR, 'below for the input and output exclude their biases.', CR);
            else
                % 1041 1046
                % 1042 1046
                % 1043 1046
                % 1044 1046
                % 1045 1047
                biasNote = '';
            end
            notes{end}.issue = horzcat('The following Sum blocks can have a range error prior to the addition', CR, 'or subtraction operation being performed. For simplicity of', CR, 'design, the Sum block always casts each input to the output', CR, 'data type and scaling prior to performing the addition or subtraction.', CR, sprintf('%s', biasNote), 'One of the inputs has range ', sprintf('%15g to %15g', uMin, uMax), CR, 'but  the   output has range ', sprintf('%15g to %15g', yMin, yMax), CR, 'so a range error can occur when casting the input to the', CR, 'output data type.', CR, '    You can get any addition or subtraction your application', CR, 'requires by inserting Data Type Conversion blocks before and/or', CR, 'after the Sum block. For example, suppose the inputs are a', CR, 'combination of signed and unsigned 8-bit data types with binary points', CR, 'that differ by at most five places. The output of the Sum', CR, 'block can be set to a signed 16-bit data type with scaling that matches', CR, 'the most precise input. When the inputs are cast to the', CR, 'output data type, there is no loss of range or precision.', CR, 'A Data Type Conversion block placed after the Sum block would allow the', CR, 'final result to be converted to whatever data type is desired.');
            % 1049 1070
            % 1050 1070
            % 1051 1070
            % 1052 1070
            % 1053 1070
            % 1054 1070
            % 1055 1070
            % 1056 1070
            % 1057 1070
            % 1058 1070
            % 1059 1070
            % 1060 1070
            % 1061 1070
            % 1062 1070
            % 1063 1070
            % 1064 1070
            % 1065 1070
            % 1066 1070
            % 1067 1070
            % 1068 1070
        end
        % 1070 1072
        netSlopeAdj = mrdivide(fxpPropU.SlopeAdjustmentFactor, fxpPropY.SlopeAdjustmentFactor);
        % 1072 1076
        % 1073 1076
        % 1074 1076
        quantNetSlopeAdj = num2fixpt(netSlopeAdj, sfix(33.0), fixptbestprec(netSlopeAdj, sfix(33.0)));
        % 1076 1078
        if ne(round(log2(quantNetSlopeAdj)), log2(quantNetSlopeAdj))
            % 1078 1080
            notes{plus(end, 1.0)}.path = curBlk;
            % 1080 1082
            notes{end}.issue = horzcat('The following Sum blocks has an input with a fractional slope that does not', CR, 'equal the fractional slope of the output.', CR, sprintf('The input  has fractional slope %-15g', fxpPropU.SlopeAdjustmentFactor), CR, sprintf('The output has fractional slope %-15g', fxpPropY.SlopeAdjustmentFactor), CR, sprintf('The net slope adjustment is     %-15g', netSlopeAdj), CR, 'This mismatch requires the Sum block to multiply the input by', CR, 'the net slope adjustment each time the input is converted to the output', CR, 'data type and scaling. To remove the mismatch, change the scaling', CR, 'of the output or the input.');
            % 1082 1093
            % 1083 1093
            % 1084 1093
            % 1085 1093
            % 1086 1093
            % 1087 1093
            % 1088 1093
            % 1089 1093
            % 1090 1093
            % 1091 1093
        end
        % 1093 1095
    end
end
function notes = relopCheck(curBlk, fxpPropU1, fxpPropU2)
    % 1097 1101
    % 1098 1101
    % 1099 1101
    notes = {};
    % 1101 1103
    CR = sprintf('\n');
    % 1103 1105
    curModel = bdroot(curBlk);
    % 1105 1107
    wordSizes = getMicroSizes(curModel);
    % 1107 1109
    if not(isequal(fxpPropU1, fxpPropU2))
        % 1109 1111
        notes{plus(end, 1.0)}.path = curBlk;
        % 1111 1113
        notes{end}.issue = horzcat('For the following Relational Operator blocks, the data types of the first', CR, 'and second inputs are not the same. A conversion operation is', CR, 'required every time the block is executed. If one of the inputs', CR, 'is invariant (sample time color magenta), then changing the data', CR, 'type and scaling of the invariant input to match the other input', CR, 'is a good opportunity for improving the model''s efficiency.');
        % 1113 1121
        % 1114 1121
        % 1115 1121
        % 1116 1121
        % 1117 1121
        % 1118 1121
        % 1119 1121
    end
    % 1121 1123
    if isFixpt(fxpPropU1) && isFixpt(fxpPropU2)
        % 1123 1126
        % 1124 1126
        u1Min = num2fixpt(-1.7976931348623157e+308, fxpPropU1, [], 'Nearest', 'on');
        u1Max = num2fixpt(1.7976931348623157e+308, fxpPropU1, [], 'Nearest', 'on');
        % 1127 1129
        u2Min = num2fixpt(-1.7976931348623157e+308, fxpPropU2, [], 'Nearest', 'on');
        u2Max = num2fixpt(1.7976931348623157e+308, fxpPropU2, [], 'Nearest', 'on');
        % 1130 1132
        if ge(u1Max, u2Max)
            % 1132 1134
            netSlopeAdj = mrdivide(fxpPropU2.SlopeAdjustmentFactor, fxpPropU1.SlopeAdjustmentFactor);
            % 1134 1136
            if lt(u2Min, u1Min) || gt(u2Max, u1Max)
                % 1136 1138
                notes{plus(end, 1.0)}.path = curBlk;
                % 1138 1140
                notes{end}.issue = horzcat('For the following Relational Operator blocks, the first input has the', CR, 'greater positive range. The second input is converted to the', CR, 'data type and scaling of the first input prior to performing', CR, 'the relational operation.', CR, 'The     first  input has range ', sprintf('%15g to %15g', u1Min, u1Max), CR, 'but the second input has range ', sprintf('%15g to %15g', u2Min, u2Max), CR, 'so a range error can occur when casting. ', 'You can insert Data Type Conversion blocks', CR, 'in front of the Relational Operator block to', CR, 'convert both inputs to a common data type that has sufficient', CR, 'range and precision to perfectly represent each input. The relational', CR, 'operation would then be error-free.');
                % 1140 1154
                % 1141 1154
                % 1142 1154
                % 1143 1154
                % 1144 1154
                % 1145 1154
                % 1146 1154
                % 1147 1154
                % 1148 1154
                % 1149 1154
                % 1150 1154
                % 1151 1154
                % 1152 1154
            end
            % 1154 1156
            if lt(fxpPropU2.Slope, fxpPropU1.Slope)
                % 1156 1158
                notes{plus(end, 1.0)}.path = curBlk;
                % 1158 1160
                notes{end}.issue = horzcat('For the following Relational Operator blocks, the first input has the', CR, 'greater positive range. The second input is converted to the', CR, 'data type and scaling of the first input prior to performing', CR, 'the relational operation.', CR, 'The first  input has precision ', sprintf('%15g', fxpPropU1.Slope), CR, 'The second input has precision ', sprintf('%15g', fxpPropU2.Slope), CR, 'so there can be a precision loss each time the conversion is performed.', 'You can insert Data Type Conversion blocks', CR, 'in front of the Relational Operator block to', CR, 'convert both inputs to a common data type that has sufficient', CR, 'range and precision to perfectly represent each input. The relational', CR, 'operation would then be error-free.');
                % 1160 1174
                % 1161 1174
                % 1162 1174
                % 1163 1174
                % 1164 1174
                % 1165 1174
                % 1166 1174
                % 1167 1174
                % 1168 1174
                % 1169 1174
                % 1170 1174
                % 1171 1174
                % 1172 1174
            end
        else
            % 1175 1177
            netSlopeAdj = mrdivide(fxpPropU1.SlopeAdjustmentFactor, fxpPropU2.SlopeAdjustmentFactor);
            % 1177 1179
            if gt(u2Min, u1Min) || lt(u2Max, u1Max)
                % 1179 1181
                notes{plus(end, 1.0)}.path = curBlk;
                % 1181 1183
                notes{end}.issue = horzcat('For the following Relational Operator blocks, the second input has the', CR, 'greater positive range. The first input is converted to the', CR, 'data type and scaling of the second input prior to performing', CR, 'the relational operation.', CR, 'The     first  input has range ', sprintf('%15g to %15g', u1Min, u1Max), CR, 'but the second input has range ', sprintf('%15g to %15g', u2Min, u2Max), CR, 'so a range error can occur when casting.', 'You can insert Data Type Conversion blocks', CR, 'in front of the Relational Operator block to', CR, 'convert both inputs to a common data type that has sufficient', CR, 'range and precision to perfectly represent each input. The relational', CR, 'operation would then be error-free.');
                % 1183 1197
                % 1184 1197
                % 1185 1197
                % 1186 1197
                % 1187 1197
                % 1188 1197
                % 1189 1197
                % 1190 1197
                % 1191 1197
                % 1192 1197
                % 1193 1197
                % 1194 1197
                % 1195 1197
            end
            % 1197 1199
            if gt(fxpPropU2.Slope, fxpPropU1.Slope)
                % 1199 1201
                notes{plus(end, 1.0)}.path = curBlk;
                % 1201 1203
                notes{end}.issue = horzcat('For the following Relational Operator blocks, the second input has the', CR, 'greater positive range. The first input is converted to the', CR, 'data type and scaling of the second input prior to performing', CR, 'the relational operation.', CR, 'The first  input has precision ', sprintf('%15g', fxpPropU1.Slope), CR, 'The second input has precision ', sprintf('%15g', fxpPropU2.Slope), CR, 'so there can be a precision loss each time the conversion is performed.', 'You can insert Data Type Conversion blocks', CR, 'in front of the Relational Operator block to', CR, 'convert both inputs to a common data type that has sufficient', CR, 'range and precision to perfectly represent each input. The relational', CR, 'operation would then be error-free.');
                % 1203 1217
                % 1204 1217
                % 1205 1217
                % 1206 1217
                % 1207 1217
                % 1208 1217
                % 1209 1217
                % 1210 1217
                % 1211 1217
                % 1212 1217
                % 1213 1217
                % 1214 1217
                % 1215 1217
            end
            % 1217 1219
        end
        % 1219 1223
        % 1220 1223
        % 1221 1223
        quantNetSlopeAdj = num2fixpt(netSlopeAdj, sfix(33.0), fixptbestprec(netSlopeAdj, sfix(33.0)));
        % 1223 1225
        if ne(round(log2(quantNetSlopeAdj)), log2(quantNetSlopeAdj))
            % 1225 1227
            notes{plus(end, 1.0)}.path = curBlk;
            % 1227 1229
            notes{end}.issue = horzcat('The following Relational Operator blocks have different fractional slopes for its first and second inputs.', CR, sprintf('The first  input has fractional slope %-15g', fxpPropU1.SlopeAdjustmentFactor), CR, sprintf('The second input has fractional slope %-15g', fxpPropU2.SlopeAdjustmentFactor), CR, sprintf('The net slope adjustment is           %-15g', netSlopeAdj), CR, 'This mismatch causes the Relational Operator block to require a multiply operation each', CR, 'time the input with lesser positive range is converted to the data type and scaling of ', CR, 'the input with greater positive range.', CR, 'To remove the mismatch, change the scaling of either of the inputs.');
            % 1229 1239
            % 1230 1239
            % 1231 1239
            % 1232 1239
            % 1233 1239
            % 1234 1239
            % 1235 1239
            % 1236 1239
            % 1237 1239
        end
        % 1239 1241
    end
end
function notes = minmaxCheck(curBlk, fxpPropU, fxpPropY)
    % 1243 1247
    % 1244 1247
    % 1245 1247
    notes = {};
    % 1247 1249
    CR = sprintf('\n');
    % 1249 1251
    curModel = bdroot(curBlk);
    % 1251 1253
    wordSizes = getMicroSizes(curModel);
    % 1253 1255
    if not(isequal(fxpPropU, fxpPropY))
        % 1255 1257
        notes{plus(end, 1.0)}.path = curBlk;
        % 1257 1259
        notes{end}.issue = horzcat('For the following MinMax blocks, the data types of the output', CR, 'and an input are not the same. A conversion operation is', CR, 'required every time the block is executed.  If you change the', CR, 'data types to be the same, your model will be more efficient.');
        % 1259 1265
        % 1260 1265
        % 1261 1265
        % 1262 1265
        % 1263 1265
    end
    % 1265 1267
    if isFixpt(fxpPropU) && isFixpt(fxpPropY)
        % 1267 1270
        % 1268 1270
        uMin = num2fixpt(-1.7976931348623157e+308, fxpPropU, [], 'Nearest', 'on');
        uMax = num2fixpt(1.7976931348623157e+308, fxpPropU, [], 'Nearest', 'on');
        % 1271 1273
        yMin = num2fixpt(-1.7976931348623157e+308, fxpPropY, [], 'Nearest', 'on');
        yMax = num2fixpt(1.7976931348623157e+308, fxpPropY, [], 'Nearest', 'on');
        % 1274 1276
        netSlopeAdj = mrdivide(fxpPropU.SlopeAdjustmentFactor, fxpPropY.SlopeAdjustmentFactor);
        % 1276 1278
        if lt(uMin, yMin) || gt(uMax, yMax)
            % 1278 1280
            notes{plus(end, 1.0)}.path = curBlk;
            % 1280 1282
            notes{end}.issue = horzcat('For the following MinMax blocks, an input is converted to the', CR, 'data type and scaling of the output prior to performing', CR, 'the relational operation.', CR, 'The     input  has range ', sprintf('%15g to %15g', uMin, uMax), CR, 'but the output has range ', sprintf('%15g to %15g', yMin, yMax), CR, 'so a range error can occur when casting.', 'If you change the output data type so that it has sufficient', CR, 'range and precision to perfectly represent each input, then ', CR, 'the operation will be error-free.');
            % 1282 1293
            % 1283 1293
            % 1284 1293
            % 1285 1293
            % 1286 1293
            % 1287 1293
            % 1288 1293
            % 1289 1293
            % 1290 1293
            % 1291 1293
        end
        % 1293 1295
        if lt(fxpPropU.Slope, fxpPropY.Slope)
            % 1295 1297
            notes{plus(end, 1.0)}.path = curBlk;
            % 1297 1299
            notes{end}.issue = horzcat('For the following MinMax blocks, an input is converted to the', CR, 'data type and scaling of the output prior to performing', CR, 'the relational operation.', CR, 'The input  has precision ', sprintf('%15g', fxpPropU.Slope), CR, 'The output has precision ', sprintf('%15g', fxpPropY.Slope), CR, 'so there can be a precision loss each time the conversion is performed.', 'If you change the output data type so that it has sufficient', CR, 'range and precision to perfectly represent each input, then ', CR, 'the operation will be error-free.');
            % 1299 1310
            % 1300 1310
            % 1301 1310
            % 1302 1310
            % 1303 1310
            % 1304 1310
            % 1305 1310
            % 1306 1310
            % 1307 1310
            % 1308 1310
        end
        % 1310 1314
        % 1311 1314
        % 1312 1314
        quantNetSlopeAdj = num2fixpt(netSlopeAdj, sfix(33.0), fixptbestprec(netSlopeAdj, sfix(33.0)));
        % 1314 1316
        if ne(round(log2(quantNetSlopeAdj)), log2(quantNetSlopeAdj))
            % 1316 1318
            notes{plus(end, 1.0)}.path = curBlk;
            % 1318 1320
            notes{end}.issue = horzcat('The following MinMax blocks have an input with a fractional slope that does not', CR, 'equal the fractional slope of the output.', CR, sprintf('The input  has fractional slope %-15g', fxpPropU.SlopeAdjustmentFactor), CR, sprintf('The output has fractional slope %-15g', fxpPropY.SlopeAdjustmentFactor), CR, sprintf('The net slope adjustment is     %-15g', netSlopeAdj), CR, 'This mismatch causes the MinMax block to require a multiply operation each', CR, 'time the input is converted to the data type and scaling of the output.', CR, 'To remove this mismatch, change the scaling of either of the input or output.');
            % 1320 1330
            % 1321 1330
            % 1322 1330
            % 1323 1330
            % 1324 1330
            % 1325 1330
            % 1326 1330
            % 1327 1330
            % 1328 1330
        end
        % 1330 1332
    end
end
function notes = doDivSecond(curBlk)
    % 1334 1338
    % 1335 1338
    % 1336 1338
    notes = {};
    % 1338 1340
    CR = sprintf('\n');
    % 1340 1342
    notes{plus(end, 1.0)}.path = curBlk;
    % 1342 1344
    notes{end}.issue = horzcat('The following Product blocks are configured with a divide operation for the first input', CR, 'and a multiply operation for the second input. This configuration results', CR, 'in a reciprocal operation followed by a multiply operation. If you reverse', CR, 'the inputs so that the "multiply" occurs first and the division occurs second,', CR, 'a single division operation can handle both the first and second input.');
    % 1344 1350
    % 1345 1350
    % 1346 1350
    % 1347 1350
    % 1348 1350
end
function notes = manyMulDivSameBlock(curBlk)
    % 1351 1355
    % 1352 1355
    % 1353 1355
    notes = {};
    % 1355 1357
    CR = sprintf('\n');
    % 1357 1359
    notes{plus(end, 1.0)}.path = curBlk;
    % 1359 1361
    notes{end}.issue = horzcat('The following Product blocks are configured to do more than one multiplication or', CR, 'division operation. This is supported, but if the output data type is', CR, 'integer or fixed-point, then better results are likely if this operation', CR, 'is split across several blocks, with each block performing one multiplication or one', CR, 'division. Using several blocks allows you to control the data type', CR, 'and scaling used for intermediate calculations. The choice of data types', CR, 'for intermediate calculations effects precision, range errors, and efficiency.');
    % 1361 1369
    % 1362 1369
    % 1363 1369
    % 1364 1369
    % 1365 1369
    % 1366 1369
    % 1367 1369
end
function notes = manyDivSameBlock(curBlk)
    % 1370 1373
    % 1371 1373
    notes = {};
    % 1373 1375
    CR = sprintf('\n');
    % 1375 1377
    notes{plus(end, 1.0)}.path = curBlk;
    % 1377 1379
    notes{end}.issue = horzcat('The following Product blocks are configured to do more than one', CR, 'division operation. A general guideline from the field', CR, 'of numerical analysis is to multiply all the denominator', CR, 'terms together first, and then do only one division. This', CR, 'improves accuracy and often speed in floating-point and', CR, 'especially fixed-point calculations. This can', CR, 'be accomplished in Simulink by cascading Product blocks.');
    % 1379 1387
    % 1380 1387
    % 1381 1387
    % 1382 1387
    % 1383 1387
    % 1384 1387
    % 1385 1387
end
function notes = checkHardwareRounding(curRoot)
    % 1388 1393
    % 1389 1393
    % 1390 1393
    % 1391 1393
    notes = {};
    % 1393 1395
    CR = sprintf('\n');
    % 1395 1397
    encodedModelName = modeladvisorprivate('HTMLjsencode', get_param(curRoot, 'Name'), 'encode');
    encodedModelName = horzcat(encodedModelName{:});
    % 1398 1400
    cs = getActiveConfigSet(curRoot);
    % 1400 1402
    isERT = strcmp(get_param(cs, 'IsERTTarget'), 'on');
    % 1402 1404
    hardware = cs.getComponent('Hardware Implementation');
    % 1404 1406
    if strncmpi(hardware.ProdIntDivRoundTo, 'un', 2.0)
        % 1406 1408
        notes{plus(end, 1.0)}.path = {};
        % 1408 1410
        notes{end}.issue = horzcat('Integer division generated code could be more efficient.', CR, 'The rounding behavior of signed integer division is not fully specified', CR, 'by the C language standards.  When faced with this lack of specification,', CR, 'the code generated for division can be large in order to ensure bit-true', CR, 'agreement between simulation and code generation.  The Hardware Implementation', CR, 'pane of the Configuration Parameters dialog allows you to specify the rounding behavior of', CR, 'signed integer division for the Embedded Hardware.  For this', CR, 'model, the rounding behavior is currently set to ''Undefined''.', CR, 'You can reduce the size of the code generated for division', CR, 'by determining and setting this information.  The most common behavior is that', CR, 'signed integer division rounds to Zero.', '<p>', '<a href="matlab: modeladvisorprivate openSimprmAdvancedPage ', encodedModelName, ' "Hardware Implementation"', '"> ', 'Signed integer division rounding', '</a>');
        % 1410 1424
        % 1411 1424
        % 1412 1424
        % 1413 1424
        % 1414 1424
        % 1415 1424
        % 1416 1424
        % 1417 1424
        % 1418 1424
        % 1419 1424
        % 1420 1424
        % 1421 1424
        % 1422 1424
    end
    % 1424 1426
    optcs = cs.getComponent('Optimization');
    % 1426 1428
    if strcmp(optcs.NoFixptDivByZeroProtection, 'off') && isERT
        % 1428 1430
        notes{plus(end, 1.0)}.path = {};
        % 1430 1432
        notes{end}.issue = horzcat('Integer division generated code will contain protection against arithmetic', CR, 'exceptions like division by zero, INT_MIN/-1, and LONG_MIN/-1.  Depending on the', CR, 'hardware, arithmetic exceptions can cause dramatic behavior, so protecting against', CR, 'these exceptions can be critical.  Some designers construct their models in an extremely careful', CR, 'way that makes it impossible for exception triggering input combinations to reach a division operation.', CR, 'For these models, the protection code generated as part of the division operation', CR, 'is redundant.  This redundant protection code can be removed using the fixed-point division', CR, 'setting in the Optimization', CR, 'pane of the Configuration Parameters dialog.  This should only be done when you', CR, 'have painstakingly verified that your model cannot cause exceptions in division operations.', '<p>', '<a href="matlab: modeladvisorprivate openSimprmAdvancedPage ', encodedModelName, ' Optimization', '"> ', 'Remove code that protects against division arithmetic exceptions', '</a>');
        % 1432 1445
        % 1433 1445
        % 1434 1445
        % 1435 1445
        % 1436 1445
        % 1437 1445
        % 1438 1445
        % 1439 1445
        % 1440 1445
        % 1441 1445
        % 1442 1445
        % 1443 1445
    end
end
function wordSizes = getMicroSizes(curModel)
    % 1447 1450
    % 1448 1450
    gotMicroSizes = 0.0;
    % 1450 1452
    try
        % 1452 1454
        cs = getActiveConfigSet(curModel);
        hardware = cs.getComponent('Hardware Implementation');
        % 1455 1457
        devType = lower(get_param(cs, 'ProdHWDeviceType'));
        % 1457 1459
        asic = 'asic';
        fpga = 'fpga';
        unconstr = 'unconstr';
        % 1461 1463
        if strncmp(devType, asic, length(asic)) || strncmp(devType, fpga, length(fpga)) || strncmp(devType, unconstr, length(unconstr))
            % 1463 1467
            % 1464 1467
            % 1465 1467
            allowedIntegerSizes = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0 21.0 22.0 23.0 24.0 25.0 26.0 27.0 28.0 29.0 30.0 31.0 32.0 33.0 34.0 35.0 36.0 37.0 38.0 39.0 40.0 41.0 42.0 43.0 44.0 45.0 46.0 47.0 48.0 49.0 50.0 51.0 52.0 53.0 54.0 55.0 56.0 57.0 58.0 59.0 60.0 61.0 62.0 63.0 64.0 65.0 66.0 67.0 68.0 69.0 70.0 71.0 72.0 73.0 74.0 75.0 76.0 77.0 78.0 79.0 80.0 81.0 82.0 83.0 84.0 85.0 86.0 87.0 88.0 89.0 90.0 91.0 92.0 93.0 94.0 95.0 96.0 97.0 98.0 99.0 100.0 101.0 102.0 103.0 104.0 105.0 106.0 107.0 108.0 109.0 110.0 111.0 112.0 113.0 114.0 115.0 116.0 117.0 118.0 119.0 120.0 121.0 122.0 123.0 124.0 125.0 126.0 127.0 128.0];
        else
            allowedIntegerSizes = sort(double(transpose(vertcat(get_param(cs, 'ProdBitPerChar'), get_param(cs, 'ProdBitPerShort'), get_param(cs, 'ProdBitPerInt'), get_param(cs, 'ProdBitPerLong')))));
            % 1469 1475
            % 1470 1475
            % 1471 1475
            % 1472 1475
            % 1473 1475
            allowedIntegerSizes = unique(allowedIntegerSizes);
            % 1475 1477
            wordSizes.char = get_param(cs, 'ProdBitPerChar');
            wordSizes.short = get_param(cs, 'ProdBitPerShort');
            wordSizes.int = get_param(cs, 'ProdBitPerInt');
            wordSizes.long = get_param(cs, 'ProdBitPerLong');
            % 1480 1482
            gotMicroSizes = 1.0;
        end
        % 1483 1486
        % 1484 1486
    end % try
    % 1486 1488
    if eq(gotMicroSizes, 0.0)
        wordSizes = [];
        error('Could not determine word sizes of the intended target. Go to the Advanced Tab of the Simulink Configuration Parameters dialog. Make sure device is ''Microprocessor'' and sizes are set correctly');
    end
end
function res = isFixpt(numericDT)
    % 1493 1496
    % 1494 1496
    switch numericDT.Category
    case {'Fixed-point: binary point scaling','Fixed-point: unspecified scaling','Fixed-point: slope and bias scaling'}
        % 1497 1502
        % 1498 1502
        % 1499 1502
        % 1500 1502
        res = true;
    otherwise
        % 1503 1506
        % 1504 1506
        res = false;
    end
    % 1507 1509
    return
end
function res = isBool(numericDT)
    % 1511 1517
    % 1512 1517
    % 1513 1517
    % 1514 1517
    % 1515 1517
    switch numericDT.Category
    case 'Boolean'
        % 1518 1521
        % 1519 1521
        res = true;
    otherwise
        % 1522 1525
        % 1523 1525
        res = false;
    end
    % 1526 1528
    return
end
function res = isFloat(numericDT)
    % 1530 1536
    % 1531 1536
    % 1532 1536
    % 1533 1536
    % 1534 1536
    switch numericDT.Category
    case {'Double','Single'}
        % 1537 1541
        % 1538 1541
        % 1539 1541
        res = true;
    otherwise
        % 1542 1545
        % 1543 1545
        res = false;
    end
    % 1546 1548
    return
end
function res = get_runtimeparam_by_name(curBlk, paramName)
    % 1550 1556
    % 1551 1556
    % 1552 1556
    % 1553 1556
    % 1554 1556
    slerr = sllasterror;
    try
        rto = [];
        rto = get_param(curBlk, 'RuntimeObject');
    catch
        err = sllasterror;
        if gt(length(err), 1.0)
            errID = err{1.0}.MessageID;
        else
            errID = err.MessageID;
        end
        % 1566 1568
        if strcmp(errID, 'SL_RTI_REDUCED_BLOCK')
            sllasterror(slerr);
        else
            rethrow(lasterror);
        end
    end % try
    % 1573 1575
    res = [];
    % 1575 1577
    if not(isempty(rto))
        for i=1.0:rto.NumRuntimePrms
            % 1578 1580
            curRuntimePrm = rto.RuntimePrm(i);
            % 1580 1582
            if not(isempty(curRuntimePrm)) && strcmp(curRuntimePrm.Name, paramName)
                % 1582 1585
                % 1583 1585
                res = curRuntimePrm;
                break
            end
        end % for
    end
end
