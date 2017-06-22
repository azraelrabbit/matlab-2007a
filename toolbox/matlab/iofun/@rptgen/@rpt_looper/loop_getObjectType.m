function oType = loop_getObjectType(cLoop, obj, ps)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if lt(nargin, 3.0)
        ps = cLoop.loop_getPropSrc;
    end % if
    % 15 16
    if lt(nargin, 2.0)
        oType = ps.getObjectType([]);
    else
        oType = ps.getObjectType(obj);
    end % if
end % function
