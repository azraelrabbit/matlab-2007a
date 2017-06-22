function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    p = findpackage('Simulink');
    % 9 11
    % 10 11
    c = schema.class(p, 'TsArray');
    % 12 14
    % 13 14
    schema.prop(c, 'Name', 'string');
    % 15 17
    % 16 17
    schema.prop(c, 'BlockPath', 'string');
    % 18 20
    % 19 20
    schema.prop(c, 'PortIndex', 'MATLAB array');
    % 21 23
    % 22 23
    schema.prop(c, 'IsBus', 'bool');
    % 24 26
    % 25 26
    p = schema.prop(c, 'Members', 'MATLAB array');
    % 27 28
    p.FactoryValue = {};
    % 29 30
    m = schema.method(c, 'flatten');
    m.signature.varargin = 'off';
    m.signature.inputTypes = {'handle'};
    m.signature.outputTypes = {'mxArray'};
end % function
