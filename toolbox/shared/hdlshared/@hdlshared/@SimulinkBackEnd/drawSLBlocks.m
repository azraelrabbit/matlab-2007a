function drawSLBlocks(this, path, hN)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdldisp(sprintf('Laying out components...'), 3.0);
    % 7 9
    if rootNetwork(this, hN)
        addInportBlocks(this, path, hN);
        addOutportBlocks(this, path, hN);
    end
    % 12 14
    vComps = hN.Components;
    numComps = length(vComps);
    % 15 17
    for i=1.0:numComps
        hC = vComps(i);
        if isValidComponent(this, hC)
            drawSLBlockFromPirComp(this, path, hC);
        else
            % 21 23
        end
    end % for
end
function valid = isValidComponent(this, hC)
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    valid = 1.0;
    if strcmp(this.hPir.getTimingControllerName, hC.Name)
        valid = 0.0;
    else
        if gt(hC.SimulinkHandle, 0.0)
            if isSyntheticBlock(this, hC.SimulinkHandle)
                valid = 0.0;
            end
        end
    end
end
function drawSLBlockFromPirComp(this, path, hC)
    % 42 45
    % 43 45
    cUserName = hC.Name;
    compName = hC.getClassName;
    % 46 48
    if isempty(cUserName) && not(isa(hC, 'hdlcoder.buffer_comp')) && not(isa(hC, 'hdlcoder.typechange_comp'))
        % 48 51
        % 49 51
        warning(hdlerrormsgid('simulinkbackend'), 'found pir comp with no name in:  ''%s''; making up one... %s', path);
        % 51 53
        cUserName = hC.RefNum;
    end
    % 54 56
    slBlockName = horzcat('', path, '/', cUserName, '');
    % 56 59
    % 57 59
    switch compName
    case {'const_comp'}
        % 60 62
        if not(isempty(hC.getOutputPortSignal(0.0).getReceivers))
            add_block('built-in/Constant', slBlockName);
            set_param(slBlockName, 'Value', hC.Value);
        end
    case {'abs_comp'}
        add_block('built-in/Abs', slBlockName);
    case {'gain_comp'}
        add_block('built-in/Gain', slBlockName);
        set_param(slBlockName, 'Gain', hC.Constant);
    case {'mul_comp'}
        add_block('built-in/Product', slBlockName);
        inputs = '**';
        set_param(slBlockName, 'Inputs', inputs);
    case {'div_comp'}
        add_block('built-in/Product', slBlockName);
        inputs = '*/';
        set_param(slBlockName, 'Inputs', inputs);
    case {'add_comp'}
        add_block('built-in/Sum', slBlockName);
        inputs = '++';
        set_param(slBlockName, 'Inputs', inputs);
    case {'sum_comp'}
        add_block('built-in/Sum', slBlockName);
        numin = hC.numberofInputPorts;
        inputs = '';
        for i=1.0:numin
            inputs = horzcat(inputs, sprintf('%s', '+'));
        end % for
        set_param(slBlockName, 'Inputs', inputs);
    case {'minus_comp'}
        add_block('built-in/Sum', slBlockName);
        inputs = '--';
        set_param(slBlockName, 'Inputs', inputs);
    case {'eq_comp'}
        add_block('built-in/RelationalOperator', slBlockName);
        set_param(slBlockName, 'relop', '==');
        hS = hC.getOutputPortSignal(0.0);
        sltype = computeDataType(this, hS);
        sltype.isnative = 0.0;
        setLogicDataType(this, slBlockName, sltype)
    case {'ne_comp'}
        add_block('built-in/RelationalOperator', slBlockName);
        set_param(slBlockName, 'relop', '~=');
        hS = hC.getOutputPortSignal(0.0);
        sltype = computeDataType(this, hS);
        sltype.isnative = 0.0;
        setLogicDataType(this, slBlockName, sltype)
    case {'lt_comp'}
        add_block('built-in/RelationalOperator', slBlockName);
        set_param(slBlockName, 'relop', '<');
        hS = hC.getOutputPortSignal(0.0);
        sltype = computeDataType(this, hS);
        sltype.isnative = 0.0;
        setLogicDataType(this, slBlockName, sltype)
    case {'le_comp'}
        add_block('built-in/RelationalOperator', slBlockName);
        set_param(slBlockName, 'relop', '<=');
        hS = hC.getOutputPortSignal(0.0);
        sltype = computeDataType(this, hS);
        sltype.isnative = 0.0;
        setLogicDataType(this, slBlockName, sltype)
    case {'gt_comp'}
        add_block('built-in/RelationalOperator', slBlockName);
        set_param(slBlockName, 'relop', '>');
        hS = hC.getOutputPortSignal(0.0);
        sltype = computeDataType(this, hS);
        sltype.isnative = 0.0;
        setLogicDataType(this, slBlockName, sltype)
    case {'ge_comp'}
        add_block('built-in/RelationalOperator', slBlockName);
        set_param(slBlockName, 'relop', '>=');
        hS = hC.getOutputPortSignal(0.0);
        sltype = computeDataType(this, hS);
        sltype.isnative = 0.0;
        setLogicDataType(this, slBlockName, sltype)
    case {'not_comp'}
        add_block('built-in/Logic', slBlockName);
        set_param(slBlockName, 'Operator', 'NOT');
    case {'nand_comp'}
        add_block('built-in/Logic', slBlockName);
        set_param(slBlockName, 'Operator', 'NAND');
    case {'nor_comp'}
        add_block('built-in/Logic', slBlockName);
        set_param(slBlockName, 'Operator', 'NOR');
    case {'and_comp'}
        add_block('built-in/Logic', slBlockName);
        set_param(slBlockName, 'Operator', 'AND');
    case {'or_comp'}
        add_block('built-in/Logic', slBlockName);
        set_param(slBlockName, 'Operator', 'OR');
    case {'xor_comp'}
        add_block('built-in/Logic', slBlockName);
        set_param(slBlockName, 'Operator', 'XOR');
    case {'intdelay_comp'}
        numDelays = hC.Delay;
        if eq(numDelays, 1.0)
            add_block('built-in/UnitDelay', slBlockName);
        else
            add_block('simulink/Discrete/Integer Delay', slBlockName);
            set_param(slBlockName, 'numDelays', num2str(numDelays));
        end
    case {'tapdelay_comp'}
        add_block('built-in/UnitDelay', slBlockName);
    case {'xnor_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'concat_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'mod_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'rem_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'exp_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'sll_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'sra_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'srl_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'rol_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'ror_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'ntwk_instance_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'uminus_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'buffer_comp'}
    case {'typechange_comp'}
    case {'block_comp'}
        drawCompFromSLBlock(this, path, hC);
    case {'black_box_comp'}
        % 193 198
        % 194 198
        % 195 198
        % 196 198
        isV1 = 1.0;
        if isV1
            drawCompFromSLBlockHDLImplementation(this, path, hC);
        else
            drawCompFromSLBlock(this, path, hC);
        end
    otherwise
        % 204 206
        error(hdlerrormsgid('simulinkbackend'), horzcat('unexpected component class: ', compName));
    end
    % 207 209
end
function drawCompFromSLBlockHDLImplementation(this, path, hC)
    % 210 220
    % 211 220
    % 212 220
    % 213 220
    % 214 220
    % 215 220
    % 216 220
    % 217 220
    % 218 220
    cUserName = hC.Name;
    slBlockName = horzcat('', path, '/', cUserName, '');
    % 221 225
    % 222 225
    % 223 225
    if isa(hC, 'hdlcoder.ntwk_instance_comp')
        addNetworkInstanceComp(this, hC, slBlockName);
    else
        % 227 229
        hC.generateSLBlock(slBlockName);
    end
    % 230 232
end
function drawCompFromSLBlock(this, path, hC)
    % 233 242
    % 234 242
    % 235 242
    % 236 242
    % 237 242
    % 238 242
    % 239 242
    % 240 242
    cUserName = hC.Name;
    slHandle = hC.SimulinkHandle;
    % 243 245
    if not(this.SourceModelValid)
        error(hdlerrormsgid('simulinkbackend'), 'Source model is no longer around, bailing out...');
    end
    % 247 249
    if eq(slHandle, 0.0)
        return
    end
    % 251 253
    blkType = get_param(slHandle, 'blocktype');
    refblock = get_param(slHandle, 'ReferenceBlock');
    % 254 256
    slBlockName = horzcat('', path, '/', cUserName, '');
    % 256 258
    if isa(hC, 'hdlcoder.ntwk_instance_comp')
        addNetworkInstanceComp(this, hC, slBlockName);
    else
        if strcmpi(blkType, 'SubSystem') && hdlisasubsystemblk(this, refblock)
            add_block(refblock, slBlockName);
        else
            if strcmpi(blkType, 'S-Function') && hdlisasfunblk(this, refblock)
                add_block(refblock, slBlockName);
            else
                if hdlisabuiltinblk(blkType)
                    add_block(horzcat('built-in/', blkType), slBlockName);
                else
                    error(hdlerrormsgid('simulinkbackend'), 'cannot handle component : ''%s'' ', slBlockName);
                end
            end
        end
    end
    if isValidSubsystem(hC)
        if hasmaskdlg(slHandle)
            pv = getMaskParams(this, slHandle);
            setMaskParams(this, slBlockName, pv);
        else
            pv = getMaskDlgParams(this, slHandle);
            setMaskDlgParams(this, slBlockName, pv);
        end
    end
end
function validSS = isValidSubsystem(hC)
    % 285 292
    % 286 292
    % 287 292
    % 288 292
    % 289 292
    % 290 292
    validSS = 0.0;
    if isa(hC, 'hdlcoder.ntwk_instance_comp')
        if strcmp(get_param(hC.SimulinkHandle, 'BlockType'), 'SubSystem')
            validSS = 1.0;
        end
    end
end
function result = rootNetwork(this, hN)
    % 299 303
    % 300 303
    % 301 303
    result = strcmp(hN.Name, this.RootNetworkName);
    % 303 305
end
function addNetworkInstanceComp(this, hC, slBlockName)
    % 306 314
    % 307 314
    % 308 314
    % 309 314
    % 310 314
    % 311 314
    % 312 314
    if not(isa(hC, 'hdlcoder.ntwk_instance_comp'))
        error(hdlerrormsgid('simulinkbackend'), 'Expecting Ntwk instance Component, got %s, %s', class(hC), hC.Name);
        % 315 318
        % 316 318
    end
    % 318 321
    % 319 321
    UseModelReference = this.UseModelReference;
    % 321 323
    hRefNtwk = hC.ReferenceNetwork;
    % 323 325
    if strcmp(UseModelReference, 'yes')
        % 325 327
        targetModelName = networktoModelName(this, hRefNtwk.Name);
        % 327 329
        openModel(this, targetModelName);
        % 329 331
        addSubModelPorts(this, targetModelName, hRefNtwk);
        % 331 334
        % 332 334
        save_system(targetModelName);
        % 334 336
        add_block('built-in/ModelReference', slBlockName, 'ModelName', targetModelName);
    else
        % 337 339
        % 338 341
        % 339 341
        add_block('built-in/SubSystem', slBlockName);
        % 341 343
        addSubSystemPorts(this, slBlockName, hRefNtwk);
        % 343 345
    end
    % 345 347
end
function addSubSystemPorts(this, subSysPath, hRefNtwk)
    % 348 358
    % 349 358
    % 350 358
    % 351 358
    % 352 358
    % 353 358
    % 354 358
    % 355 358
    % 356 358
    addInportBlocks(this, subSysPath, hRefNtwk);
    addOutportBlocks(this, subSysPath, hRefNtwk);
    % 359 361
end
function addSubModelPorts(this, modelName, hRefNtwk)
    % 362 373
    % 363 373
    % 364 373
    % 365 373
    % 366 373
    % 367 373
    % 368 373
    % 369 373
    % 370 373
    % 371 373
    addInportBlocks(this, modelName, hRefNtwk);
    addOutportBlocks(this, modelName, hRefNtwk);
    % 374 376
end
function addInportBlocks(this, path, hNtwkOrComp)
    % 377 381
    % 378 381
    % 379 381
    numInports = hNtwkOrComp.numberofInputPorts;
    vInports = hNtwkOrComp.InputPorts;
    % 382 384
    for i=1.0:numInports
        hP = vInports(i);
        if not(isempty(hP.getSignal)) && hP.getSignal.Synthetic
            continue;
        end
        slBlockName = horzcat(path, '/', hP.Name);
        add_block('built-in/Inport', slBlockName);
        % 390 392
        hN = hP.Owner;
        if not(hN.Synthetic)
            slHandle = find_system(hN.SimulinkHandle, 'SearchDepth', 1.0, 'blocktype', 'Inport', 'port', num2str(plus(hP.PortIndex, 1.0)));
            % 394 397
            % 395 397
            if not(isempty(slHandle))
                pv = getMaskDlgParams(this, slHandle(1.0));
                setMaskDlgParams(this, slBlockName, pv);
            end
        else
            hS = hP.getSignal;
            sltype = computeDataType(this, hS);
            setDataType(this, slBlockName, sltype)
        end
    end % for
    % 406 408
end
function addOutportBlocks(this, path, hNtwkOrComp)
    % 409 413
    % 410 413
    % 411 413
    numOutports = hNtwkOrComp.numberofOutputPorts;
    vOutports = hNtwkOrComp.OutputPorts;
    % 414 416
    for i=1.0:numOutports
        hP = vOutports(i);
        slBlockName = horzcat(path, '/', hP.Name);
        add_block('built-in/Outport', slBlockName);
        hN = hP.Owner;
        if not(hN.Synthetic)
            slHandle = find_system(hN.SimulinkHandle, 'SearchDepth', 1.0, 'blocktype', 'Outport', 'port', num2str(plus(hP.PortIndex, 1.0)));
            % 422 425
            % 423 425
            if not(isempty(slHandle))
                pv = getMaskDlgParams(this, slHandle(1.0));
                setMaskDlgParams(this, slBlockName, pv);
            end
        else
            hS = hP.getSignal;
            sltype = computeDataType(this, hS);
            setDataType(this, slBlockName, sltype)
        end
    end % for
    % 434 436
end
function sltype = computeDataType(this, hS)
    % 437 442
    % 438 442
    % 439 442
    % 440 442
    hT = hS.Type;
    dtprops = pirgetdatatypeinfo(hT);
    % 443 445
    sltype.isnative = dtprops.isnative;
    sltype.native = horzcat('', dtprops.sltype, '');
    sltype.viadialog = horzcat('fixdt(''', dtprops.sltype, ''')');
    % 447 449
    sltype.isvector = dtprops.isvector;
    sltype.sldims = horzcat('''[', num2str(dtprops.dims), ']''');
    % 450 452
    sltype.iscomplex = dtprops.iscomplex;
    % 452 454
end
function setDataType(this, slBlockName, sltype)
    % 455 459
    % 456 459
    % 457 459
    if sltype.isnative
        % 459 461
        set_param(slBlockName, 'DataType', sltype.native);
    else
        % 462 464
        set_param(slBlockName, 'DataType', 'Specify via dialog');
        set_param(slBlockName, 'OutDataType', sltype.viadialog);
    end
    % 466 468
    if sltype.isvector
        set_param(slBlockName, 'PortDimensions', sltype.sldims);
    end
    % 470 472
    if sltype.iscomplex
        set_param(slBlockName, 'SignalType', 'complex');
    end
    % 474 476
end
function setLogicDataType(this, slBlockName, sltype)
    % 477 482
    % 478 482
    % 479 482
    % 480 482
    if strcmp(this.SetDataTypesFromPir, 'yes')
        % 482 484
        if sltype.isnative
            % 484 486
            dt = sltype.native;
            if strcmpi(dt, 'boolean')
                set_param(slBlockName, 'LogicOutDataTypeMode', dt);
            else
                error(hdlerrormsgid('simulinkbackend'), 'Invalid outport data type setting specified for Relop %s', dt);
            end
        else
            % 492 494
            set_param(slBlockName, 'LogicOutDataTypeMode', 'Specify via dialog');
            set_param(slBlockName, 'LogicDataType', sltype.viadialog);
        end
        % 496 498
        if sltype.isvector
            set_param(slBlockName, 'PortDimensions', sltype.sldims);
        end
        % 500 502
        if sltype.iscomplex
            set_param(slBlockName, 'SignalType', 'complex');
        end
        % 504 506
    end
    % 506 508
end
