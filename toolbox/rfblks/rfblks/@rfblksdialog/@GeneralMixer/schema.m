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
    this = schema.class(rfPackage, 'GeneralMixer', parent);
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
    if isempty(findtype('MixerType'))
        schema.EnumType('MixerType', {'Downconverter','Upconverter'});
        % 40 42
        % 41 42
    end % if
    % 43 44
    schema.prop(this, 'DataSource', 'DataSourceType');
    schema.prop(this, 'RFDATA', 'string');
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    schema.prop(this, 'MixerType', 'MixerType');
    schema.prop(this, 'FLO', 'string');
    schema.prop(this, 'File', 'string');
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    if isempty(findtype('NoiseDefinedByType'))
        schema.EnumType('NoiseDefinedByType', {'Noise figure','Spot noise data','Noise factor','Noise temperature'});
        % 59 63
        % 60 63
        % 61 63
        % 62 63
    end % if
    % 64 65
    schema.prop(this, 'NoiseDefinedBy', 'NoiseDefinedByType');
    schema.prop(this, 'NF', 'string');
    schema.prop(this, 'FreqOffset', 'string');
    schema.prop(this, 'PhaseNoiseLevel', 'string');
    schema.prop(this, 'GammaOpt', 'string');
    schema.prop(this, 'FMIN', 'string');
    schema.prop(this, 'RN', 'string');
    schema.prop(this, 'NFactor', 'string');
    schema.prop(this, 'NTemp', 'string');
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    if isempty(findtype('IP3Type'))
        schema.EnumType('IP3Type', {'IIP3','OIP3'});
        % 82 84
        % 83 84
    end % if
    % 85 86
    schema.prop(this, 'IP3Type', 'IP3Type');
    schema.prop(this, 'IIP3', 'string');
    schema.prop(this, 'OIP3', 'string');
    schema.prop(this, 'P1dB', 'string');
    schema.prop(this, 'PSat', 'string');
    schema.prop(this, 'GCSat', 'string');
    % 92 98
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    % 97 98
    if isempty(findtype('SourceFreqType'))
        schema.EnumType('SourceFreqType', {'Extracted from data source','User-specified','Derived from Input Port parameters'});
        % 100 103
        % 101 103
        % 102 103
    end % if
    % 104 105
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 107 109
        % 108 109
    end % if
    % 110 111
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 113 119
        % 114 119
        % 115 119
        % 116 119
        % 117 119
        % 118 119
    end % if
    % 120 121
    if isempty(findtype('NetworkDataType'))
        schema.EnumType('NetworkDataType', {'S11','S12','S21','S22','GAMMAIn','GAMMAOut','VSWRIn','VSWROut','OIP3','NF','FMIN','GAMMAOPT','RN','PhaseNoise','Pout','Phase','AM/AM','AM/PM','LS11','LS21','LS12','LS22'});
        % 123 145
        % 124 145
        % 125 145
        % 126 145
        % 127 145
        % 128 145
        % 129 145
        % 130 145
        % 131 145
        % 132 145
        % 133 145
        % 134 145
        % 135 145
        % 136 145
        % 137 145
        % 138 145
        % 139 145
        % 140 145
        % 141 145
        % 142 145
        % 143 145
        % 144 145
    end % if
    % 146 147
    if isempty(findtype('ComplexFormatType'))
        schema.EnumType('ComplexFormatType', {'dB','Abs','Mag','Magnitude (decibels)','Magnitude (linear)','Angle','Angle (degrees)','Angle (radians)','Real','Imag','Imaginary','dBm','dBW','W','mW','dBc/Hz','None'});
        % 149 166
        % 150 166
        % 151 166
        % 152 166
        % 153 166
        % 154 166
        % 155 166
        % 156 166
        % 157 166
        % 158 166
        % 159 166
        % 160 166
        % 161 166
        % 162 166
        % 163 166
        % 164 166
        % 165 166
    end % if
    % 167 168
    if isempty(findtype('XFormatType'))
        schema.EnumType('XFormatType', {'Hz','Auto','KHz','MHz','GHz','THz','dBm','dBW','W','mW','dB','Magnitude (decibels)','Mag','Magnitude (linear)','None'});
        % 170 185
        % 171 185
        % 172 185
        % 173 185
        % 174 185
        % 175 185
        % 176 185
        % 177 185
        % 178 185
        % 179 185
        % 180 185
        % 181 185
        % 182 185
        % 183 185
        % 184 185
    end % if
    % 186 187
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 189 191
        % 190 191
    end % if
    % 192 193
    schema.prop(this, 'SourceFreq', 'SourceFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    % 198 204
    % 199 204
    % 200 204
    % 201 204
    % 202 204
    % 203 204
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
