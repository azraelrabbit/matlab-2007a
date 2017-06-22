function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('hdlshared');
    this = schema.class(pkg, 'SimulinkFrontEnd');
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    schema.prop(this, 'SimulinkConnection', 'handle');
    schema.prop(this, 'hPir', 'handle');
    % 16 17
    schema.prop(this, 'DumpXML', 'string');
    schema.prop(this, 'Verbose', 'string');
    % 19 20
    schema.prop(this, 'FEChecks', 'mxArray');
end % function
