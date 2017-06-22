function rec = styleguide_db_0042
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0042Title');
    rec.TitleID = 'StyleGuide: db_0042';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0042Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0042_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0042_StyleThreeCallback(system)
    % 22 26
    % 23 26
    % 24 26
    feature('scopedaccelenablement', 'off');
    % 26 29
    % 27 29
    ResultDescription = {};
    ResultHandles = {};
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0042Tip');
    ResultHandles{plus(end, 1.0)} = [];
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 34 37
    % 35 37
    modelPorts.Inports = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'on', 'FindAll', 'on', 'BlockType', 'Inport');
    modelPorts.DupInports = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'on', 'FindAll', 'on', 'BlockType', 'InportShadow');
    modelPorts.Outports = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'on', 'FindAll', 'on', 'BlockType', 'Outport');
    % 39 43
    % 40 43
    % 41 43
    modelPorts.Inports = vertcat(horzcat(modelPorts.Inports), horzcat(modelPorts.DupInports));
    % 43 46
    % 44 46
    failedInports = checkInputFlow(modelPorts);
    failedOutports = checkOutputFlow(modelPorts);
    failedOrient = checkOrientation(modelPorts);
    failedInportDups = modelPorts.DupInports;
    failedNameVisibility = checkNameVisibility(modelPorts);
    checksPassed = horzcat(isempty(failedInports), isempty(failedOutports), isempty(failedOrient), isempty(failedInportDups), isempty(failedNameVisibility));
    % 51 55
    % 52 55
    % 53 55
    if all(checksPassed)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        mdladvObj.setCheckResultStatus(true);
        % 57 59
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
    else
        % 61 63
        currentDescription = DAStudio.message('Slvnv:styleguide:db0042AnyFail');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
        mdladvObj.setCheckResultStatus(false);
        % 66 70
        % 67 70
        % 68 70
        if not(checksPassed(1.0))
            currentDescription = DAStudio.message('Slvnv:styleguide:db0042InportsFail');
            ResultDescription{plus(end, 1.0)} = currentDescription;
            ResultHandles{plus(end, 1.0)} = failedInports;
        end % if
        % 74 77
        % 75 77
        if not(checksPassed(2.0))
            currentDescription = DAStudio.message('Slvnv:styleguide:db0042OutportsFail');
            ResultDescription{plus(end, 1.0)} = currentDescription;
            ResultHandles{plus(end, 1.0)} = failedOutports;
        end % if
        % 81 84
        % 82 84
        if not(checksPassed(3.0))
            currentDescription = DAStudio.message('Slvnv:styleguide:db0042OrientFail');
            ResultDescription{plus(end, 1.0)} = currentDescription;
            ResultHandles{plus(end, 1.0)} = failedOrient;
        end % if
        % 88 91
        % 89 91
        if not(checksPassed(4.0))
            currentDescription = DAStudio.message('Slvnv:styleguide:db0042DupsFail');
            ResultDescription{plus(end, 1.0)} = currentDescription;
            ResultHandles{plus(end, 1.0)} = failedInportDups;
        end % if
        % 95 98
        % 96 98
        if not(checksPassed(5.0))
            currentDescription = DAStudio.message('Slvnv:styleguide:db0042HiddenFail');
            ResultDescription{plus(end, 1.0)} = currentDescription;
            ResultHandles{plus(end, 1.0)} = failedNameVisibility;
        end % if
    end % if
function failedPorts = checkInputFlow(modelPorts)
    % 104 107
    % 105 107
    margin = 5.0;
    % 107 109
    failedPorts = [];
    for i=1.0:length(modelPorts.Inports)
        % 110 113
        % 111 113
        iObj = get_param(modelPorts.Inports(i), 'Object');
        % 113 117
        % 114 117
        % 115 117
        iPortPos = iObj.PortConnectivity(1.0).Position;
        % 117 122
        % 118 122
        % 119 122
        % 120 122
        for j=1.0:length(iObj.PortConnectivity.DstBlock)
            % 122 124
            dObj = get_param(iObj.PortConnectivity.DstBlock(j), 'Object');
            % 124 128
            % 125 128
            % 126 128
            dPortCon = dObj.PortConnectivity(plus(iObj.PortConnectivity.DstPort(j), 1.0));
            dPortPos = dPortCon.Position;
            % 129 135
            % 130 135
            % 131 135
            % 132 135
            % 133 135
            BlockTypeFromDst = get_param(dPortCon.SrcBlock, 'BlockType');
            blockTypesMatch = strcmp(BlockTypeFromDst, iObj.BlockType);
            % 136 139
            % 137 139
            if blockTypesMatch
                % 139 141
                delta = minus(dPortPos(1.0), iPortPos(1.0));
                if lt(delta, uminus(margin))
                    failedPorts(plus(end, 1.0)) = iObj.Handle;
                end % if
            end % if
        end % for
    end % for
function failedPorts = checkOutputFlow(modelPorts)
    % 148 152
    % 149 152
    % 150 152
    margin = 5.0;
    % 152 154
    failedPorts = [];
    for i=1.0:length(modelPorts.Outports)
        % 155 157
        oObj = get_param(modelPorts.Outports(i), 'Object');
        % 157 161
        % 158 161
        % 159 161
        oPortPos = oObj.PortConnectivity(1.0).Position;
        % 161 166
        % 162 166
        % 163 166
        % 164 166
        if ne(oObj.PortConnectivity.SrcBlock(1.0), -1.0)
            sObj = get_param(oObj.PortConnectivity.SrcBlock(1.0), 'Object');
            % 167 173
            % 168 173
            % 169 173
            % 170 173
            % 171 173
            portOffset = plus(plus(plus(length(sObj.PortHandles.Inport), length(sObj.PortHandles.Enable)), length(sObj.PortHandles.Trigger)), length(sObj.PortHandles.Ifaction));
            % 173 175
            portNumber = plus(plus(portOffset, oObj.PortConnectivity.SrcPort(1.0)), 1.0);
            % 175 178
            % 176 178
            sPortCon = sObj.PortConnectivity(portNumber);
            sPortPos = sPortCon.Position;
            % 179 185
            % 180 185
            % 181 185
            % 182 185
            % 183 185
            delta = minus(oPortPos(1.0), sPortPos(1.0));
            if lt(delta, uminus(margin))
                failedPorts(plus(end, 1.0)) = oObj.Handle;
            end % if
        end % if
    end % for
function failedPorts = checkOrientation(modelPorts)
    % 191 195
    % 192 195
    % 193 195
    failedPorts = [];
    defaultOrient = 'right';
    % 196 199
    % 197 199
    for i=1.0:length(modelPorts.Inports)
        portOrient = get_param(modelPorts.Inports(i), 'Orientation');
        if not(strcmp(portOrient, defaultOrient))
            failedPorts(plus(end, 1.0)) = modelPorts.Inports(i);
        end % if
    end % for
    % 204 206
    for i=1.0:length(modelPorts.Outports)
        portOrient = get_param(modelPorts.Outports(i), 'Orientation');
        if not(strcmp(portOrient, defaultOrient))
            failedPorts(plus(end, 1.0)) = modelPorts.Outports(i);
        end % if
    end % for
function failedPorts = checkNameVisibility(modelPorts)
    % 212 215
    % 213 215
    failedPorts = [];
    % 215 217
    for i=1.0:length(modelPorts.Inports)
        if strcmp(get_param(modelPorts.Inports(i), 'ShowName'), 'off')
            failedPorts(plus(end, 1.0)) = modelPorts.Inports(i);
        end % if
    end % for
    for i=1.0:length(modelPorts.Outports)
        if strcmp(get_param(modelPorts.Outports(i), 'ShowName'), 'off')
            failedPorts(plus(end, 1.0)) = modelPorts.Outports(i);
        end % if
    end % for
