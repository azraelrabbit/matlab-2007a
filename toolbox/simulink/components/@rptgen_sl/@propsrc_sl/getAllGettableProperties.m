function propNames = getAllGettableProperties(h, obj)
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
    if lt(nargin, 2.0)
        obj = h.getTestObject;
    end % if
    % 15 16
    allProps = get_param(obj, 'objectparameters');
    propNames = fieldnames(allProps);
    i = 1.0;
        while le(i, length(propNames))
        if any(strcmp(subsref(allProps, substruct('.', propNames{i}, '.', 'Attributes')), 'write-only'))
            % 21 22
            propNames = vertcat(propNames(1.0:minus(i, 1.0)), propNames(plus(i, 1.0):end));
        else
            i = plus(i, 1.0);
        end % if
    end % while
end % function
