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
    this = schema.class(rfPackage, 'GeneralPassiveNetwork', parent);
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
    if isempty(findtype('DataSourceType'))
        schema.EnumType('DataSourceType', {'RFDATA object','Data file'});
        % 27 29
        % 28 29
    end % if
    % 30 31
    if isempty(findtype('InterpMethodType'))
        schema.EnumType('InterpMethodType', {'Linear','Spline','Cubic'});
        % 33 36
        % 34 36
        % 35 36
    end % if
    % 37 38
    schema.prop(this, 'DataSource', 'DataSourceType');
    schema.prop(this, 'RFDATA', 'string');
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    schema.prop(this, 'File', 'string');
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    if isempty(findtype('SourceFreqType'))
        schema.EnumType('SourceFreqType', {'Extracted from data source','User-specified','Derived from Input Port parameters'});
        % 50 53
        % 51 53
        % 52 53
    end % if
    % 54 55
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
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
    schema.prop(this, 'SourceFreq', 'SourceFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
