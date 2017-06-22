function output = isval(array, field, value)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(array)
        output = 0.0;
        return;
    end % if
    % 11 12
    if not(isfield(array, field))
        DAStudio.error('RTW:utility:missingField', field);
    end % if
    % 15 16
    if not(isstruct(array))
        DAStudio.error('RTW:utility:invalidTypeOfArgs', 'struct');
    end % if
    % 19 20
    for k=1.0:length(array)
        if isequal(getfield(array(k), char(field)), value)
            output = 1.0;
            return;
        end % if
    end % for
    output = 0.0;
end % function
