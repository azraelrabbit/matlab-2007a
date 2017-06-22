function props = getInstanceSpecificProps(hCSCTypeAttributes)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    props = [];
    % 8 9
    ptmp = findprop(hCSCTypeAttributes, 'GetFunction');
    props = vertcat(props, ptmp);
    % 11 12
    ptmp = findprop(hCSCTypeAttributes, 'SetFunction');
    props = vertcat(props, ptmp);
end % function
