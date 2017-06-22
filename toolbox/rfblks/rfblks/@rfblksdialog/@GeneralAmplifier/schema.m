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
    this = schema.class(rfPackage, 'GeneralAmplifier', parent);
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
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    if isempty(findtype('NoiseDefinedByType'))
        schema.EnumType('NoiseDefinedByType', {'Noise figure','Spot noise data','Noise factor','Noise temperature'});
        % 51 55
        % 52 55
        % 53 55
        % 54 55
    end % if
    % 56 57
    schema.prop(this, 'NoiseDefinedBy', 'NoiseDefinedByType');
    schema.prop(this, 'NF', 'string');
    schema.prop(this, 'GammaOpt', 'string');
    schema.prop(this, 'FMIN', 'string');
    schema.prop(this, 'RN', 'string');
    schema.prop(this, 'NFactor', 'string');
    schema.prop(this, 'NTemp', 'string');
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    % 69 70
    if isempty(findtype('IP3Type'))
        schema.EnumType('IP3Type', {'IIP3','OIP3'});
        % 72 74
        % 73 74
    end % if
    % 75 76
    schema.prop(this, 'IP3Type', 'IP3Type');
    schema.prop(this, 'IIP3', 'string');
    schema.prop(this, 'OIP3', 'string');
    schema.prop(this, 'P1dB', 'string');
    schema.prop(this, 'PSat', 'string');
    schema.prop(this, 'GCSat', 'string');
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    % 87 88
    if isempty(findtype('SourceFreqType'))
        schema.EnumType('SourceFreqType', {'Extracted from data source','User-specified','Derived from Input Port parameters'});
        % 90 93
        % 91 93
        % 92 93
    end % if
    % 94 95
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 97 99
        % 98 99
    end % if
    % 100 101
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 103 109
        % 104 109
        % 105 109
        % 106 109
        % 107 109
        % 108 109
    end % if
    % 110 111
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 113 115
        % 114 115
    end % if
    % 116 117
    schema.prop(this, 'SourceFreq', 'SourceFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
