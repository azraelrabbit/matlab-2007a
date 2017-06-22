function [pValue, propName] = getCommonPropValue(psHG, objList, propName)
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
    if eq(nargin, 2.0)
        % 14 15
        pValue = {'Parent';'Children';'UIContextMenu'};
        % 16 20
        % 17 20
        % 18 20
        % 19 20
        return;
    end % if
    % 22 23
    switch lower(propName)
    case {'parent','children','uicontextmenu'}
        pValue = LocObjectNames(psHG, objList, propName);
    otherwise
        pValue = rptgen.safeGet(objList, propName);
    end % switch
end % function
function valCells = LocObjectNames(psHG, aHandles, Property)
    % 31 33
    % 32 33
    valCells = rptgen.safeGet(aHandles, Property);
    % 34 35
    for i=1.0:length(valCells)
        valCells{i} = psHG.makeLink(valCells{i});
    end % for
end % function
