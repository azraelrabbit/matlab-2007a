function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentpackage = findpackage('dspdialog');
    parent = findclass(parentpackage, 'DSPDDG');
    % 10 11
    package = findpackage('vipdialog');
    hThisClass = schema.class(package, 'FrameRateDisplay', parent);
    % 13 16
    % 14 16
    % 15 16
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 21 22
    schema.prop(hThisClass, 'UpdateRate', 'string');
end % function
