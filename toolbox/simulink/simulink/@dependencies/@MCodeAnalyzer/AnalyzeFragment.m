function AnalyzeFragment(obj, mcode, type, location)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if not(obj.MTreeAvailable)
        return;
    end % if
    % 18 19
    tree = mtree(mcode);
    obj.pAnalyze(tree, type, location);
end % function
