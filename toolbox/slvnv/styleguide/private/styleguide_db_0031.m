function rec = styleguide_db_0031
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0031Title');
    % 12 14
    rec.TitleID = 'StyleGuide: db_0031';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0031Tip');
    % 15 17
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0031_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
    % 27 29
function [ResultDescription, ResultHandles] = db_0031_StyleThreeCallback(system)
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    feature('scopedaccelenablement', 'off');
    modelAdvisorObject = Simulink.ModelAdvisor.getModelAdvisor(system);
    modelAdvisorObject.setCheckResultStatus(false);
    % 36 38
    ResultDescription = {};
    ResultHandles = {};
    % 39 41
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0031Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    deviantSystems = {};
    % 51 54
    % 52 54
    if eq(sLSGIsModelReference(system), true)
    else
        % 55 59
        % 56 59
        % 57 59
        % 58 60
        checkResultData = {};
        checkResultData.targetZoomFactor = '100';
        % 61 73
        % 62 73
        % 63 73
        % 64 73
        % 65 73
        % 66 73
        % 67 73
        % 68 73
        % 69 73
        % 70 73
        % 71 73
        deviantSystems = sLSGGetDeviantSystemsAndSubsystems(system, 'ZoomFactor', checkResultData.targetZoomFactor);
        % 73 78
        % 74 78
        % 75 78
        % 76 78
    end % if
    % 78 81
    % 79 81
    if gt(length(deviantSystems), 0.0)
        % 81 83
        modelAdvisorObject.setCheckResultStatus(false);
        % 83 85
        ResultDescription{plus(end, 1.0)} = DAStudio.message('Slvnv:styleguide:db0031FailMsg');
        % 85 87
        ResultHandles{plus(end, 1.0)} = deviantSystems;
    else
        % 88 91
        % 89 91
        modelAdvisorObject.setCheckResultStatus(true);
        % 91 93
        ResultDescription{plus(end, 1.0)} = DAStudio.message('Slvnv:styleguide:PassedMsg');
        % 93 95
        ResultHandles{plus(end, 1.0)} = {};
        % 95 97
    end % if
    % 97 100
    % 98 100
