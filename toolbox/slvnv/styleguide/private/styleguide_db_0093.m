function rec = styleguide_db_0093
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0093Title');
    rec.TitleID = 'StyleGuide: db_0093';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0093Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0093_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0093_StyleThreeCallback(varargin)
    % 24 28
    % 25 28
    % 26 28
    system = varargin{1.0};
    % 28 31
    % 29 31
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    % 31 34
    % 32 34
    resultData = getCheckInformation(system);
    % 34 37
    % 35 37
    [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData);
    % 37 39
function [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData)
    % 39 43
    % 40 43
    % 41 43
    feature('scopedaccelenablement', 'off');
    % 43 46
    % 44 46
    ResultDescription = {};
    ResultHandles = {};
    % 47 49
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0093Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 50 52
    if isempty(resultData.badBlocks)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        mdladvObj.setCheckResultStatus(true);
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
    else
        % 57 59
        currentDescription = DAStudio.message('Slvnv:styleguide:db0093FailMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData.badBlocks;
        mdladvObj.setCheckResultStatus(false);
    end % if
function resultData = getCheckInformation(system)
    % 64 68
    % 65 68
    % 66 68
    resultData.badBlocks = {};
    % 68 72
    % 69 72
    % 70 72
    origSetting = get_param(system, 'SignalResolutionControl');
    if strcmp(origSetting, 'UseLocalSettings')
        set_param(system, 'SignalResolutionControl', 'TryResolveAll');
    end % if
    % 75 78
    % 76 78
    lineHandles = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'FindAll', 'on', 'LookUnderMasks', 'all', 'Type', 'line');
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    lineNames = get_param(lineHandles, 'Name');
    % 83 85
    index = find(eq(strcmp(lineNames, ''), 0.0));
    lineHandles = lineHandles(index);
    srcBlkHand = get_param(lineHandles, 'SrcBlockHandle');
    lineObj = get_param(lineHandles, 'Object');
    lineNames = lineNames(index);
    numNamed = length(lineNames);
    for inx=1.0:numNamed
        try
            % 92 94
            dstPortObj = get_param(lineObj{inx}.DstPortHandle(1.0), 'Object');
            srcPortObj = dstPortObj.getActualSrc;
            actSrcName = get_param(srcPortObj(1.0), 'Name');
        catch
            srcPortObj = get_param(lineObj{inx}.SrcPortHandle(1.0), 'Object');
            actSrcName = srcPortObj.name;
        end % try
        if eq(strcmp(actSrcName, lineNames{inx}), 0.0)
            srcBlkHandObj = get_param(srcBlkHand{inx}, 'Object');
            resultData.badBlocks{plus(end, 1.0)} = srcBlkHandObj.getFullName;
        end % if
    end % for
    % 105 108
    % 106 108
    set_param(system, 'SignalResolutionControl', origSetting);
    % 108 110
