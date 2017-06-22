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
    this = schema.class(rfPackage, 'ZParametersMixer', parent);
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
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    schema.prop(this, 'MixerType', 'MixerType');
    schema.prop(this, 'FLO', 'string');
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
    schema.prop(this, 'FreqOffset', 'string');
    schema.prop(this, 'PhaseNoiseLevel', 'string');
    schema.prop(this, 'GammaOpt', 'string');
    schema.prop(this, 'FMIN', 'string');
    schema.prop(this, 'RN', 'string');
    schema.prop(this, 'NFactor', 'string');
    schema.prop(this, 'NTemp', 'string');
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    % 71 72
    if isempty(findtype('IP3Type'))
        schema.EnumType('IP3Type', {'IIP3','OIP3'});
        % 74 76
        % 75 76
    end % if
    % 77 78
    schema.prop(this, 'IP3Type', 'IP3Type');
    schema.prop(this, 'IIP3', 'string');
    schema.prop(this, 'OIP3', 'string');
    schema.prop(this, 'P1dB', 'string');
    schema.prop(this, 'PSat', 'string');
    schema.prop(this, 'GCSat', 'string');
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    % 89 90
    if isempty(findtype('ZNetworkFreqType'))
        schema.EnumType('ZNetworkFreqType', {'Same as the z-parameters frequency','User-specified','Derived from Input Port parameters'});
        % 92 95
        % 93 95
        % 94 95
    end % if
    % 96 97
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 99 101
        % 100 101
    end % if
    % 102 103
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 105 111
        % 106 111
        % 107 111
        % 108 111
        % 109 111
        % 110 111
    end % if
    % 112 113
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 115 117
        % 116 117
    end % if
    % 118 119
    schema.prop(this, 'SourceFreq', 'ZNetworkFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
