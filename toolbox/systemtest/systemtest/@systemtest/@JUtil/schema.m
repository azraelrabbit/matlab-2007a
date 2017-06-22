function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('systemtest');
    c = schema.class(pkg, 'JUtil');
    % 9 10
    schema.method(c, 'printAsHTML', 'static');
    schema.method(c, 'evaluateParam', 'static');
    schema.method(c, 'runTest', 'static');
    schema.method(c, 'isOnPath', 'static');
    schema.method(c, 'initializeData', 'static');
    schema.method(c, 'initializeLog', 'static');
    schema.method(c, 'initializeFigure', 'static');
    schema.method(c, 'createLinkMsg', 'static');
    schema.method(c, 'formatErrMsg', 'static');
    schema.method(c, 'plotElementDataCursorUpdateFCN', 'static');
    schema.method(c, 'convertCell2Mat', 'static');
    schema.method(c, 'compare', 'static');
    schema.method(c, 'genReportInfo', 'static');
    schema.method(c, 'saveResults', 'static');
end % function
