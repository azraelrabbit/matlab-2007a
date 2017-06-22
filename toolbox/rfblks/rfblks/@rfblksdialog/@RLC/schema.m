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
    this = schema.class(rfPackage, 'RLC', parent);
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
    schema.prop(this, 'R', 'string');
    schema.prop(this, 'L', 'string');
    schema.prop(this, 'C', 'string');
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    if isempty(findtype('PassivecktFreqType'))
        schema.EnumType('PassivecktFreqType', {'User-specified','Derived from Input Port parameters'});
        % 36 38
        % 37 38
    end % if
    % 39 40
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 42 48
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        % 47 48
    end % if
    % 49 50
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 52 54
        % 53 54
    end % if
    % 55 56
    schema.prop(this, 'SourceFreq', 'PassivecktFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
