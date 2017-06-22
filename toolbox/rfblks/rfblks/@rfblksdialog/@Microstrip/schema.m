function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentPkg = findpackage('dspdialog');
    parent = findclass(parentPkg, 'DSPDDG');
    rfPackage = findpackage('rfblksdialog');
    this = schema.class(rfPackage, 'Microstrip', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if isempty(findtype('StubModeType'))
        schema.EnumType('StubModeType', {'Not a stub','Shunt','Series'});
        % 27 30
        % 28 30
        % 29 30
    end % if
    % 31 32
    if isempty(findtype('StubTerminationType'))
        schema.EnumType('StubTerminationType', {'Open','Short'});
        % 34 36
        % 35 36
    end % if
    % 37 38
    schema.prop(this, 'Width', 'string');
    schema.prop(this, 'Height', 'string');
    schema.prop(this, 'Thickness', 'string');
    schema.prop(this, 'EpsilonR', 'string');
    schema.prop(this, 'SigmaCond', 'string');
    schema.prop(this, 'LossTangent', 'string');
    schema.prop(this, 'LineLength', 'string');
    schema.prop(this, 'StubMode', 'StubModeType');
    schema.prop(this, 'Termination', 'StubTerminationType');
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    if isempty(findtype('PassivecktFreqType'))
        schema.EnumType('PassivecktFreqType', {'User-specified','Derived from Input Port parameters'});
        % 55 57
        % 56 57
    end % if
    % 58 59
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 61 67
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        % 66 67
    end % if
    % 68 69
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 71 73
        % 72 73
    end % if
    % 74 75
    schema.prop(this, 'SourceFreq', 'PassivecktFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
