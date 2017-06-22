function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('POWERSYS');
    cls = schema.class(pkg, 'Netlist');
    % 10 11
    pElements = schema.prop(cls, 'elements', 'MATLAB array');
    pElements.AccessFlags.PublicSet = 'off';
    % 13 14
    pNodes = schema.prop(cls, 'nodes', 'MATLAB array');
    pNodes.AccessFlags.PublicSet = 'off';
    % 16 17
    pPorts = schema.prop(cls, 'ports', 'MATLAB array');
    pPorts.AccessFlags.PublicSet = 'off';
    pPorts.AccessFlags.PublicGet = 'off';
    % 20 21
    pPortToNode = schema.prop(cls, 'portToNode', 'MATLAB array');
    pPortToNode.AccessFlags.PublicSet = 'off';
    pPortToNode.AccessFlags.PublicGet = 'off';
    % 24 26
    % 25 26
    pReservedNode = schema.prop(cls, 'reservednode', 'MATLAB array');
    pReservedNode.AccessFlags.PublicSet = 'off';
end % function
