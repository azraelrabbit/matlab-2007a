function Data = drive_configurertp(mode, Data, rtParam)
    % 1 69
    % 2 69
    % 3 69
    % 4 69
    % 5 69
    % 6 69
    % 7 69
    % 8 69
    % 9 69
    % 10 69
    % 11 69
    % 12 69
    % 13 69
    % 14 69
    % 15 69
    % 16 69
    % 17 69
    % 18 69
    % 19 69
    % 20 69
    % 21 69
    % 22 69
    % 23 69
    % 24 69
    % 25 69
    % 26 69
    % 27 69
    % 28 69
    % 29 69
    % 30 69
    % 31 69
    % 32 69
    % 33 69
    % 34 69
    % 35 69
    % 36 69
    % 37 69
    % 38 69
    % 39 69
    % 40 69
    % 41 69
    % 42 69
    % 43 69
    % 44 69
    % 45 69
    % 46 69
    % 47 69
    % 48 69
    % 49 69
    % 50 69
    % 51 69
    % 52 69
    % 53 69
    % 54 69
    % 55 69
    % 56 69
    % 57 69
    % 58 69
    % 59 69
    % 60 69
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    rtNumParam = length(rtParam);
    switch lower(mode)
    case 'mask'
        % 71 75
        % 72 75
        % 73 75
        blockHandle = Data;
        % 75 77
        blockName = getfullname(blockHandle);
        tagName = drive_gentag(blockName);
        maskWs = get_param(gcb, 'MaskWsVariables');
        % 79 81
        for Param=1.0:rtNumParam
            thisParamName = rtParam(Param).blockName;
            % 82 84
            thisParam = find_system(blockName, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', thisParamName);
            % 84 86
            if not(isempty(thisParam))
                % 86 89
                % 87 89
                set_param(l_param_goto_block(blockName, thisParamName), 'GotoTag', l_param_tagname(tagName, thisParamName));
            else
                % 90 92
                % 91 96
                % 92 96
                % 93 96
                % 94 96
            end % if
        end % for
    case 'compile'
        % 98 108
        % 99 108
        % 100 108
        % 101 108
        % 102 108
        % 103 108
        % 104 108
        % 105 108
        % 106 108
        blockHandle = Data.BlockHandle;
        % 108 110
        refBlock = get_param(blockHandle, 'ReferenceBlock');
        if isempty(refBlock)
            error('physmod:drive:RtpBlockWithoutReferenceBlock', 'Block %s does not have a valid reference block. Please restore the link from this block to the SimDriveline library.', getfullname(blockHandle));
            % 112 117
            % 113 117
            % 114 117
            % 115 117
        end % if
        % 117 124
        % 118 124
        % 119 124
        % 120 124
        % 121 124
        % 122 124
        gotoList = find_system(blockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'Goto');
        % 124 128
        % 125 128
        % 126 128
        if eq(length(gotoList), rtNumParam)
            gotoNames = get_param(gotoList, 'Name');
            if eq(rtNumParam, 0.0)
                DriveParameter = [];
            end % if
            for param=1.0:rtNumParam
                whichGoto = strmatch(l_param_gotoshort_block(rtParam(param).blockName), gotoNames, 'exact');
                % 134 136
                DriveParameter(param) = DRIVE.DriveParameter;
                DriveParameter(param).type = rtParam(param).enumName;
                DriveParameter(param).flag = get_param(gotoList(whichGoto), 'GotoTag');
            end % for
        else
            error('physmod:drive:drive:BlockRtpGotoMismatch', 'Block %s has %i run-time parameter(s) but %i goto block(s) were found', get_param(blockHandle, 'Name'), rtNumParam, length(gotoList));
            % 141 146
            % 142 146
            % 143 146
            % 144 146
        end % if
        % 146 148
        if not(isempty(DriveParameter))
            Data.block.parameter = DriveParameter;
            Data.SizesStructure.numRtParameters = plus(Data.SizesStructure.numRtParameters, length(DriveParameter));
        end % if
    end % switch
    % 152 154
function goto_name = l_param_const_block(blockName, thisParamName)
    % 154 158
    % 155 158
    % 156 158
    goto_name = horzcat(blockName, '/', thisParamName);
    % 158 160
function goto_name = l_param_goto_block(blockName, thisParamName)
    % 160 165
    % 161 165
    % 162 165
    % 163 165
    goto_name = horzcat(l_param_const_block(blockName, thisParamName), ' Goto');
    % 165 167
function goto_name = l_param_gotoshort_block(thisParamName)
    % 167 175
    % 168 175
    % 169 175
    % 170 175
    % 171 175
    % 172 175
    % 173 175
    goto_name = horzcat(thisParamName, ' Goto');
    % 175 177
function tag_name = l_param_tagname(TagID, thisParamName)
    % 177 181
    % 178 181
    % 179 181
    tag_name = horzcat(TagID, thisParamName);
