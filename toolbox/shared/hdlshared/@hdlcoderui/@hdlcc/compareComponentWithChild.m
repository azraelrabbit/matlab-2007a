function differences = compareComponentWithChild(h, h2)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    differences = {};
    if not(strcmp(class(h), class(h2)))
        errMsg = horzcat('When comparing components, the component type must be the ', 'same for both components.  The component type ', 'for the first argument is "', class(h), '", and the ', 'component type for the second argument is "', class(h2), '".');
        % 11 15
        % 12 15
        % 13 15
        error(errMsg);
    end % if
    % 16 18
    flds = fields(h);
    flds2 = fields(h2);
    if ne(length(flds), length(flds2))
        errMsg = horzcat('When comparing ', h.getFullName, ' to ', h2.getFullName, ' the number of visible fields must be the same.  The ', 'number of fields in ', h.getFullName, ' is ', length(flds), ' and the number of fields in ', h2.getFullName, ' is ', length(flds2), '.');
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        error(errMsg);
    end % if
    % 27 31
    % 28 31
    % 29 31
    for i=1.0:length(flds)
        if not(strcmp(flds{i}, flds2{i}))
            errMsg = horzcat('When comparing ', h.getFullName, ' to ', h2.getFullName, ' the names of the fields must be the same and the fields ', 'must be in the same order.  In ', h.getFullName, ' there ', 'is a field named ', flds{i}, ' while in ', h2.getFullName, ' the field is named ', flds2{i}, '.');
            % 33 38
            % 34 38
            % 35 38
            % 36 38
            error(errMsg);
        end % if
        % 39 42
        % 40 42
        dType = h.getPropDataType(flds{i});
        dType2 = h2.getPropDataType(flds2{i});
        if not(strcmp(dType, dType2))
            errMsg = loc_dtype_error(h, h2, dType, dType2);
            error(errMsg);
        end % if
        % 47 52
        % 48 52
        % 49 52
        % 50 52
        dType = class(h.get(flds{i}));
        dType2 = class(h2.get(flds2{i}));
        if not(strcmp(dType, dType2))
            differences{plus(end, 1.0)} = flds{i};
        else
            % 56 58
            % 57 59
            value1 = h.get(flds{i});
            value2 = h2.get(flds2{i});
            % 60 65
            % 61 65
            % 62 65
            % 63 65
            if not(isequal(flds{i}, 'HDLCoder')) && not(isequal(value1, value2))
                differences{plus(end, 1.0)} = flds{i};
            end % if
        end % if
    end % for
end % function
