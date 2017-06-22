function des_enablesignalport(block, subaction, IOType, PortType, portLabelRoot, tgtPorts, varargin)
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
    % 21 22
    switch subaction
    case 'noapply'
        return;
    case 'apply'
    otherwise
        % 27 28
        error('Invalid choice for applyStatus in des_enableenumport');
        return;
    end % switch
    % 31 33
    % 32 33
    if isempty(strmatch(PortType, 'SL', 'exact'))
        msg = 'Parameter ''PortType'' must be SL.';
        error('SimEvents:InternalError:InvalidType', msg);
        return;
    end % if
    % 38 40
    % 39 40
    if ischar(tgtPorts) || any(le(tgtPorts, 0.0))
        msg = 'Parameter ''tgtPorts'' must be a positive numeric vector.';
        error('SimEvents:InternalError:InvalidType', msg);
        return;
    end % if
    % 45 47
    % 46 47
    [child, childName] = des_getchildblockname(block);
    ud = get_param(child, 'UserData');
    switch IOType
    case 'in'
        portInfo = ud.ipInfoSL;
        entityPortInfo = ud.ipInfoSE;
        dp = ud.dip;
        numPortsSL = length(portInfo.isEnabled);
        numPortsSE = length(ud.ipInfoSE.isEnabled);
    case 'out'
        portInfo = ud.opInfoSL;
        entityPortInfo = ud.opInfoSE;
        dp = ud.dop;
        numPortsSL = length(portInfo.isEnabled);
        numPortsSE = length(ud.opInfoSE.isEnabled);
    end % switch
    % 63 65
    % 64 65
    enumIdx = strmatch(portLabelRoot, portInfo.portLabel);
    curNum = length(enumIdx);
    if gt(curNum, 0.0)
        enumOffset = minus(min(enumIdx), 1.0);
    else
        enumOffset = numPortsSL;
    end % if
    curPorts = portInfo.portLabel(enumIdx);
    prePorts = portInfo.portLabel(1.0:enumOffset);
    postPorts = portInfo.portLabel(plus(max(enumIdx), 1.0):numPortsSL);
    % 75 77
    % 76 77
    newNum = length(tgtPorts);
    newPorts = cell(1.0, newNum);
    for idx=1.0:length(tgtPorts)
        newPorts{idx} = horzcat(portLabelRoot, num2str(tgtPorts(idx)));
    end % for
    % 82 84
    % 83 84
    [surplusPorts, surplusIdx] = setdiff(curPorts, newPorts);
    % 85 87
    % 86 87
    [missingPorts, missingIdx] = setdiff(newPorts, curPorts);
    % 88 91
    % 89 91
    % 90 91
    if isempty(surplusPorts) && isempty(missingPorts)
        return;
    end % if
    % 94 96
    % 95 96
    newNumPortsSL = plus(minus(numPortsSL, curNum), newNum);
    % 97 99
    % 98 99
    newPortInfo.portLabel(1.0:enumOffset) = prePorts;
    newPortInfo.portLabel(plus(enumOffset, 1.0):plus(enumOffset, newNum)) = newPorts;
    newPortInfo.portLabel(plus(plus(enumOffset, newNum), 1.0):newNumPortsSL) = postPorts;
    newPortInfo.isEnabled(1.0:enumOffset) = portInfo.isEnabled(1.0:enumOffset);
    newPortInfo.isEnabled(plus(enumOffset, 1.0):plus(enumOffset, newNum)) = repmat({'yes'}, 1.0, newNum);
    newPortInfo.isEnabled(plus(plus(enumOffset, newNum), 1.0):newNumPortsSL) = portInfo.isEnabled(plus(max(enumIdx), 1.0):numPortsSL);
    % 105 108
    % 106 108
    % 107 108
    switch IOType
    case 'in'
        ud.ipInfoSL = newPortInfo;
    case 'out'
        ud.opInfoSL = newPortInfo;
    end % switch
    % 114 115
    set_param(child, 'UserData', ud);
    % 116 118
    % 117 118
    iconStr = horzcat('image(des_iconLoad(''', ud.icon, '''),''center'');');
    set_param(block, 'maskdisplay', iconStr);
    set_param(child, 'maskdisplay', '');
    % 121 134
    % 122 134
    % 123 134
    % 124 134
    % 125 134
    % 126 134
    % 127 134
    % 128 134
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    % 133 134
    surplusIdx = plus(surplusIdx, enumOffset);
    % 135 136
    for idx=1.0:length(surplusIdx)
        posIdx = surplusIdx(idx);
        portIdxStr = num2str(posIdx);
        gwBlockName = horzcat(dp.Gway, '_', portInfo.portLabel{posIdx});
        % 140 141
        switch IOType
        case 'in'
            try
                delete_line(block, horzcat(gwBlockName, '/', dp.OtherConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
            catch
                % 146 147
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines/clearblocks');
            end % try
            try
                delete_line(block, horzcat(portInfo.portLabel{posIdx}, '/1'), horzcat(gwBlockName, '/1'));
            catch
                % 153 154
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines/clearblocks');
            end % try
        case 'out'
            try
                delete_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(gwBlockName, '/', dp.OtherConn, '1'));
            catch
                % 161 162
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines/clearblocks');
            end % try
            try
                delete_line(block, horzcat(gwBlockName, '/1'), horzcat(portInfo.portLabel{posIdx}, '/1'));
            catch
                % 168 169
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines');
            end % try
        end % switch
        % 173 174
        try
            delete_block(horzcat(block, '/', portInfo.portLabel{posIdx}));
        catch
            set_param(child, 'UserData', ud)
            des_maskstaterecovery(block, 'update');
        end % try
        try
            delete_block(horzcat(block, '/', gwBlockName));
        catch
            set_param(child, 'UserData', ud)
            des_maskstaterecovery(block, 'update');
        end % try
    end % for
    % 187 192
    % 188 192
    % 189 192
    % 190 192
    % 191 192
    [commonPorts, commonIdxNew, commonIdxCur] = intersect(newPorts, curPorts);
    % 193 194
    commonIdxNew = plus(commonIdxNew, enumOffset);
    commonIdxCur = plus(commonIdxCur, enumOffset);
    % 196 197
    for idx=1.0:length(commonIdxNew)
        % 198 199
        if ne(commonIdxNew(idx), commonIdxCur(idx))
            posIdx = commonIdxCur(idx);
            portIdxStr = num2str(posIdx);
            gwBlockName = horzcat(dp.Gway, '_', portInfo.portLabel{posIdx});
            switch IOType
            case 'in'
                try
                    delete_line(block, horzcat(gwBlockName, '/', dp.OtherConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                catch
                    % 208 209
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            case 'out'
                try
                    delete_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(gwBlockName, '/', dp.OtherConn, '1'));
                catch
                    % 216 217
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            end % switch
        end % if
    end % for
    % 223 225
    % 224 225
    if ne(curNum, newNum)
        % 226 227
        for posIdx=plus(plus(enumOffset, curNum), 1.0):numPortsSL
            portIdxStr = num2str(posIdx);
            gwBlockName = horzcat(dp.Gway, '_', portInfo.portLabel{posIdx});
            switch IOType
            case 'in'
                try
                    delete_line(block, horzcat(gwBlockName, '/', dp.OtherConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                catch
                    % 235 236
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            case 'out'
                try
                    delete_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(gwBlockName, '/', dp.OtherConn, '1'));
                catch
                    % 243 244
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            end % switch
        end % for
        % 249 250
        for idx=1.0:length(entityPortInfo.portLabel)
            portIdxStr = num2str(plus(numPortsSL, idx));
            try
                switch IOType
                case 'in'
                    delete_line(block, horzcat(entityPortInfo.portLabel{idx}, '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                case 'out'
                    % 257 258
                    delete_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(entityPortInfo.portLabel{idx}, '/', dp.PConn, '1'));
                    % 259 260
                end % switch
            catch
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines');
            end % try
        end % for
    end % if
    % 267 272
    % 268 272
    % 269 272
    % 270 272
    % 271 272
    childTagStr = des_gettagstr(dp.PTagSE, plus(newNumPortsSL, numPortsSE));
    % 273 274
    try
        % 275 276
        if not(local_syslocked(block))
            set_param(child, dp.ConnTag, childTagStr);
        end % if
        % 279 281
        % 280 281
    end % try
    % 282 283
    labelSLip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSL.portLabel);
    labelSEip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSE.portLabel, length(ud.ipInfoSL.portLabel));
    % 285 286
    labelSLop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSL.portLabel);
    labelSEop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSE.portLabel, length(ud.opInfoSL.portLabel));
    % 288 290
    % 289 290
    allLabels = strvcat(labelSLip, labelSEip, labelSLop, labelSEop);
    % 291 292
    set_param(child, 'maskdisplay', allLabels);
    % 293 298
    % 294 298
    % 295 298
    % 296 298
    % 297 298
    for idx=1.0:length(commonIdxNew)
        % 299 300
        if ne(commonIdxNew(idx), commonIdxCur(idx))
            posIdx = commonIdxNew(idx);
            portIdxStr = num2str(posIdx);
            gwBlockName = horzcat(dp.Gway, '_', newPortInfo.portLabel{posIdx});
            switch IOType
            case 'in'
                try
                    add_line(block, horzcat(gwBlockName, '/', dp.OtherConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                catch
                    % 309 310
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            case 'out'
                try
                    add_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(gwBlockName, '/', dp.OtherConn, '1'));
                catch
                    % 317 318
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            end % switch
        end % if
    end % for
    % 324 326
    % 325 326
    if ne(curNum, newNum)
        % 327 328
        for posIdx=plus(plus(enumOffset, newNum), 1.0):newNumPortsSL
            portIdxStr = num2str(posIdx);
            gwBlockName = horzcat(dp.Gway, '_', newPortInfo.portLabel{posIdx});
            switch IOType
            case 'in'
                try
                    add_line(block, horzcat(gwBlockName, '/', dp.OtherConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                catch
                    % 336 337
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            case 'out'
                try
                    add_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(gwBlockName, '/', dp.OtherConn, '1'));
                catch
                    % 344 345
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines/clearblocks');
                end % try
            end % switch
        end % for
        % 350 351
        for idx=1.0:length(entityPortInfo.portLabel)
            portIdxStr = num2str(plus(newNumPortsSL, idx));
            try
                switch IOType
                case 'in'
                    add_line(block, horzcat(entityPortInfo.portLabel{idx}, '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                case 'out'
                    % 358 359
                    add_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(entityPortInfo.portLabel{idx}, '/', dp.PConn, '1'));
                    % 360 361
                end % switch
            catch
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines');
            end % try
        end % for
    end % if
    % 368 373
    % 369 373
    % 370 373
    % 371 373
    % 372 373
    missingIdx = plus(missingIdx, enumOffset);
    % 374 375
    for idx=1.0:length(missingIdx)
        posIdx = missingIdx(idx);
        portIdxStr = num2str(posIdx);
        gwBlockName = horzcat(dp.Gway, '_', newPortInfo.portLabel{posIdx});
        % 379 380
        try
            add_block(horzcat('des_sfun_lib/', dp.PTagSL), horzcat(block, '/', newPortInfo.portLabel{posIdx}), 'PortDimensions', '-1');
        catch
            % 383 384
            % 384 385
            set_param(child, 'UserData', ud)
            des_maskstaterecovery(block, 'update');
        end % try
        try
            add_block(horzcat('des_sfun_lib/', dp.Gway), horzcat(block, '/', gwBlockName), varargin{:});
        catch
            % 391 392
            set_param(child, 'UserData', ud)
            des_maskstaterecovery(block, 'update');
        end % try
        % 395 396
        switch IOType
        case 'in'
            try
                add_line(block, horzcat(gwBlockName, '/', dp.OtherConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
            catch
                % 401 402
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines/clearblocks');
            end % try
            try
                add_line(block, horzcat(newPortInfo.portLabel{posIdx}, '/1'), horzcat(gwBlockName, '/1'));
            catch
                % 408 409
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines/clearblocks');
            end % try
        case 'out'
            try
                add_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(gwBlockName, '/', dp.OtherConn, '1'));
            catch
                % 416 417
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines/clearblocks');
            end % try
            try
                add_line(block, horzcat(gwBlockName, '/1'), horzcat(newPortInfo.portLabel{posIdx}, '/1'));
            catch
                % 423 424
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines');
            end % try
        end % switch
    end % for
    % 429 434
    % 430 434
    % 431 434
    % 432 434
    % 433 434
    startingIdx = minus(length(strmatch('yes', newPortInfo.isEnabled, 'exact')), newNum);
    for idx=1.0:newNum
        try
            set_param(horzcat(block, '/', newPorts{idx}), 'port', num2str(plus(idx, startingIdx)));
            % 438 440
            % 439 440
        end % try
    end % for
    % 442 443
    for idx=plus(plus(enumOffset, newNum), 1.0):newNumPortsSL
        try
            set_param(horzcat(block, '/', newPortInfo.portLabel{idx}), 'port', num2str(idx));
            % 446 448
            % 447 448
        end % try
    end % for
    % 450 452
    % 451 452
    enPortsSL = strmatch('yes', ud.ipInfoSL.isEnabled, 'exact');
    labelSLip = des_getlabelstrings(ud.dip.ConnSL, ud.ipInfoSL.portLabel(enPortsSL));
    labelSEip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSE.portLabel);
    % 455 456
    enPortsSL = strmatch('yes', ud.opInfoSL.isEnabled, 'exact');
    labelSLop = des_getlabelstrings(ud.dop.ConnSL, ud.opInfoSL.portLabel(enPortsSL));
    labelSEop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSE.portLabel);
    % 459 460
    iconStr = horzcat('image(des_iconLoad(''', ud.icon, '''),''center'');');
    allEnLabels = strvcat(iconStr, labelSLip, labelSEip, labelSLop, labelSEop);
    set_param(block, 'maskdisplay', allEnLabels);
    % 463 464
    return;
end % function
function y = local_syslocked(sys)
    % 467 472
    % 468 472
    % 469 472
    % 470 472
    % 471 472
    y = not(isempty(sys));
    if y
        y = strcmpi(get_param(bdroot(sys), 'lock'), 'on');
    end % if
    % 476 477
    return;
end % function
