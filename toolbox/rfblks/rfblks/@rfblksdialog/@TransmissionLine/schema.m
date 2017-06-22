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
    this = schema.class(rfPackage, 'TransmissionLine', parent);
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
    if isempty(findtype('InterpMethodType'))
        schema.EnumType('InterpMethodType', {'Linear','Spline','Cubic'});
        % 40 43
        % 41 43
        % 42 43
    end % if
    % 44 45
    schema.prop(this, 'Z0', 'string');
    schema.prop(this, 'PV', 'string');
    schema.prop(this, 'Loss', 'string');
    schema.prop(this, 'ParamFreq', 'string');
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    schema.prop(this, 'LineLength', 'string');
    schema.prop(this, 'StubMode', 'StubModeType');
    schema.prop(this, 'Termination', 'StubTerminationType');
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    if isempty(findtype('PassivecktFreqType'))
        schema.EnumType('PassivecktFreqType', {'User-specified','Derived from Input Port parameters'});
        % 61 63
        % 62 63
    end % if
    % 64 65
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 67 73
        % 68 73
        % 69 73
        % 70 73
        % 71 73
        % 72 73
    end % if
    % 74 75
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 77 79
        % 78 79
    end % if
    % 80 81
    schema.prop(this, 'SourceFreq', 'PassivecktFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
