function result = MAExecCheckReadWriteOrderChecking(system)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    result = '';
    passString = horzcat('<p><font color="#008000">', DAStudio.message('Simulink:tools:MAPassedMsg'), '</font>');
    model = bdroot(system);
    hScope = get_param(system, 'Handle');
    hModel = get_param(model, 'Handle');
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 18 20
    if eq(hScope, hModel)
        % 20 22
        memBlocks = find_system(hModel, 'LookUnderMasks', 'all', 'BlockType', 'DataStoreMemory');
        % 22 24
        [msg_rbw, rbw_flag] = locGlobalDataStoreCheck(hModel, 'ReadBeforeWriteMsg', memBlocks, 'read before write', 'cpd_diags_detectreadbeforewrite');
        [msg_war, war_flag] = locGlobalDataStoreCheck(hModel, 'WriteAfterReadMsg', memBlocks, 'write after read', 'cpd_diags_detectwriteafterread');
        [msg_waw, waw_flag] = locGlobalDataStoreCheck(hModel, 'WriteAfterWriteMsg', memBlocks, 'write after write', 'cpd_diags_detectwriteafterwrite');
        % 26 28
        if rbw_flag && war_flag && waw_flag
            result = passString;
            mdladvObj.setCheckResultStatus(true);
        else
            result = horzcat('<ul><li>', msg_rbw, '</li><li>', msg_war, '</li><li>', msg_waw, '</li></ul>', DAStudio.message('Simulink:tools:MADiagHasPerformanceHit', 'Disable all'));
            mdladvObj.setCheckResultStatus(false);
        end % if
    else
        result = passString;
        mdladvObj.setCheckResultStatus(true);
    end % if
function [msg, ok_flag] = locGlobalDataStoreCheck(hModel, blkParmName, memBlocks, checkStr, topicId)
    % 39 43
    % 40 43
    % 41 43
    nl = sprintf('\n');
    val = get_param(hModel, blkParmName);
    passString = DAStudio.message('Simulink:tools:CheckPassed', checkStr, topicId);
    enableString = DAStudio.message('Simulink:tools:CheckEnabled', checkStr, topicId);
    % 46 48
    [tmp, flag] = max(strcmp(val, {'DisableAll','UseLocalSettings','EnableAllAsWarning','EnableAllAsError'}));
    % 48 51
    % 49 51
    switch flag(1.0)
    case 1.0
        if length(memBlocks)
            encodedModelName = modeladvisorprivate('HTMLjsencode', get_param(hModel, 'Name'), 'encode');
            encodedModelName = horzcat(encodedModelName{:});
            % 55 57
            msg = DAStudio.message('Simulink:tools:MAMsgGlobalDataStoreRWOrder', encodedModelName, checkStr, topicId);
            % 57 59
            ok_flag = 0.0;
        else
            msg = passString;
            ok_flag = 1.0;
        end % if
    case 2.0
        msg = [];
        ok_flag = 1.0;
        for i=1.0:length(memBlocks)
            p_val = get_param(memBlocks(i), blkParmName);
            if strcmp(p_val, 'none')
                if isempty(msg)
                    encodedModelName = modeladvisorprivate('HTMLjsencode', get_param(hModel, 'Name'), 'encode');
                    encodedModelName = horzcat(encodedModelName{:});
                    msg = DAStudio.message('Simulink:tools:MAMsgLocalDataStoreRWOrder', encodedModelName, checkStr, topicId);
                end % if
                blkName = horzcat(get_param(memBlocks(i), 'Parent'), '/', get_param(memBlocks(i), 'Name'));
                dispBlkName = regexprep(blkName, nl, ' ');
                codeBlkName = modeladvisorprivate('HTMLjsencode', blkName, 'encode');
                codeBlkName = horzcat(codeBlkName{:});
                msg = horzcat(msg, ' <p> <a href="matlab:modeladvisorprivate(''hiliteSystem'',''', codeBlkName, ''')">', dispBlkName, '</a>');
                ok_flag = 0.0;
            end % if
        end % for
        if isempty(msg)
            if length(memBlocks)
                msg = enableString;
            else
                msg = passString;
            end % if
        end % if
    case 3.0
        msg = enableString;
        ok_flag = 1.0;
    case 4.0
        msg = enableString;
        ok_flag = 1.0;
    otherwise
        msg = horzcat('Bad flag from find global setting of ', checkStr);
        ok_flag = 0.0;
    end % switch
