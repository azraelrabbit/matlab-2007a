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
    c = schema.class(pk, 'intfiltgaussian', findclass(pk, 'basesigproc'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'OutputSamplePeriod', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setOutputSamplePeriod;
    p.GetFunction = @getOutputSamplePeriod;
    % 20 23
    % 21 23
    p = schema.prop(c, 'CutoffFrequency', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setCutoffFrequency;
    p.GetFunction = @getCutoffFrequency;
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    p = schema.prop(c, 'CutoffFrequencyName', 'mxArray');
    p.FactoryValue = 'Cutoff frequency';
    % 33 36
    % 34 36
    p = schema.prop(c, 'NumChannels', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setNumChannels;
    p.GetFunction = @getNumChannels;
    % 39 42
    % 40 42
    p = schema.prop(c, 'MaxBlockLength', 'udouble');
    p.FactoryValue = 1000.0;
    % 43 46
    % 44 46
    p = schema.prop(c, 'TargetFGOversampleFactor', 'posint');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setTargetFGOversampleFactor;
    p.GetFunction = @getTargetFGOversampleFactor;
    % 49 52
    % 50 52
    findclass(pk, 'filtgaussian');
    p = schema.prop(c, 'FiltGaussian', 'channel.filtgaussian');
    p.AccessFlags.Init = 'off';
    % 54 57
    % 55 57
    findclass(pk, 'interpfilter');
    p = schema.prop(c, 'InterpFilter', 'channel.interpfilter');
    p.AccessFlags.Init = 'off';
end % function
function Ts = setOutputSamplePeriod(h, Ts)
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    setrates(h, Ts, h.CutoffFrequency);
end % function
function Ts = getOutputSamplePeriod(h, Ts)
    fg = h.FiltGaussian;
    intf = h.InterpFilter;
    fc = fg.CutoffFrequency;
    N = fg.OversamplingFactor;
    K1 = intf.PolyphaseInterpFactor;
    K2 = intf.LinearInterpFactor;
    if gt(fc, 0.0)
        Ts = mrdivide(1.0, mtimes(mtimes(mtimes(K1, K2), N), fc));
    else
        Ts = fg.OutputSamplePeriod;
    end % if
end % function
function fc = setCutoffFrequency(h, fc)
    % 82 92
    % 83 92
    % 84 92
    % 85 92
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    setrates(h, h.OutputSamplePeriod, fc);
end % function
function fc = getCutoffFrequency(h, fc)
    fc = h.FiltGaussian.CutoffFrequency;
end % function
function N = setNumChannels(h, N)
    % 97 101
    % 98 101
    % 99 101
    h.FiltGaussian.NumChannels = N;
    h.InterpFilter.NumChannels = N;
    if h.Constructed
        initialize(h);
    end % if
end % function
function N = getNumChannels(h, N)
    N1 = h.FiltGaussian.NumChannels;
    N2 = h.InterpFilter.NumChannels;
    if eq(N1, N2)
        N = N2;
    else
        error('Filtered Gaussian source and interpolating filter must have same number of channels.');
    end % if
end % function
function N = setTargetFGOversampleFactor(h, N)
    % 116 119
    % 117 119
    h.PrivateData.TargetFGOversampleFactor = N;
    setrates(h, h.OutputSamplePeriod, h.CutoffFrequency);
end % function
function N = getTargetFGOversampleFactor(h, N)
    N = h.PrivateData.TargetFGOversampleFactor;
end % function
