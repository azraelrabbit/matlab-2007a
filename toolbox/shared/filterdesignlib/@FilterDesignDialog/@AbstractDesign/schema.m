function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'AbstractDesign', pk.findclass('AbstractEditor'));
    set(c, 'Description', 'abstract');
    % 11 12
    definetypes;
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'OperatingMode', 'FDDlgOperatingModes');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 19 22
    % 20 22
    % 21 22
    schema.prop(c, 'VariableName', 'string');
    % 23 24
    spcuddutils.addpostsetprop(c, 'ImpulseResponse', 'FDDlgImpulseResponses', @set_impulseresponse, @get_impulseresponse);
    % 25 27
    % 26 27
    spcuddutils.addpostsetprop(c, 'OrderMode', 'FDDlgOrderModes', @set_ordermode);
    % 28 29
    p = schema.prop(c, 'Order', 'string');
    set(p, 'FactoryValue', '20');
    % 31 32
    spcuddutils.addpostsetprop(c, 'FilterType', 'FDDlgFilterTypes', @set_filtertype);
    % 33 34
    p = schema.prop(c, 'Factor', 'string');
    set(p, 'FactoryValue', '2');
    % 36 37
    p = schema.prop(c, 'SecondFactor', 'string');
    set(p, 'FactoryValue', '3');
    % 39 40
    p = spcuddutils.addpostsetprop(c, 'InputSampleRate', 'string', @set_inputsamplerate);
    set(p, 'FactoryValue', '2');
    % 42 43
    schema.prop(c, 'FrequencyUnits', 'FDDlgFrequencyUnits');
    schema.prop(c, 'MagnitudeUnits', 'FDDlgMagnitudeUnits');
    % 45 46
    spcuddutils.addpostsetprop(c, 'Structure', 'string', @set_structure);
    spcuddutils.addpostsetprop(c, 'DesignMethod', 'string', @set_designmethod);
    % 48 49
    p = schema.prop(c, 'Scale', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 51 52
    p = schema.prop(c, 'ForceLeadingNumerator', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 54 55
    p = vertcat(schema.prop(c, 'FDesign', 'handle'), schema.prop(c, 'LastAppliedState', 'mxArray'), schema.prop(c, 'LastAppliedFilter', 'dfilt.basefilter'), schema.prop(c, 'LastAppliedSpecs', 'mxArray'), schema.prop(c, 'LastAppliedDesignOpts', 'mxArray'), schema.prop(c, 'Enabled', 'bool'), schema.prop(c, 'FVTool', 'handle'), schema.prop(c, 'HDLDialog', 'handle'), schema.prop(c, 'DSPFWIZ', 'handle'), schema.prop(c, 'DesignOptionsCache', 'mxArray'));
    % 56 65
    % 57 65
    % 58 65
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    % 64 65
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'AccessFlags.Init', 'Off');
    % 66 68
    % 67 68
    set(p(end), 'AccessFlags.Serialize', 'Off');
    % 69 70
    p = schema.prop(c, 'FixedPoint', 'handle');
    set(p, 'AccessFlags.Init', 'off');
    % 72 73
    m = schema.method(c, 'getDialogSchema');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle','string'}, 'OutputTypes', {'mxArray'});
    % 75 77
    % 76 77
    m = schema.method(c, 'export');
    set(m.Signature, 'varargin', 'on', 'InputTypes', {'handle','handle','string','bool','string'}, 'OutputTypes', {});
    % 79 81
    % 80 81
    m = schema.method(c, 'close');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle'}, 'OutputTypes', {});
    % 83 85
    % 84 85
    m = schema.method(c, 'postApply');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle'}, 'OutputTypes', {'bool','string'});
    % 87 89
    % 88 89
    m = schema.method(c, 'preApply');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle'}, 'OutputTypes', {'bool','string'});
    % 91 93
    % 92 93
    m = schema.method(c, 'getDisplayIcon');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle'}, 'OutputTypes', {'string'});
    % 95 97
    % 96 97
    schema.event(c, 'DialogApplied');
end % function
function set_structure(this, oldFStruct)
    % 100 102
    % 101 102
    updateFixedPoint(this);
end % function
function set_filtertype(this, oldFilterType)
    % 105 107
    % 106 107
    updateStructure(this);
end % function
function definetypes
    % 110 113
    % 111 113
    % 112 113
    if isfdtbxinstalled
        findclass(findpackage('fdesign'), 'abstracttype');
    end % if
    findclass(findpackage('FilterDesignDialog'), 'AbstractFixedPoint');
    findclass(findpackage('dfilt'), 'basefilter');
    % 118 119
    if isempty(findtype('FDDlgOperatingModes'))
        schema.EnumType('FDDlgOperatingModes', {'Test','MATLAB','Simulink'});
    end % if
    % 122 123
    if isempty(findtype('FDDlgOrderModes'))
        schema.EnumType('FDDlgOrderModes', {'Minimum','Specify'});
    end % if
    % 126 127
    if isempty(findtype('FDDlgImpulseResponses'))
        schema.EnumType('FDDlgImpulseResponses', {'FIR','IIR'});
    end % if
    % 130 131
    if isempty(findtype('FDDlgFilterTypes'))
        schema.EnumType('FDDlgFilterTypes', {'Single-rate','Decimator','Interpolator','Sample-rate converter'});
        % 133 134
    end % if
    % 135 136
    if isempty(findtype('FDDlgFrequencyUnits'))
        schema.EnumType('FDDlgFrequencyUnits', {'Normalized (0 to 1)','Hz','kHz','MHz','GHz'});
    end % if
    % 139 140
    if isempty(findtype('FDDlgMagnitudeUnits'))
        schema.EnumType('FDDlgMagnitudeUnits', {'dB','Linear','Squared'});
    end % if
end % function
