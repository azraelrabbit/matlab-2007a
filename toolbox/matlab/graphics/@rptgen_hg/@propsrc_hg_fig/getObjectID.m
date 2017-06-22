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
    % 13 15
    % 14 15
    tag = rptgen.safeGet(obj, 'Tag');
    tag = tag{1.0};
    % 17 18
    if not(isempty(tag)) && not(strcmpi(tag, 'N/A'))
        id = sprintf('hg-%s-%d-tag-%s', objType, double(obj), tag);
    else
        id = sprintf('hg-%s-%d', objType, double(obj));
    end % if
    % 23 26
    % 24 26
    % 25 26
    if not(get(rptgen.appdata_rg, 'DebugMode'))
        id = rptgen.hash(id);
    end % if
end % function
