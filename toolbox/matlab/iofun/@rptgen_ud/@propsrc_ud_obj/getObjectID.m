function id = getObjectID(ps, obj, objType)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    id = horzcat('udd-', ps.getObjectType, '-', class(obj(1.0)), '-', obj(1.0).uniqueTag);
end % function
