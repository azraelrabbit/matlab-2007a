function restoreBrokenLinks(h)
    % 1 38
    % 2 38
    % 3 38
    % 4 38
    % 5 38
    % 6 38
    % 7 38
    % 8 38
    % 9 38
    % 10 38
    % 11 38
    % 12 38
    % 13 38
    % 14 38
    % 15 38
    % 16 38
    % 17 38
    % 18 38
    % 19 38
    % 20 38
    % 21 38
    % 22 38
    % 23 38
    % 24 38
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    brokenLinks = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'S-Function', 'LinkStatus', 'none');
    temp1 = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'S-Function', 'LinkStatus', 'inactive');
    temp2 = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'SubSystem', 'LinkStatus', 'none');
    temp3 = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'SubSystem', 'LinkStatus', 'inactive');
    temp4 = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'M-S-Function', 'LinkStatus', 'none');
    temp5 = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'M-S-Function', 'LinkStatus', 'inactive');
    temp6 = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'StateSpace', 'LinkStatus', 'none');
    temp7 = find_system(h.MyModel, 'LookUnderMasks', 'all', 'BlockType', 'StateSpace', 'LinkStatus', 'inactive');
    % 46 47
    brokenLinks = vertcat(brokenLinks, temp1, temp2, temp3, temp4, temp5, temp6, temp7);
    numBrokenLinks = numel(brokenLinks);
    % 49 52
    % 50 52
    % 51 52
    for iBrokenLink=1.0:numBrokenLinks
        % 53 54
        curBadBlock = brokenLinks{iBrokenLink};
        % 55 56
        try
            status = get_param(curBadBlock, 'LinkStatus');
            if strcmpi(status, 'resolved')
                % 59 60
                continue;
            end % if
            replacementInfo = determineBrokenLinkReplacement(h, curBadBlock);
        catch
            % 64 65
            continue;
        end % try
        % 67 68
        if isempty(replacementInfo.newRefBlock)
            continue;
        end % if
        % 71 74
        % 72 74
        % 73 74
        stillExists = find_system(curBadBlock, 'LookUnderMasks', 'all');
        % 75 76
        if isempty(stillExists)
            continue;
        end % if
        % 79 80
        if askToReplace(h, curBadBlock)
            block2Link(h, curBadBlock, replacementInfo.newRefBlock);
            appendTransaction(h, curBadBlock, h.RestoreLinkReasonStr, cellhorzcat(cellhorzcat('block2Link', h, curBadBlock, replacementInfo.newRefBlock)));
            % 83 84
        end % if
        % 85 86
    end % for
    % 87 88
end % function
