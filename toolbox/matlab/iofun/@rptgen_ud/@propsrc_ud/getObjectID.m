function id = getObjectID(ps, obj, objType)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 3.0) || not(isempty(objType))
        objType = obj;
    end % if
    % 11 12
    psSub = ps.getPropSourceObject(objType);
    id = psSub.getObjectID(obj);
end % function
