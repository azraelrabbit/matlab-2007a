function id = getObjectID(ps, obj, objType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 3.0)
        objType = ps.getObjectType(obj);
    end % if
    % 13 14
    id = sprintf('hg-%s-%0.14f', objType, double(obj));
    % 15 18
    % 16 18
    % 17 18
    if not(get(rptgen.appdata_rg, 'DebugMode'))
        id = rptgen.hash(id);
    end % if
end % function
