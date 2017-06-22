function rec = styleguide_db_0008
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
    rec.Title = DAStudio.message('Slvnv:styleguide:db0008Title');
    % 12 14
    rec.TitleID = 'StyleGuide: db_0008';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0008Tip');
    % 15 17
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0008_StyleThreeCallback;
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
function [ResultDescription, ResultHandles] = db_0008_StyleThreeCallback(system)
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    feature('scopedaccelenablement', 'off');
    ResultDescription = {};
    ResultHandles = {};
    % 36 38
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0008Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 39 41
    modelAdvisorObject = Simulink.ModelAdvisor.getModelAdvisor(system);
    modelAdvisorObject.setCheckResultStatus(false);
    % 42 53
    % 43 53
    % 44 53
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    deviantSystems = {};
    % 53 55
    if eq(sLSGIsModelReference(system), true)
    else
        % 56 60
        % 57 60
        % 58 60
        % 59 72
        % 60 72
        % 61 72
        % 62 72
        % 63 72
        % 64 72
        % 65 72
        % 66 72
        % 67 72
        % 68 72
        % 69 72
        % 70 72
        checkResultData = {};
        checkResultData.targetScreenColor = 'white';
        % 73 85
        % 74 85
        % 75 85
        % 76 85
        % 77 85
        % 78 85
        % 79 85
        % 80 85
        % 81 85
        % 82 85
        % 83 85
        deviantSystems = sLSGGetDeviantSystemsAndSubsystems(system, 'ScreenColor', checkResultData.targetScreenColor);
        % 85 91
        % 86 91
        % 87 91
        % 88 91
        % 89 91
    end % if
    % 91 95
    % 92 95
    % 93 95
    if gt(length(deviantSystems), 0.0)
        % 95 98
        % 96 98
        modelAdvisorObject.setCheckResultStatus(false);
        % 98 100
        ResultDescription{plus(end, 1.0)} = DAStudio.message('Slvnv:styleguide:db0008FailMsg');
        % 100 102
        ResultHandles{plus(end, 1.0)} = deviantSystems;
    else
        % 103 107
        % 104 107
        % 105 107
        modelAdvisorObject.setCheckResultStatus(true);
        % 107 109
        ResultDescription{plus(end, 1.0)} = DAStudio.message('Slvnv:styleguide:PassedMsg');
        % 109 112
        % 110 112
        ResultHandles{plus(end, 1.0)} = {};
        % 112 114
    end % if
    % 114 116
