function numPortsEnabled = des_enableentityport(block, subaction, IOType, PortType, portLabelRoot, numPorts, varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    switch subaction
    case 'noapply'
        return;
    case 'apply'
    otherwise
        % 25 26
        error('Invalid choice for applyStatus in des_enableenumport');
        return;
    end % switch
    % 29 31
    % 30 31
    if isempty(strmatch(PortType, 'SE', 'exact'))
        msg = 'Parameter ''PortType'' must be SE.';
        error('SimEvents:InternalError:InvalidType', msg);
        return;
    end % if
    % 36 38
    % 37 38
    if isempty(numPorts) || ischar(numPorts)
        msg = 'Parameter ''numPorts'' must be a scalar.';
        error('SimEvents:InternalError:InvalidType', msg);
        return;
    end % if
    % 43 46
    % 44 46
    % 45 46
    [child, childName] = des_getchildblockname(block);
    ud = get_param(child, 'UserData');
    switch IOType
    case 'in'
        portInfo = ud.ipInfoSE;
    case 'out'
        portInfo = ud.opInfoSE;
    end % switch
    % 54 56
    % 55 56
    allIdx = strmatch(portLabelRoot, portInfo.portLabel);
    maxNumPort = length(allIdx);
    % 58 59
    if eq(numPorts, maxNumPort)
        % 60 61
        return;
    end % if
    % 63 64
    enumOffset = minus(min(allIdx), 1.0);
    numPortsSE = length(portInfo.isEnabled);
    curPorts = portInfo.portLabel(allIdx);
    prePorts = portInfo.portLabel(1.0:enumOffset);
    postPorts = portInfo.portLabel(plus(max(allIdx), 1.0):numPortsSE);
    % 69 71
    % 70 71
    newPortsLabel = cell(1.0, numPorts);
    newPortsEnabled = repmat({'yes'}, 1.0, numPorts);
    for idx=1.0:numPorts
        newPortsLabel{idx} = horzcat(portLabelRoot, num2str(idx));
    end % for
    % 76 78
    % 77 78
    newNumPortsSE = plus(minus(numPortsSE, maxNumPort), numPorts);
    % 79 81
    % 80 81
    newPortInfo.portLabel(1.0:enumOffset) = prePorts;
    newPortInfo.portLabel(plus(enumOffset, 1.0):plus(enumOffset, numPorts)) = newPortsLabel;
    newPortInfo.portLabel(plus(plus(enumOffset, numPorts), 1.0):newNumPortsSE) = postPorts;
    newPortInfo.isEnabled(1.0:enumOffset) = portInfo.isEnabled(1.0:enumOffset);
    newPortInfo.isEnabled(plus(enumOffset, 1.0):plus(enumOffset, numPorts)) = newPortsEnabled;
    newPortInfo.isEnabled(plus(plus(enumOffset, numPorts), 1.0):newNumPortsSE) = portInfo.isEnabled(plus(max(allIdx), 1.0):numPortsSE);
    % 87 90
    % 88 90
    % 89 90
    switch IOType
    case 'in'
        ud.ipInfoSE = newPortInfo;
        % 93 94
        numPortsSL = length(ud.ipInfoSL.isEnabled);
        % 95 96
        dp = ud.dip;
    case 'out'
        ud.opInfoSE = newPortInfo;
        % 99 100
        numPortsSL = length(ud.opInfoSL.isEnabled);
        % 101 102
        dp = ud.dop;
    end % switch
    % 104 106
    % 105 106
    set_param(child, 'UserData', ud);
    % 107 109
    % 108 109
    if lt(numPorts, maxNumPort)
        % 110 121
        % 111 121
        % 112 121
        % 113 121
        % 114 121
        % 115 121
        % 116 121
        % 117 121
        % 118 121
        % 119 121
        % 120 121
        enPortsSL = strmatch('yes', ud.ipInfoSL.isEnabled, 'exact');
        enPortsSE = strmatch('yes', ud.ipInfoSE.isEnabled, 'exact');
        labelSLip = des_getlabelstrings(ud.dip.ConnSL, ud.ipInfoSL.portLabel(enPortsSL));
        labelSEip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSE.portLabel(enPortsSE));
        % 125 126
        enPortsSL = strmatch('yes', ud.opInfoSL.isEnabled, 'exact');
        enPortsSE = strmatch('yes', ud.opInfoSE.isEnabled, 'exact');
        labelSLop = des_getlabelstrings(ud.dop.ConnSL, ud.opInfoSL.portLabel(enPortsSL));
        labelSEop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSE.portLabel(enPortsSE));
        % 130 131
        iconStr = horzcat('image(des_iconLoad(''', ud.icon, '''),''center'');');
        allEnLabels = strvcat(iconStr, labelSLip, labelSEip, labelSLop, labelSEop);
        set_param(block, 'maskdisplay', allEnLabels);
        % 134 137
        % 135 137
        % 136 137
        for posIdx=plus(plus(enumOffset, numPorts), 1.0):plus(enumOffset, maxNumPort)
            try
                portIdxStr = num2str(plus(posIdx, numPortsSL));
                switch IOType
                case 'in'
                    delete_line(block, horzcat(portLabelRoot, num2str(posIdx), '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                case 'out'
                    % 144 145
                    delete_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(portLabelRoot, num2str(posIdx), '/', dp.PConn, '1'));
                    % 146 147
                end % switch
            catch
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines');
            end % try
            try
                delete_block(horzcat(block, '/', portLabelRoot, num2str(posIdx)));
            catch
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update/clearlines');
            end % try
        end % for
        % 159 160
        for posIdx=plus(plus(enumOffset, maxNumPort), 1.0):numPortsSE
            if strcmp(portInfo.isEnabled(posIdx), 'yes')
                try
                    portIdxStr = num2str(plus(posIdx, numPortsSL));
                    switch IOType
                    case 'in'
                        delete_line(block, horzcat(portInfo.portLabel{posIdx}, '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                    case 'out'
                        % 168 169
                        delete_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(portInfo.portLabel{posIdx}, '/', dp.PConn, '1'));
                        % 170 171
                    end % switch
                catch
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines');
                end % try
            end % if
        end % for
        % 178 183
        % 179 183
        % 180 183
        % 181 183
        % 182 183
        labelSLip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSL.portLabel);
        labelSEip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSE.portLabel, length(ud.ipInfoSL.portLabel));
        % 185 186
        labelSLop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSL.portLabel);
        labelSEop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSE.portLabel, length(ud.opInfoSL.portLabel));
        % 188 190
        % 189 190
        allLabels = strvcat(labelSLip, labelSEip, labelSLop, labelSEop);
        % 191 192
        set_param(child, 'maskdisplay', allLabels);
        % 193 196
        % 194 196
        % 195 196
        childTagStr = des_gettagstr(dp.PTagSE, plus(numPortsSL, newNumPortsSE));
        % 197 198
        try
            % 199 200
            if not(local_syslocked(block))
                set_param(child, dp.ConnTag, childTagStr);
            end % if
            % 203 205
            % 204 205
        end % try
        % 206 208
        % 207 208
        for posIdx=plus(plus(enumOffset, numPorts), 1.0):newNumPortsSE
            if strcmp(newPortInfo.isEnabled(posIdx), 'yes')
                try
                    portIdxStr = num2str(plus(posIdx, numPortsSL));
                    switch IOType
                    case 'in'
                        add_line(block, horzcat(newPortInfo.portLabel{posIdx}, '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                    case 'out'
                        % 216 217
                        add_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(newPortInfo.portLabel{posIdx}, '/', dp.PConn, '1'));
                        % 218 219
                    end % switch
                catch
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines');
                end % try
            end % if
        end % for
    else
        % 227 238
        % 228 238
        % 229 238
        % 230 238
        % 231 238
        % 232 238
        % 233 238
        % 234 238
        % 235 238
        % 236 238
        % 237 238
        for posIdx=plus(plus(enumOffset, maxNumPort), 1.0):numPortsSE
            if strcmp(portInfo.isEnabled(posIdx), 'yes')
                try
                    portIdxStr = num2str(plus(posIdx, numPortsSL));
                    switch IOType
                    case 'in'
                        delete_line(block, horzcat(portInfo.portLabel{posIdx}, '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                    case 'out'
                        % 246 247
                        delete_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(portInfo.portLabel{posIdx}, '/', dp.PConn, '1'));
                        % 248 249
                    end % switch
                    delete_block(horzcat(block, '/', portInfo.portLabel{posIdx}));
                catch
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines');
                end % try
            end % if
        end % for
        % 257 258
        childTagStr = des_gettagstr(dp.PTagSE, plus(numPortsSL, newNumPortsSE));
        % 259 260
        try
            % 261 262
            if not(local_syslocked(block))
                set_param(child, dp.ConnTag, childTagStr);
            end % if
            % 265 267
            % 266 267
        end % try
        % 268 272
        % 269 272
        % 270 272
        % 271 272
        labelSLip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSL.portLabel);
        labelSEip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSE.portLabel, length(ud.ipInfoSL.portLabel));
        % 274 275
        labelSLop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSL.portLabel);
        labelSEop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSE.portLabel, length(ud.opInfoSL.portLabel));
        % 277 279
        % 278 279
        allLabels = strvcat(labelSLip, labelSEip, labelSLop, labelSEop);
        % 280 281
        set_param(child, 'maskdisplay', allLabels);
        % 282 285
        % 283 285
        % 284 285
        for posIdx=plus(maxNumPort, 1.0):numPorts
            try
                add_block(horzcat('des_sfun_lib/', dp.PTagSE), horzcat(block, '/', portLabelRoot, num2str(posIdx)), 'Side', dp.Side);
            catch
                % 289 290
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update');
            end % try
            try
                portIdxStr = num2str(plus(posIdx, numPortsSL));
                switch IOType
                case 'in'
                    add_line(block, horzcat(portLabelRoot, num2str(posIdx), '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                case 'out'
                    % 299 300
                    add_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(portLabelRoot, num2str(posIdx), '/', dp.PConn, '1'));
                    % 301 302
                end % switch
            catch
                set_param(child, 'UserData', ud)
                des_maskstaterecovery(block, 'update');
            end % try
        end % for
        % 308 310
        % 309 310
        for posIdx=plus(plus(enumOffset, numPorts), 1.0):newNumPortsSE
            if strcmp(newPortInfo.isEnabled(posIdx), 'yes')
                try
                    portIdxStr = num2str(plus(posIdx, numPortsSL));
                    add_block(horzcat('des_sfun_lib/', dp.PTagSE), horzcat(block, '/', newPortInfo.portLabel{posIdx}), 'Side', dp.Side);
                    % 315 316
                    switch IOType
                    case 'in'
                        add_line(block, horzcat(newPortInfo.portLabel{posIdx}, '/', dp.PConn, '1'), horzcat(childName, '/', dp.Conn, portIdxStr));
                    case 'out'
                        % 320 321
                        add_line(block, horzcat(childName, '/', dp.Conn, portIdxStr), horzcat(newPortInfo.portLabel{posIdx}, '/', dp.PConn, '1'));
                        % 322 323
                    end % switch
                catch
                    set_param(child, 'UserData', ud)
                    des_maskstaterecovery(block, 'update/clearlines');
                end % try
            end % if
        end % for
        % 330 333
        % 331 333
        % 332 333
        enPortsSL = strmatch('yes', ud.ipInfoSL.isEnabled, 'exact');
        enPortsSE = strmatch('yes', ud.ipInfoSE.isEnabled, 'exact');
        labelSLip = des_getlabelstrings(ud.dip.ConnSL, ud.ipInfoSL.portLabel(enPortsSL));
        labelSEip = des_getlabelstrings(ud.dip.Conn, ud.ipInfoSE.portLabel(enPortsSE));
        % 337 338
        enPortsSL = strmatch('yes', ud.opInfoSL.isEnabled, 'exact');
        enPortsSE = strmatch('yes', ud.opInfoSE.isEnabled, 'exact');
        labelSLop = des_getlabelstrings(ud.dop.ConnSL, ud.opInfoSL.portLabel(enPortsSL));
        labelSEop = des_getlabelstrings(ud.dop.Conn, ud.opInfoSE.portLabel(enPortsSE));
        % 342 343
        iconStr = horzcat('image(des_iconLoad(''', ud.icon, '''),''center'');');
        allEnLabels = strvcat(iconStr, labelSLip, labelSEip, labelSLop, labelSEop);
        set_param(block, 'maskdisplay', allEnLabels);
        % 346 347
    end % if
    % 348 349
    return;
end % function
function y = local_syslocked(sys)
    % 352 358
    % 353 358
    % 354 358
    % 355 358
    % 356 358
    % 357 358
    y = not(isempty(sys));
    if y
        y = strcmpi(get_param(bdroot(sys), 'lock'), 'on');
    end % if
end % function
