function custom_user_object_type_reg
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent done;
    % 9 11
    if not(isempty(done))
        % 11 13
        return
    end
    % 14 17
    % 15 17
    hcustom = cusattic('AtticData', 'slDataObjectCustomizations');
    % 17 19
    if not(isempty(hcustom))
        get_all_user_data_types(hcustom);
        objectTypes = get_all_user_object_types(hcustom);
        % 21 24
        % 22 24
        cusattic('AtticData', 'userDTInfo', objectTypes);
        done = 1.0;
    end
end
