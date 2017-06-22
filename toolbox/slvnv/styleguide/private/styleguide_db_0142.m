function rec = styleguide_db_0142
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0142Title');
    rec.TitleID = 'StyleGuide: db_0142';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0142Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0142_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0142_StyleThreeCallback(system)
    % 22 26
    % 23 26
    % 24 26
    feature('scopedaccelenablement', 'off');
    % 26 29
    % 27 29
    ResultDescription = {};
    ResultHandles = {};
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0142Tip');
    ResultHandles{plus(end, 1.0)} = [];
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    checkType = 'check';
    % 35 38
    % 36 38
    failedBlocks = find_system(system, 'FollowLinks', styleguide_lib_follow(checkType), 'LookUnderMasks', 'on', 'FindAll', 'on', 'Type', 'block', 'NamePlacement', 'alternate');
    % 38 42
    % 39 42
    % 40 42
    if isempty(failedBlocks)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        mdladvObj.setCheckResultStatus(true);
        % 44 46
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
    else
        currentDescription = DAStudio.message('Slvnv:styleguide:db0142Fail');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = failedBlocks;
        mdladvObj.setCheckResultStatus(false);
    end % if
