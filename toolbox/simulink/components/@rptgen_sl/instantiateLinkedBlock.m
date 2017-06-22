function instantiateLinkedBlock(mySys)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(mySys))
        try
            find_system(mySys, 'SearchDepth', 0.0);
        catch
            % 11 12
            rptgen_sl.instantiateLinkedBlock(findParentSys(mySys));
            % 13 18
            % 14 18
            % 15 18
            % 16 18
            % 17 18
        end % try
    end % if
end % function
function parentSys = findParentSys(mySys)
    % 22 25
    % 23 25
    % 24 25
    charIdx = length(mySys);
    slashCount = 0.0;
    firstSlashIdx = [];
        while gt(charIdx, 1.0)
        if eq(mySys(charIdx), '/')
            if eq(slashCount, 0.0)
                firstSlashIdx = charIdx;
            end % if
            slashCount = plus(slashCount, 1.0);
        else
            if gt(slashCount, 0.0)
                % 36 37
                if eq(rem(slashCount, 2.0), 0.0)
                    % 38 39
                    slashCount = 0.0;
                else
                    parentSys = mySys(1.0:minus(firstSlashIdx, 1.0));
                    return;
                end % if
            end % if
        end % if
        charIdx = minus(charIdx, 1.0);
    end % while
    % 48 49
    parentSys = '';
end % function
