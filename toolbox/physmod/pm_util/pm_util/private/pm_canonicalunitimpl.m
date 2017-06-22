function uOut = pm_canonicalunitimpl(uIn)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    list = pm_unitexpressions;
    idx = pm_equivalentunit(list, uIn);
    if any(idx)
        uOut = list{idx};
    else
        uOut = uIn;
    end % if
end % function
