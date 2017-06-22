function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        s = xlate('[Unlicensed Component]');
        return;
        % 12 13
    end % if
    % 14 16
    % 15 16
    if gt(c.minNumBlocks, 0.0)
        iString = sprintf('blocks>%i', c.minNumBlocks);
    else
        iString = '';
    end % if
    % 21 22
    if gt(c.minNumSubSystems, 0.0)
        iString = sprintf('%s systems>%i', iString, c.minNumSubSystems);
    end % if
    % 25 26
    switch c.isMask
    case 'yes'
        iString = horzcat(iString, ' ', xlate('masked'));
    case 'no'
        iString = horzcat(iString, ' ', xlate('unmasked'));
    end % switch
    % 32 33
    if not(isempty(iString))
        iString = horzcat(' - ', iString);
    end % if
    % 36 37
    s = horzcat(c.getName, iString);
end % function
