function oType = loop_getObjectType(c, obj, ps)
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
    if lt(nargin, 2.0)
        oType = xlate('Stateflow');
    else
        if lt(nargin, 3.0)
            ps = cLoop.loop_getPropSrc;
        end % if
        oType = ps.getObjectType(obj);
    end % if
end % function
