function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    mlock;
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    slPkg = findpackage('Simulink');
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    c = schema.class(slPkg, 'ExtModeTransports');
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    schema.prop(c, 'targets', 'mxArray');
    schema.prop(c, 'transports', 'mxArray');
    schema.prop(c, 'mexfiles', 'mxArray');
    schema.prop(c, 'interfaces', 'mxArray');
    % 29 30
    m = schema.method(c, 'get');
    m.signature.varargin = 'off';
    m.signature.inputTypes = {'handle'};
    m.signature.outputTypes = {'mxArray','mxArray','mxArray','mxArray'};
    % 34 35
    m = schema.method(c, 'add');
    m.signature.varargin = 'off';
    m.signature.inputTypes = {'handle','string','string','string','string'};
    m.signature.outputTypes = {};
    % 39 40
    m = schema.method(c, 'clear');
    m.signature.varargin = 'off';
    m.signature.inputTypes = {'handle'};
    m.signature.outputTypes = {};
end % function
