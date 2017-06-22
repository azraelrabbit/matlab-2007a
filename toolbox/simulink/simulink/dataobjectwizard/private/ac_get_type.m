function strMatch = ac_get_type(typeName, referenceType, desiredType, option)
    % 1 30
    % 2 30
    % 3 30
    % 4 30
    % 5 30
    % 6 30
    % 7 30
    % 8 30
    % 9 30
    % 10 30
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    userTypes = cusattic('AtticData', 'userTypes');
    % 31 32
    strMatch = '';
    % 33 34
    try
        switch referenceType
        case {'userName','tmwName'}
        otherwise
            disp('ac_get_type invalid referenceType name');
            return;
        end % switch
        % 41 42
        switch desiredType
        case {'userName','tmwName'}
        otherwise
            disp('ac_get_type invalid desiredType name');
            return;
        end % switch
        % 48 49
        switch option
        case 'all'
            for i=1.0:length(userTypes)
                name = getfield(userTypes{i}, referenceType);
                if eq(strcmp(name, typeName), 1.0)
                    strMatch{plus(end, 1.0)} = getfield(userTypes{i}, desiredType);
                end % if
            end % for
        case 'depend'
            for i=1.0:length(userTypes)
                name = getfield(userTypes{i}, referenceType);
                if eq(strcmp(name, typeName), 1.0)
                    strMatch = getfield(userTypes{i}, 'userTypeDepend');
                    break
                end % if
            end % for
        otherwise
        end % switch
    catch
        strMatch = '';
        warning(lasterr);
    end % try
end % function
