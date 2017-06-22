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
    this = schema.class(rfPackage, 'SParametersMixer', parent);
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
    if isempty(findtype('MixerType'))
        schema.EnumType('MixerType', {'Downconverter','Upconverter'});
        % 34 36
        % 35 36
    end % if
    % 37 38
    schema.prop(this, 'NetParamData', 'string');
    schema.prop(this, 'NetParamFreq', 'string');
    schema.prop(this, 'Z0', 'string');
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    schema.prop(this, 'MixerType', 'MixerType');
    schema.prop(this, 'FLO', 'string');
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    if isempty(findtype('NoiseDefinedByType'))
        schema.EnumType('NoiseDefinedByType', {'Noise figure','Spot noise data','Noise factor','Noise temperature'});
        % 52 56
        % 53 56
        % 54 56
        % 55 56
    end % if
    % 57 58
    schema.prop(this, 'NoiseDefinedBy', 'NoiseDefinedByType');
    schema.prop(this, 'NF', 'string');
    schema.prop(this, 'GammaOpt', 'string');
    schema.prop(this, 'FMIN', 'string');
    schema.prop(this, 'RN', 'string');
    schema.prop(this, 'NFactor', 'string');
    schema.prop(this, 'NTemp', 'string');
    schema.prop(this, 'FreqOffset', 'string');
    schema.prop(this, 'PhaseNoiseLevel', 'string');
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    % 72 73
    if isempty(findtype('IP3Type'))
        schema.EnumType('IP3Type', {'IIP3','OIP3'});
        % 75 77
        % 76 77
    end % if
    % 78 79
    schema.prop(this, 'IP3Type', 'IP3Type');
    schema.prop(this, 'IIP3', 'string');
    schema.prop(this, 'OIP3', 'string');
    schema.prop(this, 'P1dB', 'string');
    schema.prop(this, 'PSat', 'string');
    schema.prop(this, 'GCSat', 'string');
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    if isempty(findtype('SNetworkFreqType'))
        schema.EnumType('SNetworkFreqType', {'Same as the s-parameters frequency','User-specified','Derived from Input Port parameters'});
        % 93 96
        % 94 96
        % 95 96
    end % if
    % 97 98
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 100 102
        % 101 102
    end % if
    % 103 104
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 106 112
        % 107 112
        % 108 112
        % 109 112
        % 110 112
        % 111 112
    end % if
    % 113 114
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 116 118
        % 117 118
    end % if
    % 119 120
    schema.prop(this, 'SourceFreq', 'SNetworkFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
