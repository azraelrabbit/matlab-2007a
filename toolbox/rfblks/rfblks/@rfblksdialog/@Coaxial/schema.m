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
    this = schema.class(rfPackage, 'Coaxial', parent);
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
    schema.prop(this, 'OuterRadius', 'string');
    schema.prop(this, 'InnerRadius', 'string');
    schema.prop(this, 'MuR', 'string');
    schema.prop(this, 'EpsilonR', 'string');
    schema.prop(this, 'SigmaCond', 'string');
    schema.prop(this, 'SigmaDiel', 'string');
    schema.prop(this, 'LineLength', 'string');
    schema.prop(this, 'StubMode', 'StubModeType');
    schema.prop(this, 'Termination', 'StubTerminationType');
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    if isempty(findtype('PassivecktFreqType'))
        schema.EnumType('PassivecktFreqType', {'User-specified','Derived from Input Port parameters'});
        % 56 58
        % 57 58
    end % if
    % 59 60
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 62 68
        % 63 68
        % 64 68
        % 65 68
        % 66 68
        % 67 68
    end % if
    % 69 70
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 72 74
        % 73 74
    end % if
    % 75 76
    schema.prop(this, 'SourceFreq', 'PassivecktFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
