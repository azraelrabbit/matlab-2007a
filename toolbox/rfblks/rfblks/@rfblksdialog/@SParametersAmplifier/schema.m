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
    this = schema.class(rfPackage, 'SParametersAmplifier', parent);
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
    if isempty(findtype('InterpMethodType'))
        schema.EnumType('InterpMethodType', {'Linear','Spline','Cubic'});
        % 27 30
        % 28 30
        % 29 30
    end % if
    % 31 32
    schema.prop(this, 'NetParamData', 'string');
    schema.prop(this, 'NetParamFreq', 'string');
    schema.prop(this, 'Z0', 'string');
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    if isempty(findtype('NoiseDefinedByType'))
        schema.EnumType('NoiseDefinedByType', {'Noise figure','Spot noise data','Noise factor','Noise temperature'});
        % 44 48
        % 45 48
        % 46 48
        % 47 48
    end % if
    % 49 50
    schema.prop(this, 'NoiseDefinedBy', 'NoiseDefinedByType');
    schema.prop(this, 'NF', 'string');
    schema.prop(this, 'GammaOpt', 'string');
    schema.prop(this, 'FMIN', 'string');
    schema.prop(this, 'RN', 'string');
    schema.prop(this, 'NFactor', 'string');
    schema.prop(this, 'NTemp', 'string');
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    if isempty(findtype('IP3Type'))
        schema.EnumType('IP3Type', {'IIP3','OIP3'});
        % 65 67
        % 66 67
    end % if
    % 68 69
    schema.prop(this, 'IP3Type', 'IP3Type');
    schema.prop(this, 'IIP3', 'string');
    schema.prop(this, 'OIP3', 'string');
    schema.prop(this, 'P1dB', 'string');
    schema.prop(this, 'PSat', 'string');
    schema.prop(this, 'GCSat', 'string');
    % 75 81
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    % 80 81
    if isempty(findtype('SNetworkFreqType'))
        schema.EnumType('SNetworkFreqType', {'Same as the s-parameters frequency','User-specified','Derived from Input Port parameters'});
        % 83 86
        % 84 86
        % 85 86
    end % if
    % 87 88
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 90 92
        % 91 92
    end % if
    % 93 94
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 96 102
        % 97 102
        % 98 102
        % 99 102
        % 100 102
        % 101 102
    end % if
    % 103 104
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 106 108
        % 107 108
    end % if
    % 109 110
    schema.prop(this, 'SourceFreq', 'SNetworkFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
