function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('systemtest');
    % 8 9
    c = schema.class(pkg, 'JSimulink');
    % 10 11
    schema.method(c, 'getBlockParams', 'static');
    schema.method(c, 'openModel', 'static');
    schema.method(c, 'loadModel', 'static');
    schema.method(c, 'getModelLocation', 'static');
    schema.method(c, 'getRefWSVars', 'static');
    schema.method(c, 'getSignal', 'static');
    schema.method(c, 'getRoot', 'static');
    schema.method(c, 'evaluateInputParam', 'static');
    schema.method(c, 'checkBlock', 'static');
    schema.method(c, 'stcvhtml', 'static');
end % function
