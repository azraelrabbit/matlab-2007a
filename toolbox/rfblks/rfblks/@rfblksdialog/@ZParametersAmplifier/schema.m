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
    this = schema.class(rfPackage, 'ZParametersAmplifier', parent);
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
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    if isempty(findtype('NoiseDefinedByType'))
        schema.EnumType('NoiseDefinedByType', {'Noise figure','Spot noise data','Noise factor','Noise temperature'});
        % 43 47
        % 44 47
        % 45 47
        % 46 47
    end % if
    % 48 49
    schema.prop(this, 'NoiseDefinedBy', 'NoiseDefinedByType');
    schema.prop(this, 'NF', 'string');
    schema.prop(this, 'GammaOpt', 'string');
    schema.prop(this, 'FMIN', 'string');
    schema.prop(this, 'RN', 'string');
    schema.prop(this, 'NFactor', 'string');
    schema.prop(this, 'NTemp', 'string');
    % 56 62
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    if isempty(findtype('IP3Type'))
        schema.EnumType('IP3Type', {'IIP3','OIP3'});
        % 64 66
        % 65 66
    end % if
    % 67 68
    schema.prop(this, 'IP3Type', 'IP3Type');
    schema.prop(this, 'IIP3', 'string');
    schema.prop(this, 'OIP3', 'string');
    schema.prop(this, 'P1dB', 'string');
    schema.prop(this, 'PSat', 'string');
    schema.prop(this, 'GCSat', 'string');
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    if isempty(findtype('ZNetworkFreqType'))
        schema.EnumType('ZNetworkFreqType', {'Same as the z-parameters frequency','User-specified','Derived from Input Port parameters'});
        % 82 85
        % 83 85
        % 84 85
    end % if
    % 86 87
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 89 91
        % 90 91
    end % if
    % 92 93
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 95 101
        % 96 101
        % 97 101
        % 98 101
        % 99 101
        % 100 101
    end % if
    % 102 103
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 105 107
        % 106 107
    end % if
    % 108 109
    schema.prop(this, 'SourceFreq', 'ZNetworkFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
