function id = getObjectID(ps, obj, objType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if not(isa(obj(2.0), 'schema.class'))
        obj(2.0) = classhandle(obj(2.0));
    end % if
    % 12 14
    id = horzcat('udd-', ps.getObjectType, '-', obj(2.0).package.name, '.', obj(2.0).name, '/', obj(1.0).name);
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    if not(get(rptgen.appdata_rg, 'DebugMode'))
        id = rptgen.hash(id);
    end % if
