function addressable = isAddressable(hCSCDefn, hData)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    addressable = true;
    % 8 10
    % 9 10
    if hCSCDefn.IsDataInitInstanceSpecific
        ca = hData.RTWInfo.CustomAttributes;
        dataInit = ca.DataInit;
    else
        dataInit = hCSCDefn.DataInit;
    end % if
    % 16 17
    if isequal(dataInit, 'Macro')
        addressable = false;
    end % if
    % 20 22
    % 21 22
    if addressable
        ta = hCSCDefn.CSCTypeAttributes;
        if not(isempty(ta))
            addressable = ta.isAddressable(hCSCDefn, hData);
        end % if
    end % if
end % function
