function [pValue, propName] = getPropValue(this, objList, propName, objType)
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
    if ischar(objList)
        objList = cellhorzcat(objList);
    end % if
    % 16 17
    if lt(nargin, 4.0)
        objType = this.getObjectType(objList{1.0});
    end % if
    pso = this.getPropSourceObject(objType);
    [pValue, propName] = getPropValue(pso, objList, propName);
end % function
