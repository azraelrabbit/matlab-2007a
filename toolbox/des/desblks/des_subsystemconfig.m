function varargout = des_subsystemconfig(block, action, subaction)
    % 1 5
    % 2 5
    % 3 5
    blockName = get_param(block, 'Name');
    blockAlias = strrep(blockName, '/', '//');
    ud = get_param(block, 'UserData');
    fcnCallBlockAlias = horzcat('f_', blockAlias);
    constantBlockAlias = horzcat('c_', blockAlias);
    fcnCallSS = '__fcn_ss__';
    parentBlock = get_param(block, 'parent');
    grandparentBlock = get_param(parentBlock, 'parent');
    % 12 14
    SBE2FCElib = 'simeventstranslate1';
    SBE2FCE = horzcat(SBE2FCElib, '/Signal-Based Event to Function-Call Event');
    muxName = 'Mux';
    % 16 19
    % 17 19
    inportLocationMsg = 'The Discrete Event Inport block must reside in a discrete event subsystem window. Please delete this block.';
    % 19 21
    inportDuplicationMsg = 'Duplication of Discrete Event Inport blocks is not supported. Please delete this block. If you want to create an additional input signal, then use Copy and Paste. If you want to create multiple lines for the same input signal, then draw a branch line.';
    % 21 25
    % 22 25
    % 23 25
    outportLocationMsg = 'The Discrete Event Outport block must reside in a discrete event subsystem window. Please delete this block.';
    % 25 27
    ssconfigLocationMsg = 'The Subsystem Configuration block must reside in a discrete event subsystem window. Please delete this block.';
    % 27 29
    inportUndoDeleteMsg = 'Undoing the deletion of a Discrete Event Inport block is not supported. Please delete this block again and then copy a Discrete Event Inport from the SimEvents Ports and Subsystems library.';
    % 29 31
    outportUndoDeleteMsg = 'Undoing the deletion of a Discrete Event Outport block is not supported. Please delete this block again and then copy a Discrete Event Outport from the SimEvents Ports and Subsystems library.';
    % 31 33
    ssconfigUndoDeleteMsg = 'Undoing the deletion of Subsystem Configuration block is not supported. Please delete this block again and then copy the Subsystem Configuration block from the SimEvents Ports and Subsystems library.';
    % 33 36
    % 34 36
    ssUndoDeleteMsg = 'Undoing the deletion of a Discrete Event Subsystem block is not supported. Please copy a Discrete Event Subsystem block from the SimEvents Ports and Subsystems library and paste the appropriate contents into its window. Then delete the subsystem, %s, whose deletion you tried to undo.';
    % 36 39
    % 37 39
    ssconfigDeleteMsg = 'You have deleted the Subsystem Configuration block that a discrete event subsystem requires. Please copy a Subsystem Configuration block from the SimEvents Ports and Subsystems library and paste it into the subsystem window of the %s block.';
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    gpud = '';
    pud = '';
    if not(isempty(grandparentBlock)) && not(strcmp(bdroot, grandparentBlock))
        gpud = get_param(grandparentBlock, 'UserData');
    end % if
    if not(isempty(parentBlock)) && not(strcmp(bdroot, parentBlock))
        pud = get_param(parentBlock, 'UserData');
    end % if
    switch action
    case 'copy'
        % 55 57
        switch ud.BlockType
        case 'DESinport'
            % 58 61
            % 59 61
            En = get_param(block, 'MaskEnables');
            En = strrep(En, 'off', 'on');
            set_param(block, 'MaskEnables', En);
            % 63 67
            % 64 67
            % 65 67
            if not(isfield(pud, 'BlockType')) || not(strcmp(pud.BlockType, 'DES_fcn_ss'))
                set_param(block, 'deletefcn', '');
                des_setPortErr(block, inportLocationMsg);
                return;
            end % if
            % 71 74
            % 72 74
            allBlocks = get_param(grandparentBlock, 'Blocks');
            if any(strmatch(blockName, allBlocks, 'exact'))
                return;
            end % if
            % 77 80
            % 78 80
            if strcmpi(get_param(block, 'BlockType'), 'InportShadow')
                set_param(block, 'DeleteFcn', '');
                des_setPortErr(block, inportDuplicationMsg);
                return;
            end % if
            % 84 86
            hInport = add_block('built-in/Inport', horzcat(grandparentBlock, '/', blockAlias), 'MakeNameUnique', 'on');
            set_param(hInport, 'PortDimensions', '1');
            set_param(hInport, 'SignalType', 'real');
            set_param(hInport, 'DataType', 'double');
            set_param(hInport, 'SamplingMode', 'Sample based');
            % 90 93
            % 91 93
            load_system(SBE2FCElib);
            % 93 95
            hfcnCallBlockName = add_block(SBE2FCE, horzcat(grandparentBlock, '/', fcnCallBlockAlias), 'MakeNameUnique', 'on');
            set_param(hfcnCallBlockName, 'GenerateFunctionCallUpon', 'Sample time hit from port ts');
            % 96 98
            add_line(grandparentBlock, horzcat(blockAlias, '/1'), horzcat(fcnCallBlockAlias, '/1'));
            % 98 103
            % 99 103
            % 100 103
            % 101 103
            ground_blk = find_system(grandparentBlock, 'LookUnderMasks', 'all', 'BlockType', 'Ground');
            if not(isempty(ground_blk))
                lineHandlesGround = get_param(ground_blk{1.0}, 'LineHandles');
                delete_line(lineHandlesGround.Outport);
                delete_block(ground_blk{1.0});
                lineHandlesMux = get_param(horzcat(grandparentBlock, '/', muxName), 'LineHandles');
                line2addPort = num2str(find(eq(lineHandlesMux.Inport, -1.0)));
                add_line(grandparentBlock, horzcat(fcnCallBlockAlias, '/1'), horzcat(muxName, '/', line2addPort));
            else
                % 111 113
                numMuxInputs = str2num(get_param(horzcat(grandparentBlock, '/', muxName), 'Inputs'));
                set_param(horzcat(grandparentBlock, '/', muxName), 'Inputs', num2str(plus(numMuxInputs, 1.0)));
                % 114 116
                add_line(grandparentBlock, horzcat(fcnCallBlockAlias, '/1'), horzcat(muxName, '/', get_param(horzcat(grandparentBlock, '/', muxName), 'Inputs')));
            end % if
            % 117 120
            % 118 120
            lineHandlesFCSS = get_param(parentBlock, 'LineHandles');
            % 120 122
            line2addPort = get_param(block, 'Port');
            add_line(grandparentBlock, horzcat(blockAlias, '/1'), horzcat(fcnCallSS, '/', line2addPort));
            % 123 125
            hConstant = add_block('built-in/Constant', horzcat(grandparentBlock, '/', constantBlockAlias), 'MakeNameUnique', 'on');
            set_param(horzcat(grandparentBlock, '/', fcnCallBlockAlias), 'EnableE1Port', 'on');
            % 126 128
            lineHandlesSBE2FCE = get_param(hfcnCallBlockName, 'LineHandles');
            line2addPort = num2str(find(eq(lineHandlesSBE2FCE.Inport, -1.0)));
            % 129 131
            add_line(grandparentBlock, horzcat(constantBlockAlias, '/1'), horzcat(fcnCallBlockAlias, '/2'));
            set_param(horzcat(grandparentBlock, '/', constantBlockAlias), 'Value', '1');
            % 132 134
            ud.OldName = blockName;
            set_param(block, 'UserData', ud);
            linkStatus = get_param(block, 'LinkStatus');
            if not(strcmp(linkStatus, 'none'))
                set_param(block, 'LinkStatus', 'none');
            end % if
            set_param(block, 'deletefcn', 'des_subsysteminport(gcb, ''delete'');');
            % 140 142
            des_subsystemmask(block, 'init', 'apply');
        case 'DESoutport'
            % 143 147
            % 144 147
            % 145 147
            set_param(block, 'LinkStatus', 'none');
            % 147 151
            % 148 151
            % 149 151
            if not(isfield(pud, 'BlockType')) || not(strcmp(pud.BlockType, 'DES_fcn_ss'))
                set_param(block, 'deletefcn', '');
                des_setPortErr(block, outportLocationMsg);
                return;
            end % if
            % 155 158
            % 156 158
            allBlocks = get_param(grandparentBlock, 'Blocks');
            if any(strmatch(blockName, allBlocks, 'exact'))
                return;
            end % if
            % 161 164
            % 162 164
            hOutport = add_block('built-in/Outport', horzcat(grandparentBlock, '/', blockAlias));
            % 164 166
            lineHandlesFCSS = get_param(parentBlock, 'LineHandles');
            % 166 168
            line2addPort = get_param(block, 'Port');
            add_line(grandparentBlock, horzcat(fcnCallSS, '/', line2addPort), horzcat(blockAlias, '/1'));
            % 169 171
            ud.OldName = blockName;
            set_param(block, 'UserData', ud);
        case 'DESsubsystem'
            % 173 177
            % 174 177
            % 175 177
            set_param(block, 'LinkStatus', 'none');
            find_system(block, 'LookUnderMasks', 'all', 'Name', 'f_Din');
        case 'DESconfig'
            % 179 182
            % 180 182
            set_param(block, 'LinkStatus', 'none');
            % 182 186
            % 183 186
            % 184 186
            if not(isfield(pud, 'BlockType')) || not(strcmp(pud.BlockType, 'DES_fcn_ss'))
                set_param(block, 'deletefcn', '');
                des_setPortErr(block, ssconfigLocationMsg);
                return;
            end % if
            % 190 194
            % 191 194
            % 192 194
            if not(isfield(pud, 'BlockType')) || not(strcmp(pud.BlockType, 'DES_fcn_ss'))
                set_param(block, 'deletefcn', '');
                configErrMsg = '''Subsystem Configuration'' block can be placed only in SimEvents Subsystem. Please delete it.';
                % 196 198
                des_setPortErr(block, configErrMsg);
                return;
            end % if
            % 200 202
            lineHandlesMux = get_param(horzcat(grandparentBlock, '/', muxName), 'linehandles');
            if ne(lineHandlesMux.Outport, -1.0)
                % 203 207
                % 204 207
                % 205 207
                return;
            end % if
            % 208 210
            add_line(grandparentBlock, horzcat(muxName, '/1'), horzcat(fcnCallSS, '/Trigger'));
        case 'DESsupportSS'
        otherwise
            % 212 214
            disp(horzcat(mfilename, ': CopyFcn callback for: ', blockName));
        end % switch
    case 'namechange'
        % 216 219
        % 217 219
        if strcmp(get_param(bdroot, 'Lock'), 'on')
            return;
        end % if
        switch ud.BlockType
        case 'DESinport'
            % 223 226
            % 224 226
            oldAlias = strrep(ud.OldName, '/', '//');
            % 226 229
            % 227 229
            set_param(horzcat(grandparentBlock, '/f_', oldAlias), 'Name', horzcat('f_', blockName));
            set_param(horzcat(grandparentBlock, '/c_', oldAlias), 'Name', horzcat('c_', blockName));
            set_param(horzcat(grandparentBlock, '/', oldAlias), 'Name', blockName);
            ud.OldName = blockName;
            set_param(block, 'UserData', ud);
        case 'DESoutport'
            % 234 237
            % 235 237
            oldAlias = strrep(ud.OldName, '/', '//');
            % 237 239
            set_param(horzcat(grandparentBlock, '/', oldAlias), 'Name', blockName);
            ud.OldName = blockName;
            set_param(block, 'UserData', ud);
        case 'DESsubsystem'
            % 242 244
            return;
        case 'DESsupportSS'
            return;
        otherwise
            % 247 250
            % 248 250
        end % switch
    case 'delete'
        % 251 255
        % 252 255
        % 253 255
        if strcmp(get_param(bdroot, 'BlockDiagramType'), 'library')
            return;
        end % if
        switch ud.BlockType
        case 'DESinport'
            % 259 262
            % 260 262
            if strcmp(get_param(block, 'BlockType'), 'InportShadow')
                return;
            end % if
            % 264 267
            % 265 267
            lineHandlesSBE2FCE = get_param(horzcat(grandparentBlock, '/', fcnCallBlockAlias), 'LineHandles');
            delete_line(lineHandlesSBE2FCE.Inport);
            delete_line(lineHandlesSBE2FCE.Outport);
            % 269 271
            lineHandlesInport = get_param(horzcat(grandparentBlock, '/', blockAlias), 'LineHandles');
            delete_line(lineHandlesInport.Outport);
            % 272 274
            delete_block(horzcat(grandparentBlock, '/f_', blockAlias));
            delete_block(horzcat(grandparentBlock, '/', blockAlias));
            % 275 277
            delete_block(horzcat(grandparentBlock, '/c_', blockAlias));
            % 277 280
            % 278 280
            g_blk = add_block('built-in/Ground', horzcat(grandparentBlock, '/ground'), 'MakeNameUnique', 'on');
            lineHandlesMux = get_param(horzcat(grandparentBlock, '/', muxName), 'LineHandles');
            % 281 283
            line2addPort = num2str(find(eq(lineHandlesMux.Inport, -1.0)));
            add_line(grandparentBlock, horzcat(get_param(g_blk, 'Name'), '/1'), horzcat(muxName, '/', line2addPort));
        case 'DESoutport'
            % 285 288
            % 286 288
            lineHandlesOutport = get_param(horzcat(grandparentBlock, '/', blockAlias), 'LineHandles');
            delete_line(lineHandlesOutport.Inport);
            delete_block(horzcat(grandparentBlock, '/', blockAlias));
        case 'DESsubsystem'
            % 291 293
            return;
            % 294 296
        case 'DESsupportSS'
            % 295 298
            % 296 298
            inportBlocks = find_system(parentBlock, 'LookUnderMasks', 'all', 'blocktype', 'Inport');
            % 298 301
            % 299 301
            outportBlocks = find_system(parentBlock, 'LookUnderMasks', 'all', 'blocktype', 'Outport');
            % 301 304
            % 302 304
            triggerportBlocks = find_system(parentBlock, 'LookUnderMasks', 'all', 'blocktype', 'TriggerPort');
            % 304 307
            % 305 307
            for idx=1.0:length(inportBlocks)
                set_param(char(inportBlocks{idx}), 'DeleteFcn', '');
            end % for
            % 309 311
            for idx=1.0:length(outportBlocks)
                set_param(char(outportBlocks{idx}), 'DeleteFcn', '')
            end % for
            % 313 315
            for idx=1.0:length(triggerportBlocks)
                set_param(char(triggerportBlocks{idx}), 'DeleteFcn', '')
            end % for
        case 'DESconfig'
            % 318 320
            lineHandlesMux = get_param(horzcat(grandparentBlock, '/', muxName), 'linehandles');
            delete_line(lineHandlesMux.Outport);
            ssName = get_param(grandparentBlock, 'Name');
            % 322 326
            % 323 326
            % 324 326
            errordlg(sprintf(ssconfigDeleteMsg, ssName));
        otherwise
            % 327 329
            disp(horzcat(mfilename, ': DeleteFcn callback for: ', blockName));
        end % switch
    case 'modelclose'
        % 331 334
        % 332 334
        if strcmp(get_param(bdroot, 'BlockDiagramType'), 'library')
            return;
        end % if
        % 336 340
        % 337 340
        % 338 340
        switch ud.BlockType
        case 'DESinport'
            set_param(block, 'deletefcn', '');
        case 'DESoutport'
            set_param(block, 'deletefcn', '');
        case 'DESconfig'
            set_param(block, 'deletefcn', '');
        case 'DESsupportSS'
            return;
        case 'DESsubsystem'
            return;
        otherwise
            % 351 353
            disp(horzcat(mfilename, ': ModelCloseFcn callback for: ', blockName));
        end % switch
    case 'open'
        switch ud.BlockType
        case 'DESsubsystem'
            open_system(horzcat(block, '/', fcnCallSS));
        otherwise
            % 359 361
            disp(horzcat(mfilename, ': OpenFcn callback for: ', blockName));
        end % switch
    case 'undodelete'
        switch ud.BlockType
        case 'DESinport'
            set_param(block, 'deletefcn', '');
            des_setPortErr(block, inportUndoDeleteMsg);
        case 'DESoutport'
            set_param(block, 'deletefcn', '');
            des_setPortErr(block, outportUndoDeleteMsg);
        case 'DESsupportSS'
            inportBlocks = find_system(parentBlock, 'LookUnderMasks', 'all', 'blocktype', 'Inport');
            % 372 374
            outportBlocks = find_system(parentBlock, 'LookUnderMasks', 'all', 'blocktype', 'Outport');
            % 374 376
            triggerportBlocks = find_system(parentBlock, 'LookUnderMasks', 'all', 'blocktype', 'TriggerPort');
            % 376 378
            for idx=1.0:length(inportBlocks)
                set_param(char(inportBlocks{idx}), 'UndoDeleteFcn', '');
                des_setPortErr(char(inportBlocks{idx}), '');
            end % for
            for idx=1.0:length(outportBlocks)
                set_param(char(outportBlocks{idx}), 'UndoDeleteFcn', '')
                des_setPortErr(char(outportBlocks{idx}), '');
            end % for
            for idx=1.0:length(triggerportBlocks)
                set_param(char(triggerportBlocks{idx}), 'UndoDeleteFcn', '')
                des_setPortErr(char(triggerportBlocks{idx}), '');
            end % for
            ssName = get_param(parentBlock, 'Name');
            % 390 394
            % 391 394
            % 392 394
            errordlg(sprintf(ssUndoDeleteMsg, ssName));
        case 'DESsubsystem'
            return;
        case 'DESconfig'
            set_param(block, 'deletefcn', '');
            des_setPortErr(block, ssconfigUndoDeleteMsg);
        otherwise
            % 400 402
            disp(horzcat(mfilename, ': UndoDeleteFcn callback for: ', blockName));
        end % switch
    case 'load'
        % 404 406
        if strcmp(get_param(bdroot, 'BlockDiagramType'), 'library')
            return;
        end % if
        % 408 412
        % 409 412
        % 410 412
        switch ud.BlockType
        case 'DESinport'
            return;
        case 'DESoutport'
            return;
        case 'DESconfig'
            return;
        case 'DESsupportSS'
            return;
        case 'DESsubsystem'
            find_system(parentBlock, 'LookUnderMasks', 'all', 'regexp', 'on', 'Name', 'f_.');
        otherwise
            % 423 426
            % 424 426
            disp(horzcat(mfilename, ': ModelCloseFcn callback for: ', blockName));
        end % switch
    case 'init'
        return;
    case 'presave'
        return;
    case 'start'
        return;
    case 'stop'
        return;
    case 'deletechild'
        return;
    case 'parentclose'
        return;
    end % switch
function des_setPortErr(blk, msg)
    % 441 444
    % 442 444
    En = get_param(blk, 'MaskEnables');
    % 444 446
    En = strrep(En, 'on', 'off');
    if not(isempty(En))
        set_param(blk, 'MaskEnables', En);
    end % if
    if not(isempty(msg))
        errordlg(msg);
    end % if
