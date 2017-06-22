function [thisClassName, I] = getVarClass(h, varname)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    thisClassName = '';
    % 10 11
    thisvar = h.gethdsdata(varname);
    thisvar = thisvar(:);
    I = false(size(thisvar));
    if iscell(thisvar)
        % 15 16
        blankCells = cellfun('isempty', thisvar(:));
        if all(blankCells)
            return;
        end % if
        % 20 22
        % 21 22
        ind1 = find(not(blankCells));
        thisClassName = class(thisvar{ind1(1.0)});
        % 24 26
        % 25 26
        ind = cellfun('isclass', thisvar, thisClassName);
        if any(ind) && all(or(ind, blankCells))
            I = and(ind, not(blankCells));
            return;
        end % if
        thisClassName = '';
    else
        thisClassName = class(thisvar);
        I = true(size(thisvar));
    end % if
end % function
