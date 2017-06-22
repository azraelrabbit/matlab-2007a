function rec = styleguide_db_0146
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0146Title');
    rec.TitleID = 'StyleGuide: db_0146';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0146Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0146_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0146_StyleThreeCallback(varargin)
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    system = varargin{1.0};
    % 29 32
    % 30 32
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 33 36
    % 34 36
    resultData = getCheckInformation(system);
    % 36 39
    % 37 39
    [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData);
    % 39 41
function [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData)
    % 41 44
    % 42 44
    feature('scopedaccelenablement', 'off');
    % 44 46
    ResultDescription = {};
    ResultHandles = {};
    % 47 50
    % 48 50
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0146Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 51 53
    if isempty(resultData.badBlocks)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
        mdladvObj.setCheckResultStatus(true);
    else
        % 58 60
        currentDescription = DAStudio.message('Slvnv:styleguide:db0146FailMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData.badBlocks;
        mdladvObj.setCheckResultStatus(false);
    end % if
function resultData = getCheckInformation(system)
    % 65 69
    % 66 69
    % 67 69
    resultData.badBlocks = {};
    % 69 71
    trigBlks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'none', 'BlockType', 'TriggerPort');
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    enableBlks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'none', 'BlockType', 'EnablePort');
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    actionBlks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'none', 'BlockType', 'ActionPort');
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    allBlks = vertcat(trigBlks, enableBlks, actionBlks);
    % 86 89
    % 87 89
    blockLoc = get_param(allBlks, 'Position');
    blockLocExp = horzcat(blockLoc{:});
    blockY = blockLocExp(2.0:4.0:minus(end, 1.0));
    % 91 93
    parents = get_param(allBlks, 'Parent');
    for inx=1.0:length(parents)
        yMin = getBlockBoundaries(parents, inx);
        % 95 97
        if gt(blockY(inx), plus(yMin, 5.0))
            resultData.badBlocks{plus(end, 1.0)} = allBlks{inx};
        end % if
    end % for
function yMin = getBlockBoundaries(parents, inx)
    % 101 105
    % 102 105
    % 103 105
    yMin = Inf;
    allBlksInSub = find_system(parents{inx}, 'FollowLinks', styleguide_lib_follow('check'), 'SearchDepth', '1', 'Type', 'block');
    % 106 110
    % 107 110
    % 108 110
    pos = get_param(allBlksInSub, 'Position');
    pos = horzcat(pos{:});
    yMin = min(pos(2.0:4.0:minus(end, 1.0)));
