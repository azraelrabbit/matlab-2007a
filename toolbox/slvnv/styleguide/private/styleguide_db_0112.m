function rec = styleguide_db_0112
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0112Title');
    rec.TitleID = 'StyleGuide: db_0112';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0112Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0112_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0112_StyleThreeCallback(system)
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    feature('scopedaccelenablement', 'off');
    % 28 30
    ResultDescription = {};
    ResultHandles = {};
    % 31 33
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0112Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 34 37
    % 35 37
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 38 41
    % 39 41
    hZeroBlks = db_0112_GetZeroBlks(system, 'check');
    % 41 44
    % 42 44
    currentResult = hZeroBlks;
    if isempty(currentResult)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        mdladvObj.setCheckResultStatus(true);
        % 47 49
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
    else
        currentDescription = DAStudio.message('Slvnv:styleguide:db0112FailMsg');
        mdladvObj.setCheckResultStatus(false);
        % 53 55
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
    end % if
function hZeroBlks = db_0112_GetZeroBlks(system, flag)
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    indexBlks = {'Assignment','IndexMode','Zero-based';'ForIterator','IndexMode','Zero-based';'MultiPortSwitch','zeroidx','on';'Selector','IndexMode','Zero-based'};
    % 63 71
    % 64 71
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    hZeroBlks = [];
    % 71 73
    for idx=1.0:size(indexBlks, 1.0)
        % 73 75
        blks = find_system(system, 'FollowLinks', styleguide_lib_follow(flag), 'LookUnderMasks', 'all', 'BlockType', indexBlks{idx, 1.0}, indexBlks{idx, 2.0}, indexBlks{idx, 3.0});
        % 75 82
        % 76 82
        % 77 82
        % 78 82
        % 79 82
        % 80 82
        hZeroBlks = vertcat(hZeroBlks, blks);
    end % for
