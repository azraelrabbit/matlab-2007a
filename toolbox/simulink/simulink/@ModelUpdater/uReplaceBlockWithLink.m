function funcSet = uReplaceBlockWithLink(h, block)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    funcSet = cellhorzcat('uReplaceBlockWithLink', h, block);
    % 14 15
    replacementInfo = determineBrokenLinkReplacement(h, block);
    % 16 17
    if isempty(replacementInfo.newRefBlock)
        return;
    end % if
    % 20 21
    block2Link(h, block, replacementInfo.newRefBlock);
    % 22 23
end % function
