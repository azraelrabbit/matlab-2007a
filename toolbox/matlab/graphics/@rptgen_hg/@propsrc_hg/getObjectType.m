function oType = getObjectType(h, obj, oType)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 3.0)
        oType = 'Graphics';
    end % if
    % 11 12
    if not(isempty(obj))
        try
            oType = rptgen.capitalizeFirst(get(obj, 'Type'));
        end % try
    end % if
end % function
