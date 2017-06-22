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
    this = schema.class(rfPackage, 'GeneralCircuitElement', parent);
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
    schema.prop(this, 'Ckt', 'string');
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    if isempty(findtype('PassivecktFreqType'))
        schema.EnumType('PassivecktFreqType', {'User-specified','Derived from Input Port parameters'});
        % 34 36
        % 35 36
    end % if
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 46 52
        % 47 52
        % 48 52
        % 49 52
        % 50 52
        % 51 52
    end % if
    % 53 54
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 56 58
        % 57 58
    end % if
    % 59 60
    schema.prop(this, 'SourceFreq', 'PassivecktFreqType');
    schema.prop(this, 'Freq', 'string');
    % 62 64
    % 63 64
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
