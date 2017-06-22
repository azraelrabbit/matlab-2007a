function setunits(hObj, units)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 2.0, nargin));
    % 8 11
    % 9 11
    siggui_setunits(hObj, units);
    % 11 14
    % 12 14
    for hindx=allchild(hObj)
        if isrendered(hindx)
            setunits(hindx, units);
        end % if
    end % for
end % function
