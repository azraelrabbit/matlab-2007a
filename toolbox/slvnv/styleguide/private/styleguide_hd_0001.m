function rec = styleguide_hd_0001
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:hd0001Title');
    rec.TitleID = 'StyleGuide: hd_0001';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:hd0001Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @hd_0001_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
    % 21 23
function [ResultDescription, ResultHandles] = hd_0001_StyleThreeCallback(system)
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    feature('scopedaccelenablement', 'off');
    % 31 33
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    % 33 36
    % 34 36
    resultData = getCheckInformation(system);
    % 36 39
    % 37 39
    [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData);
    % 39 41
function [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData)
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    ResultDescription = {};
    ResultHandles = {};
    % 49 51
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('hd0001Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 52 55
    % 53 55
    if isempty(resultData(1.0).failedBlocks)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
        % 58 60
        mdladvObj.setCheckResultStatus(true);
    else
        % 61 63
        currentDescription = DAStudio.message('Slvnv:styleguide:hd0001FailMsg');
        mdladvObj.setCheckResultStatus(false);
        % 64 66
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData(1.0).failedBlocks;
    end % if
function resultData = getCheckInformation(system)
    % 69 78
    % 70 78
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    ProhibitedBlocks = {'DataStoreMemory','';'DataStoreRead','';'DataStoreWrite','';'Display','';'Scope','';'Stop','';'ToFile','';'ToWorkspace','';'SubSystem','XY scope.'};
    % 78 91
    % 79 91
    % 80 91
    % 81 91
    % 82 91
    % 83 91
    % 84 91
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    failedBlocks = [];
    % 91 94
    % 92 94
    for idx=1.0:size(ProhibitedBlocks, 1.0)
        % 94 96
        blks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'BlockType', ProhibitedBlocks{idx, 1.0}, 'MaskType', ProhibitedBlocks{idx, 2.0});
        % 96 103
        % 97 103
        % 98 103
        % 99 103
        % 100 103
        % 101 103
        failedBlocks = vertcat(failedBlocks, blks);
    end % for
    % 104 107
    % 105 107
    resultData.failedBlocks = failedBlocks;
    % 107 109
