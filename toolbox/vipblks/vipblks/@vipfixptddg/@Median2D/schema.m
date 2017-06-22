function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(vipPackage, 'Median2D', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 22
    % 21 22
    schema.prop(this, 'sortAlg', 'DSPSortAlgorithmEnum');
end % function
