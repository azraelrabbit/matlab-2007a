function varargout = cvmissingblks(rootBlk, ignoreConditions)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    if ischar(rootBlk)
        rootBlk = get_param(rootBlk, 'Handle');
    end % if
    % 22 23
    if lt(nargin, 2.0)
        ignoreConditions = 0.0;
    end % if
    % 26 28
    % 27 28
    blockInfo = cell(0.0, 2.0);
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    alwaysReqDecisionCoverage = {'Backlash','DeadZone'};
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    for blkType=alwaysReqDecisionCoverage
        msg = sprintf('The %s block incorporates control flow decisions that are not recorded in this release of the Model Coverage tool.', blkType{1.0});
        % 42 44
        % 43 44
        blkH = find_matching_blocks(rootBlk, blkType{1.0});
        if not(isempty(blkH))
            blockInfo = vertcat(blockInfo, horzcat(num2cell(blkH(:)), cellstr(char(mtimes(ones(length(blkH), 1.0), msg)))));
        end % if
    end % for
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    blkH = find_matching_blocks(rootBlk, 'ModelReference');
    if not(isempty(blkH))
        msg = sprintf('The Model Block incorporates the contents of a referenced model.  The coverage tool is not able to record the behavior of blocks within the referenced model that may contain look-up tables, conditions, and decisions.');
        % 60 63
        % 61 63
        % 62 63
        blockInfo = vertcat(blockInfo, horzcat(num2cell(blkH(:)), cellstr(char(mtimes(ones(length(blkH), 1.0), msg)))));
    end % if
    % 65 69
    % 66 69
    % 67 69
    % 68 69
    blkH = find_matching_blocks(rootBlk, 'Integrator');
    if not(isempty(blkH))
        hasLimit = strcmp(get_param(blkH, 'LimitOutput'), 'on');
        hasReset = not(strcmp(get_param(blkH, 'ExternalReset'), 'none'));
        % 73 74
        blks = blkH(and(hasLimit, not(hasReset)));
        if not(isempty(blks))
            msg = sprintf('This integrator block incorporates control flow decisions due to its limited output and is not recorded in this release of the Model Coverage tool.');
            % 77 79
            % 78 79
            blockInfo = vertcat(blockInfo, horzcat(num2cell(blks(:)), cellstr(char(mtimes(ones(length(blks), 1.0), msg)))));
        end % if
        % 81 83
        % 82 83
        blks = blkH(and(hasLimit, hasReset));
        if not(isempty(blks))
            msg = sprintf('This integrator block incorporates control flow decisions due to its limited output and external reset and its behavior is not recorded in this release of the Model Coverage tool.');
            % 86 88
            % 87 88
            blockInfo = vertcat(blockInfo, horzcat(num2cell(blks(:)), cellstr(char(mtimes(ones(length(blks), 1.0), msg)))));
        end % if
        % 90 92
        % 91 92
        blks = blkH(and(not(hasLimit), hasReset));
        if not(isempty(blks))
            msg = sprintf('This integrator block incorporates control flow decisions due to its external reset and its behavior is not recorded in this release of the Model Coverage tool.', blkType{1.0});
            % 95 97
            % 96 97
            blockInfo = vertcat(blockInfo, horzcat(num2cell(blks(:)), cellstr(char(mtimes(ones(length(blks), 1.0), msg)))));
        end % if
        % 99 100
    end % if
    % 101 103
    % 102 103
    if not(isempty(blockInfo))
        create_all_nags(blockInfo, rootBlk);
    end % if
end % function
function matchingBlocks = find_matching_blocks(rootH, typeStr, testFcn)
    % 108 115
    % 109 115
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    % 114 115
    if lt(nargin, 3.0)
        testFcn = [];
    end % if
    % 118 120
    % 119 120
    matchingBlocks = find_system(rootH, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', typeStr);
    % 121 124
    % 122 124
    % 123 124
    if not(isempty(testFcn))
        blks = matchingBlocks;
        includeIdx = eval(testFcn);
        matchingBlocks = matchingBlocks(includeIdx);
    end % if
end % function
function [fullPath, name] = get_name_strings(blockH)
    % 131 135
    % 132 135
    % 133 135
    % 134 135
    name = get_param(blockH, 'Name');
    fullPath = horzcat(get_param(blockH, 'Parent'), '/', name);
end % function
function create_all_nags(blockInfo, rootBlk)
    % 139 142
    % 140 142
    % 141 142
    [rows, cols] = size(blockInfo);
    % 143 148
    % 144 148
    % 145 148
    % 146 148
    % 147 148
    slsfnagctlr('Clear', getfullname(rootBlk), 'Model Coverage Tool');
    % 149 151
    % 150 151
    for i=1.0:rows
        [fullPath, name] = get_name_strings(blockInfo{i, 1.0});
        % 153 157
        % 154 157
        % 155 157
        % 156 157
        nag = slsfnagctlr('NagTemplate');
        nag.blkHandles = blockInfo{i, 1.0};
        nag.type = 'Warning';
        nag.msg.type = 'Cov';
        nag.msg.details = blockInfo{i, 2.0};
        nag.msg.summary = 'Block not recorded';
        nag.sourceFullName = fullPath;
        nag.sourceName = name;
        nag.component = 'Simulink';
        % 166 167
        slsfnagctlr('Push', nag);
    end % for
    % 169 170
    slsfnagctlr('View');
end % function
