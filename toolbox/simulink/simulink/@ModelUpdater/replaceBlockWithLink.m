function replaceBlockWithLink(block, h)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    name = cleanBlockName(h, block);
    if askToReplace(h, name)
        funcSet = uReplaceBlockWithLink(h, block);
        appendTransaction(h, name, h.ConvertToLinkReasonStr, cellhorzcat(funcSet));
    end % if
    % 16 18
end % function
