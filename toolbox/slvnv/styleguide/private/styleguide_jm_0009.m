function rec = styleguide_jm_0009
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:jm0009Title');
    rec.TitleID = 'StyleGuide: jm_0009';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:jm0009Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @jm_0009_StyleThreeCallback;
    rec.CallbackContext = 'PostCompile';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = false;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
    % 20 22
function [ResultDescription, ResultHandles] = jm_0009_StyleThreeCallback(system)
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    resultData = getCheckInformation(system);
    % 32 34
    [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData);
    % 34 36
function [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData)
    % 36 39
    % 37 39
    feature('scopedaccelenablement', 'off');
    % 39 42
    % 40 42
    ResultDescription = {};
    ResultHandles = {};
    failed = 0.0;
    % 44 47
    % 45 47
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('jm0009Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 48 51
    % 49 51
    if not(isempty(resultData(1.0).badBlocks))
        failed = 1.0;
        currentDescription = DAStudio.message('Slvnv:styleguide:jm0009FailMsg1');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData(1.0).badBlocks;
    end % if
    % 56 59
    % 57 59
    if not(isempty(resultData(2.0).badBlocks))
        failed = 1.0;
        currentDescription = DAStudio.message('Slvnv:styleguide:jm0009FailMsg2');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData(2.0).badBlocks;
    end % if
    % 64 67
    % 65 67
    if not(isempty(resultData(3.0).badBlocks))
        failed = 1.0;
        currentDescription = DAStudio.message('Slvnv:styleguide:jm0009FailMsg3');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData(3.0).badBlocks;
    end % if
    % 72 75
    % 73 75
    if failed
        mdladvObj.setCheckResultStatus(false);
    else
        % 77 79
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
        mdladvObj.setCheckResultStatus(true);
    end % if
    % 83 85
function resultData = getCheckInformation(system)
    % 85 89
    % 86 89
    % 87 89
    resultData = checkGotoScope(system);
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    resultData = checkGotoTag(system, resultData);
    % 94 96
function resultData = checkGotoScope(system)
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    resultData.badBlocks = {};
    % 101 104
    % 102 104
    gotoBlks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'BlockType', 'Goto', 'TagVisibility', 'global');
    % 104 109
    % 105 109
    % 106 109
    % 107 109
    if eq(isempty(gotoBlks), 0.0)
        % 109 111
        currentResult = notConnectedToFunctionCalls(gotoBlks);
        if eq(isempty(currentResult), 0.0)
            resultData.badBlocks = currentResult;
        end % if
    end % if
function resultData = checkGotoTag(system, resultData)
    % 116 124
    % 117 124
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    resultData(3.0).badBlocks = {};
    resultData(2.0).badBlocks = {};
    % 125 127
    gotoBlks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'BlockType', 'Goto');
    % 127 131
    % 128 131
    % 129 131
    fromBlks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'BlockType', 'From');
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    [gotoBlks, inSigNames] = notConnectedToFunctionCalls(gotoBlks);
    % 136 138
    if isempty(gotoBlks)
        return;
    end % if
    % 140 144
    % 141 144
    % 142 144
    noName = find(eq(strcmp(inSigNames, ''), 1.0));
    for inx=1.0:length(noName)
        resultData(3.0).badBlocks{plus(end, 1.0)} = gotoBlks{noName(inx)};
    end % for
    % 147 149
    hasName = find(eq(strcmp(inSigNames, ''), 0.0));
    gotoBlks = gotoBlks(hasName);
    inSigNames = inSigNames(hasName);
    % 151 153
    if isempty(gotoBlks)
        % 153 155
        return;
    end % if
    % 156 158
    gotoTags = ctranspose(get_param(gotoBlks, 'GotoTag'));
    % 158 161
    % 159 161
    missMatch = not(strcmp(gotoTags, inSigNames));
    % 161 164
    % 162 164
    gotoTags = gotoTags(missMatch);
    gotoBlks = gotoBlks(missMatch);
    numBad = length(gotoTags);
    for inx=1.0:numBad
        resultData(2.0).badBlocks(plus(end, 1.0)) = gotoBlks(inx);
    end % for
    % 169 172
    % 170 172
    fromTags = get_param(fromBlks, 'GotoTag');
    numFroms = length(gotoTags);
    for inx=1.0:numFroms
        % 174 176
        index = find(eq(strcmp(gotoTags{inx}, fromTags), 1.0));
        for jnx=1.0:length(index)
            resultData(2.0).badBlocks(plus(end, 1.0)) = fromBlks(index(jnx));
        end % for
    end % for
    % 180 182
function [retBlks, inSigNames] = notConnectedToFunctionCalls(inputBlks)
    % 182 185
    % 183 185
    ph = get_param(inputBlks, 'PortHandles');
    retBlks = {};
    inSigNames = {};
    for inx=1.0:length(ph)
        temp = get_param(ph{inx}.Inport, 'CompiledPortDataType');
        gcbo = get_param(inputBlks{inx}, 'Object');
        if eq(strcmp(temp, 'fcn_call'), 0.0)
            retBlks{plus(end, 1.0)} = inputBlks{inx};
            % 192 195
            % 193 195
            signalName = gcbo.InputSignalNames;
            if isempty(signalName{1.0})
                inSigNames{plus(end, 1.0)} = '';
            else
                if strcmp(signalName{1.0}(1.0), '<')
                    signalName = regexp(signalName{1.0}, '^<(.*)>$', 'tokens', 'once');
                end % if
                inSigNames{plus(end, 1.0)} = signalName{1.0};
            end % if
        end % if
    end % for
