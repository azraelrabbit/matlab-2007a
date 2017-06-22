function rec = styleguide_db_0033
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
    rec.Title = DAStudio.message('Slvnv:styleguide:db0033Title');
    % 12 14
    rec.TitleID = 'StyleGuide: db_0033';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0033Tip');
    % 15 17
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0033_StyleThreeCallback;
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
function [ResultDescription, ResultHandles] = db_0033_StyleThreeCallback(system)
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    feature('scopedaccelenablement', 'off');
    % 34 36
    modelAdvisorObject = Simulink.ModelAdvisor.getModelAdvisor(system);
    modelAdvisorObject.setCheckResultStatus(false);
    % 37 39
    ResultDescription = {};
    ResultHandles = {};
    % 40 42
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0033Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 43 45
    checkResultData = {};
    % 45 61
    % 46 61
    % 47 61
    % 48 61
    % 49 61
    % 50 61
    % 51 61
    % 52 61
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    checkResultData.parametersToCheck = {'WideLines','StatusBar','Toolbar'};
    % 61 64
    % 62 64
    checkResultData.parameterTargetValues = {'on','on','on'};
    % 64 67
    % 65 67
    parameterfailureOutputs = cellhorzcat(horzcat('<P>', DAStudio.message('Slvnv:styleguide:db0033WideVectorLinesFailMsg'), '</P>'), horzcat('<P>', DAStudio.message('Slvnv:styleguide:db0033StatusBarFailMsg'), '</P>'), horzcat('<P>', DAStudio.message('Slvnv:styleguide:db0033ToolbarFailMsg'), '</P>'));
    % 67 82
    % 68 82
    % 69 82
    % 70 82
    % 71 82
    % 72 82
    % 73 82
    % 74 82
    % 75 82
    % 76 82
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    parameterComparisonResults = zeros(length(checkResultData.parametersToCheck));
    % 82 86
    % 83 86
    % 84 86
    if eq(sLSGIsModelReference(system), true)
    else
        % 87 90
        % 88 90
        % 89 93
        % 90 93
        % 91 93
        parameterValues = {};
        % 93 98
        % 94 98
        % 95 98
        % 96 98
        for parameterIndex=1.0:length(checkResultData.parametersToCheck)
            % 98 104
            % 99 104
            % 100 104
            % 101 104
            % 102 104
            parameterValues{parameterIndex} = get_param(bdroot(system), checkResultData.parametersToCheck{parameterIndex});
            % 104 108
            % 105 108
            % 106 108
        end % for
        % 108 110
        parameterComparisonResults = strcmp(parameterValues, checkResultData.parameterTargetValues);
        % 110 114
        % 111 114
        % 112 114
    end % if
    % 114 118
    % 115 118
    % 116 118
    if eq(sLSGIsModelReference(system), true) || eq(all(parameterComparisonResults), true)
        % 118 123
        % 119 123
        % 120 123
        % 121 123
        modelAdvisorObject.setCheckResultStatus(true);
        % 123 125
        ResultDescription{plus(end, 1.0)} = horzcat('<P>', DAStudio.message('Slvnv:styleguide:PassedMsg'), '</P>');
        % 125 130
        % 126 130
        % 127 130
        % 128 130
        ResultHandles{plus(end, 1.0)} = {};
    else
        % 131 135
        % 132 135
        % 133 135
        modelAdvisorObject.setCheckResultStatus(false);
        % 135 137
        failureOutput = '';
        % 137 139
        if eq(strcmp(system, bdroot(system)), true)
        else
            % 140 143
            % 141 143
            % 142 148
            % 143 148
            % 144 148
            % 145 148
            % 146 148
            failureOutput = horzcat('<P>', DAStudio.message('Slvnv:styleguide:db0033AbnormalContextMsg'), '</P>');
            % 148 153
            % 149 153
            % 150 153
            % 151 153
        end % if
        % 153 157
        % 154 157
        % 155 157
        failureOutput = horzcat(failureOutput, parameterfailureOutputs{not(parameterComparisonResults)});
        % 157 160
        % 158 160
        ResultDescription{plus(end, 1.0)} = failureOutput;
        % 160 166
        % 161 166
        % 162 166
        % 163 166
        % 164 166
        ResultHandles{plus(end, 1.0)} = cellhorzcat(bdroot(system));
        % 166 168
    end % if
    % 168 170
