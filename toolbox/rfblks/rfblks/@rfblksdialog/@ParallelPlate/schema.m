function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    parentPkg = findpackage('dspdialog');
    parent = findclass(parentPkg, 'DSPDDG');
    rfPackage = findpackage('rfblksdialog');
    this = schema.class(rfPackage, 'ParallelPlate', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if isempty(findtype('StubModeType'))
        schema.EnumType('StubModeType', {'Not a stub','Shunt','Series'});
        % 28 31
        % 29 31
        % 30 31
    end % if
    % 32 33
    if isempty(findtype('StubTerminationType'))
        schema.EnumType('StubTerminationType', {'Open','Short'});
        % 35 37
        % 36 37
    end % if
    % 38 39
    schema.prop(this, 'Width', 'string');
    schema.prop(this, 'Separation', 'string');
    schema.prop(this, 'MuR', 'string');
    schema.prop(this, 'EpsilonR', 'string');
    schema.prop(this, 'SigmaCond', 'string');
    schema.prop(this, 'SigmaDiel', 'string');
    schema.prop(this, 'LineLength', 'string');
    schema.prop(this, 'StubMode', 'StubModeType');
    schema.prop(this, 'Termination', 'StubTerminationType');
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    if isempty(findtype('PassivecktFreqType'))
        schema.EnumType('PassivecktFreqType', {'User-specified','Derived from Input Port parameters'});
        % 57 59
        % 58 59
    end % if
    % 60 61
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 63 69
        % 64 69
        % 65 69
        % 66 69
        % 67 69
        % 68 69
    end % if
    % 70 71
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 73 75
        % 74 75
    end % if
    % 76 77
    schema.prop(this, 'SourceFreq', 'PassivecktFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
