function rec = styleguide_db_0143
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0143Title');
    rec.TitleID = 'StyleGuide: db_0143';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0143Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0143_StyleThreeCallback;
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
function [ResultDescription, ResultHandles] = db_0143_StyleThreeCallback(system)
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
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0143Tip');
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
        currentDescription = DAStudio.message('Slvnv:styleguide:db0143FailMsg');
        mdladvObj.setCheckResultStatus(false);
        % 64 66
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData(1.0).failedBlocks;
    end % if
    % 68 70
function resultData = getCheckInformation(system)
    % 70 80
    % 71 80
    % 72 80
    % 73 80
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    AllowedSubsystemBlocks = {'Inport','';'EnablePort','';'TriggerPort','';'BusSelector','';'Demux','';'From','';'Goto','';'Ground','';'Merge','';'MultiPortSwitch','';'Mux','';'Selector','';'Sum','';'Switch','';'Terminator','';'UnitDelay','';'Outport','';'SubSystem','Stateflow';'ModelReference','';'SubSystem',''};
    % 80 104
    % 81 104
    % 82 104
    % 83 104
    % 84 104
    % 85 104
    % 86 104
    % 87 104
    % 88 104
    % 89 104
    % 90 104
    % 91 104
    % 92 104
    % 93 104
    % 94 104
    % 95 104
    % 96 104
    % 97 104
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    AllowedSubsystemBlocks = strcat(AllowedSubsystemBlocks(:, 1.0), {':'}, AllowedSubsystemBlocks(:, 2.0));
    % 104 108
    % 105 108
    % 106 108
    failedBlocks = [];
    % 108 111
    % 109 111
    blksSubsystem = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'BlockType', 'SubSystem', 'MaskType', '');
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    blksSubsystem = vertcat(system, blksSubsystem);
    % 116 119
    % 117 119
    for idx=1.0:size(blksSubsystem, 1.0)
        % 119 121
        blks = find_system(blksSubsystem{idx}, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'SearchDepth', 1.0);
        % 121 125
        % 122 125
        % 123 125
        blks = blks(2.0:end);
        % 125 128
        % 126 128
        BlockTypeMaskType = strcat(get_param(blks, 'BlockType'), {':'}, get_param(blks, 'MaskType'));
        % 128 132
        % 129 132
        % 130 132
        if any(strcmp(BlockTypeMaskType, 'SubSystem:'))
            % 132 139
            % 133 139
            % 134 139
            % 135 139
            % 136 139
            % 137 139
            for jdx=1.0:length(BlockTypeMaskType)
                % 139 141
                if not(any(strcmp(BlockTypeMaskType{jdx}, AllowedSubsystemBlocks)))
                    % 141 143
                    failedBlocks = vertcat(failedBlocks, blksSubsystem(idx));
                    break
                end % if
            end % for
        end % if
        % 147 149
    end % for
    % 149 152
    % 150 152
    resultData.failedBlocks = unique(failedBlocks);
    % 152 154
