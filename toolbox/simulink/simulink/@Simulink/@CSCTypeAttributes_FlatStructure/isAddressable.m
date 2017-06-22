function addressable = isAddressable(hCSCAttrib, hCSCDefn, hData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    addressable = true;
    % 10 11
    if hCSCAttrib.BitPackBoolean
        addressable = false;
    end % if
end % function
