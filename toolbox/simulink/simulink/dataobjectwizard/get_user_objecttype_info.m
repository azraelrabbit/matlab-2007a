function DTInfo = get_user_objecttype_info(userObjectType)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    DTInfo = '';
    custom_user_object_type_reg;
    userDTInfo = cusattic('AtticData', 'userDTInfo');
    for i=1.0:length(userDTInfo)
        if eq(isequal(lower(userObjectType), lower(userDTInfo{i}.name)), 1.0)
            DTInfo = userDTInfo{i};
            break
        end % if
    end % for
end % function
