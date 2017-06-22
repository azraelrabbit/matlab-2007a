function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('channel');
    % 9 11
    c = schema.class(pk, 'filtgaussian', findclass(pk, 'basefiltgaussian'));
    % 11 13
    findclass(pk, 'sigresponse');
    % 13 15
    privateVisibility = 'off';
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = schema.prop(c, 'OutputSamplePeriod', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setOutputSamplePeriod;
    p.GetFunction = @getOutputSamplePeriod;
    % 24 27
    % 25 27
    p = schema.prop(c, 'CutoffFrequency', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setCutoffFrequency;
    p.GetFunction = @getCutoffFrequency;
    % 30 33
    % 31 33
    p = schema.prop(c, 'OversamplingFactor', 'udouble');
    p.SetFunction = @setOversamplingFactor;
    p.GetFunction = @getOversamplingFactor;
    p.FactoryValue = NaN;
    % 36 39
    % 37 39
    p = schema.prop(c, 'ImpulseResponseFcn', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setImpulseResponseFcn;
    p.GetFunction = @getImpulseResponseFcn;
    % 42 45
    % 43 45
    p = schema.prop(c, 'CoeffRounded', 'double_vector');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setCoeffRounded;
    p.GetFunction = @getCoeffRounded;
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    p = schema.prop(c, 'FreqMinMaxRJakes', 'double_vector');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setFreqMinMaxRJakes;
    p.GetFunction = @getFreqMinMaxRJakes;
    % 56 59
    % 57 59
    p = schema.prop(c, 'TimeDomain', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setTimeDomain;
    p.GetFunction = @getTimeDomain;
    % 62 65
    % 63 65
    p = schema.prop(c, 'NumFrequencies', 'posint');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setNumFrequencies;
    p.GetFunction = @getNumFrequencies;
    % 68 71
    % 69 71
    p = schema.prop(c, 'Autocorrelation', 'channel.sigresponse');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 73 76
    % 74 76
    p = schema.prop(c, 'PowerSpectrum', 'channel.sigresponse');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 78 81
    % 79 81
    findclass(pk, 'sigstatistics');
    p = schema.prop(c, 'Statistics', 'channel.sigstatistics');
    p.AccessFlags.PublicSet = 'off';
    % 83 86
    % 84 86
    p = schema.prop(c, 'LockImpulseResponse', 'strictbool');
    p.FactoryValue = 1.0;
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
function v = setOutputSamplePeriod(h, v)
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    setrates(h, v, h.CutoffFrequency);
end % function
function v = getOutputSamplePeriod(h, v)
    if isfield(h.PrivateData, 'OutputSamplePeriod')
        v = h.PrivateData.OutputSamplePeriod;
    end % if
end % function
function v = setCutoffFrequency(h, v)
    % 103 107
    % 104 107
    % 105 107
    setrates(h, h.OutputSamplePeriod, v);
end % function
function v = getCutoffFrequency(h, v)
    if isfield(h.PrivateData, 'CutoffFrequency')
        v = h.PrivateData.CutoffFrequency;
    end % if
end % function
function v = setOversamplingFactor(h, v)
    % 114 117
    % 115 117
    if not(h.QuasiStatic)
        if le(v, 0.0)
            error('Oversampling factor must be greater than zero.');
        end % if
        fc = h.CutoffFrequency;
        Ts = mrdivide(1.0, mtimes(v, fc));
        setrates(h, Ts, fc);
    else
        if not(isnan(v))
            warning('Cannot set oversampling factor for quasi-static source.');
        end % if
    end % if
end % function
function v = getOversamplingFactor(h, v)
    if isfield(h.PrivateData, 'OversamplingFactor')
        v = h.PrivateData.OversamplingFactor;
    end % if
end % function
function v = setTimeDomain(h, v)
    % 135 137
    if h.LockImpulseResponse
        error('TimeDomain must be set via registered impulse response function (ImpulseResponseFcn).');
    end % if
    if not(isequal(size(v), size(h.PrivateData.ImpulseResponse)))
        error('Sizes of time domain and impulse response must be the same.');
    end % if
    h.PrivateData.TimeDomain = v;
end % function
function v = getTimeDomain(h, v)
    if isfield(h.PrivateData, 'TimeDomain')
        v = h.PrivateData.TimeDomain;
    end % if
end % function
function v = setImpulseResponseFcn(h, v)
    % 150 152
    h.PrivateData.ImpulseResponseFcn = v;
end % function
function v = getImpulseResponseFcn(h, v)
    % 154 156
    if isfield(h.PrivateData, 'ImpulseResponseFcn')
        v = h.PrivateData.ImpulseResponseFcn;
    end % if
end % function
function v = setCoeffRounded(h, v)
    % 160 162
    h.PrivateData.CoeffRounded = v;
end % function
function v = getCoeffRounded(h, v)
    if isfield(h.PrivateData, 'CoeffRounded')
        v = h.PrivateData.CoeffRounded;
    end % if
end % function
function v = setFreqMinMaxRJakes(h, v)
    % 169 172
    % 170 172
    h.PrivateData.FreqMinMaxRJakes = v;
end % function
function v = getFreqMinMaxRJakes(h, v)
    if isfield(h.PrivateData, 'FreqMinMaxRJakes')
        v = h.PrivateData.FreqMinMaxRJakes;
    end % if
end % function
function v = setNumFrequencies(h, v)
    % 179 181
    h.PrivateData.NumFrequencies = v;
    if h.Constructed
        initialize(h);
    end % if
end % function
function v = getNumFrequencies(h, v)
    if isfield(h.PrivateData, 'NumFrequencies')
        v = h.PrivateData.NumFrequencies;
    end % if
end % function
