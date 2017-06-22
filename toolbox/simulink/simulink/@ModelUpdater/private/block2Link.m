function block2Link(h, curBadBlock, refstring)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if doUpdate(h)
        % 7 13
        % 8 13
        % 9 13
        % 10 13
        % 11 13
        baseParamsToCopy = {'Tag','Description','RequirementInfo','Position','Orientation','ForegroundColor','BackgroundColor','DropShadow','NamePlacement','ShowName','Priority','AttributesFormatString','RTWdata','FontName','FontSize','FontWeight','FontAngle','IOType','UserDataPersistent','UserData','Diagnostics','StatePerturbationForJacobian','IOSignalStrings','ExtModeUploadOption','ExtModeLoggingTrig'};
        % 13 41
        % 14 41
        % 15 41
        % 16 41
        % 17 41
        % 18 41
        % 19 41
        % 20 41
        % 21 41
        % 22 41
        % 23 41
        % 24 41
        % 25 41
        % 26 41
        % 27 41
        % 28 41
        % 29 41
        % 30 41
        % 31 41
        % 32 41
        % 33 41
        % 34 41
        % 35 41
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        safelyIgnoredParameters = {'DblOver';'dolog';'EnableZeroCross'};
        % 41 43
        tempSys = h.TempName;
        tempBlk = horzcat(tempSys, '/junkblock');
        % 44 46
        curNewRefBlock = sprintf(refstring);
        curRefLibName = strtok(refstring, '/');
        load_system(curRefLibName);
        add_block(curNewRefBlock, tempBlk);
        % 49 51
        try
            % 51 55
            % 52 55
            % 53 55
            curParamNames = get_param(curBadBlock, 'MaskNames');
            curParamNames = cellhorzcat(baseParamsToCopy{:}, curParamNames{:});
            % 56 58
            try
                % 58 65
                % 59 65
                % 60 65
                % 61 65
                % 62 65
                % 63 65
                strToEval = 'set_param(tempBlk';
                % 65 67
                curParamValues = cell(length(curParamNames), 1.0);
                for k=1.0:length(curParamNames)
                    % 68 70
                    curNameOfParam = curParamNames{k};
                    % 70 72
                    if any(strcmp(safelyIgnoredParameters, curNameOfParam))
                        continue;
                    end % if
                    % 74 76
                    curValueOfMaskParam = get_param(curBadBlock, curNameOfParam);
                    curParamValues{k} = curValueOfMaskParam;
                    kStr = sprintf('%d', k);
                    strToEval = horzcat(strToEval, ',curParamNames{', kStr, '},curParamValues{', kStr, '}');
                    % 79 81
                end % for
                % 81 83
                strToEval = horzcat(strToEval, ');');
                eval(strToEval);
            catch
                % 85 91
                % 86 91
                % 87 91
                % 88 91
                % 89 91
                for k=1.0:length(curParamNames)
                    % 91 93
                    strToEval = 'set_param(tempBlk';
                    curNameOfParam = curParamNames{k};
                    curValueOfMaskParam = get_param(curBadBlock, curNameOfParam);
                    curParamValues{k} = curValueOfMaskParam;
                    kStr = num2str(k);
                    strToEval = horzcat(strToEval, ',curParamNames{', kStr, '},curParamValues{', kStr, '}');
                    strToEval = horzcat(strToEval, ');');
                    % 99 101
                    try
                        eval(strToEval);
                        % 102 104
                    end % try
                    % 104 106
                end % for
                % 106 108
            end % try
            % 108 110
            delete_block(curBadBlock);
            % 110 117
            % 111 117
            % 112 117
            % 113 117
            % 114 117
            % 115 117
            add_block(tempBlk, curBadBlock);
            % 117 120
            % 118 120
        end % try
        % 120 122
        delete_block(tempBlk);
    end % if
    % 123 125
end % function
