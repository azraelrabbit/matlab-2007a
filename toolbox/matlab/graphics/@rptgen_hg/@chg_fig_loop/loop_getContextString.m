function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch lower(c.LoopType)
    case 'all'
        cs = 'All';
    case 'current'
        cs = 'Current';
    otherwise
        cs = 'By tag';
    end % switch
end % function
