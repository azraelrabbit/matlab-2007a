function outputs = mpt_get_data_types(objectType)
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
    outputs = '';
    % 20 21
    mptDataTypes = {'double','single','int8','uint8','int16','uint16','int32','uint32','boolean'};
    % 22 25
    % 23 25
    % 24 25
    hcustom = cusattic('AtticData', 'slDataObjectCustomizations');
    % 26 28
    % 27 28
    if not(isempty(hcustom))
        uDTList = sl_get_customization_param(hcustom, 'UserDataTypes');
    else
        uDTList = '';
    end % if
    % 33 34
    if isempty(uDTList)
        % 35 36
        outputs = mptDataTypes;
    else
        outputs = uDTList;
    end % if
    % 40 41
    outputs = ctranspose(outputs);
end % function
