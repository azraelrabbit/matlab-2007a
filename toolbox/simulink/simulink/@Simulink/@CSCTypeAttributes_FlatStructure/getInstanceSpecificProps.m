function props = getInstanceSpecificProps(hCSCTypeAttributes)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    props = [];
    % 8 9
    if hCSCTypeAttributes.IsStructNameInstanceSpecific
        ptmp = findprop(hCSCTypeAttributes, 'StructName');
        props = vertcat(props, ptmp);
    end % if
end % function
