function result = MAExecCheckContOrZohDataStore(system)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    result = [];
    nl = sprintf('\n');
    passString = horzcat('<p><font color="#008000">', DAStudio.message('Simulink:tools:MAPassedMsg'), '</font>');
    model = bdroot(system);
    hScope = get_param(system, 'Handle');
    hModel = get_param(model, 'Handle');
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    contBlocks = [];
    % 19 21
    if eq(hScope, hModel)
        readBlocks = find_system(hModel, 'LookUnderMasks', 'all', 'BlockType', 'DataStoreRead');
        writeBlocks = find_system(hModel, 'LookUnderMasks', 'all', 'BlockType', 'DataStoreWrite');
        memBlocks = find_system(hModel, 'LookUnderMasks', 'all', 'BlockType', 'DataStoreMemory');
        DSBlocks = horzcat(reshape(readBlocks, 1.0, []), reshape(writeBlocks, 1.0, []), reshape(memBlocks, 1.0, []));
        % 25 28
        % 26 28
        contTime = [0.0 0.0];
        zohTime = [0.0 1.0];
        % 29 31
        val = get_param(hModel, 'MultiTaskDSMMsg');
        [tmp, flag] = max(strcmp(val, {'none','warning','error'}));
        if eq(flag, 2.0) || eq(flag, 3.0)
            mt_flag = 1.0;
        else
            mt_flag = 0.0;
        end % if
        % 37 39
        for i=1.0:length(DSBlocks)
            ts = get_param(DSBlocks(i), 'CompiledSampleTime');
            if isequal(ts, contTime) || isequal(ts, zohTime)
                contBlocks = horzcat(contBlocks, DSBlocks(i));
            end % if
            % 43 45
        end % for
        % 45 48
        % 46 48
        if length(contBlocks) || not(mt_flag)
            % 48 50
            if length(contBlocks)
                result = horzcat('<ul> <li> ', DAStudio.message('Simulink:tools:MAMsgNonDiscSigDataStore'), nl, '<ul> ');
                % 51 53
                for i=1.0:length(contBlocks)
                    blkName = horzcat(get_param(contBlocks(i), 'Parent'), '/', get_param(contBlocks(i), 'Name'));
                    dispBlkName = regexprep(blkName, nl, ' ');
                    codeBlkName = modeladvisorprivate('HTMLjsencode', blkName, 'encode');
                    codeBlkName = horzcat(codeBlkName{:});
                    result = horzcat(result, nl, ' <li> <a href="matlab:modeladvisorprivate(''hiliteSystem'',''', codeBlkName, ''')">', dispBlkName, '</a></li>');
                end % for
                result = horzcat(result, nl, '</ul> ', nl, DAStudio.message('Simulink:tools:MAMsgNonDiscSigDataStoreSuggest'), ' </li> ');
            else
                result = horzcat('<ul> <li>', DAStudio.message('Simulink:tools:MANonContDSMPass'), '</li>');
            end % if
            % 63 65
            if mt_flag
                result = horzcat(result, nl, '<li> ', DAStudio.message('Simulink:tools:CheckEnabled', 'Multitasking Data Store blocks', 'cpd_diags_multitaskdatastore'), ' </li> </ul>');
            else
                encodedModelName = modeladvisorprivate('HTMLjsencode', get_param(hModel, 'Name'), 'encode');
                encodedModelName = horzcat(encodedModelName{:});
                result = horzcat(result, nl, '<li> ', DAStudio.message('Simulink:tools:MAMultiTaskCheck', encodedModelName), ' </li> </ul>');
            end % if
            % 71 73
            mdladvObj.setCheckResultStatus(false);
        else
            % 74 76
            result = passString;
            mdladvObj.setCheckResultStatus(true);
        end % if
    else
        % 79 81
        result = passString;
        mdladvObj.setCheckResultStatus(true);
    end % if
