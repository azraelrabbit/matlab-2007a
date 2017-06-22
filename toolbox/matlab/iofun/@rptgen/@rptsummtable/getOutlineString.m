function s = getOutlineString(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    s = sprintf('%s %s', rptgen.capitalizeFirst(xlate(h.LoopType)), xlate('Summary Table'));
    % 9 10
end % function
