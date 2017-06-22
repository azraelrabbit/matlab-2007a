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
    this = schema.class(rfPackage, 'LadderFilter', parent);
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
    schema.prop(this, 'L', 'string');
    schema.prop(this, 'C', 'string');
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    if isempty(findtype('PassivecktFreqType'))
        schema.EnumType('PassivecktFreqType', {'User-specified','Derived from Input Port parameters'});
        % 35 37
        % 36 37
    end % if
    % 38 39
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 41 47
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        % 46 47
    end % if
    % 48 49
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 51 53
        % 52 53
    end % if
    % 54 55
    schema.prop(this, 'SourceFreq', 'PassivecktFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
