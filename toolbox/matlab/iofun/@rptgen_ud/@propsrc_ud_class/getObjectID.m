function id = getObjectID(ps, obj, objType)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    id = horzcat('udd-', ps.getObjectType, '-', obj(1.0).package.name, '.', obj(1.0).name);
    % 9 13
    % 10 13
    % 11 13
    if not(get(rptgen.appdata_rg, 'DebugMode'))
        id = rptgen.hash(id);
    end % if
