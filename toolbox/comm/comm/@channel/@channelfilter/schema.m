function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('channel');
    % 8 10
    c = schema.class(pk, 'channelfilter', findclass(pk, 'basesigproc'));
    % 10 12
    findclass(pk, 'sigresponse');
    % 12 14
    privateVisibility = 'off';
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    p = schema.prop(c, 'ChannelFilterType', 'string');
    p.FactoryValue = 'Discrete Multipath';
    % 21 23
    p.AccessFlags.PublicSet = 'off';
    % 23 26
    % 24 26
    p = schema.prop(c, 'InputSamplePeriod', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setInputSamplePeriod;
    p.GetFunction = @getInputSamplePeriod;
    % 29 32
    % 30 32
    p = schema.prop(c, 'PathDelays', 'double_vector');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setPathDelays;
    p.GetFunction = @getPathDelays;
    % 35 38
    % 36 38
    p = schema.prop(c, 'AutoComputeTapIndices', 'strictbool');
    p.FactoryValue = 1.0;
    p.SetFunction = @setAutoComputeTapIndices;
    p.GetFunction = @getAutoComputeTapIndices;
    % 41 44
    % 42 44
    p = schema.prop(c, 'TapIndices', 'double_vector');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setTapIndices;
    p.GetFunction = @getTapIndices;
    % 47 50
    % 48 50
    p = schema.prop(c, 'TapGains', 'channel.sigresponse');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 52 55
    % 53 55
    p = schema.prop(c, 'AlphaMatrix', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 57 61
    % 58 61
    % 59 61
    p = schema.prop(c, 'AlphaTol', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setAlphaTol;
    p.GetFunction = @getAlphaTol;
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    p = schema.prop(c, 'AlphaIndices', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 72 75
    % 73 75
    p = schema.prop(c, 'FilterDelay', 'posint');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.GetFunction = @getFilterDelay;
    % 78 81
    % 79 81
    findclass(pk, 'slidebuffer');
    p = schema.prop(c, 'TapGainsHistory', 'channel.slidebuffer');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 84 88
    % 85 88
    % 86 88
    p = schema.prop(c, 'TapIndicesSmoothStep', 'udouble');
    p.FactoryValue = .1;
    % 89 92
    % 90 92
    p = schema.prop(c, 'TapIndicesSmooth', 'double_vector');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 94 97
    % 95 97
    p = schema.prop(c, 'AlphaMatrixSmooth', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 99 102
    % 100 102
    findclass(pk, 'slidebuffer');
    p = schema.prop(c, 'SmoothIRHistory', 'channel.slidebuffer');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 105 108
    % 106 108
    p = schema.prop(c, 'FreqResponse', 'channel.sigresponse');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 110 113
    % 111 113
    p = schema.prop(c, 'State', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setState;
    p.GetFunction = @getState;
end % function
function Ts = setInputSamplePeriod(cf, Ts)
    % 118 122
    % 119 122
    % 120 122
    cf.PrivateData.InputSamplePeriod = Ts;
    if cf.Constructed
        initialize(cf);
    end % if
end % function
function Ts = getInputSamplePeriod(cf, Ts)
    if isfield(cf.PrivateData, 'InputSamplePeriod')
        Ts = cf.PrivateData.InputSamplePeriod;
    end % if
end % function
function tau = setPathDelays(cf, tau)
    cf.PrivateData.PathDelays = tau;
    if cf.Constructed
        initialize(cf);
    end % if
end % function
function tau = getPathDelays(cf, tau)
    if isfield(cf.PrivateDat, 'PathDelays')
        tau = cf.PrivateData.PathDelays;
    end % if
end % function
function v = setAutoComputeTapIndices(cf, v)
    cf.PrivateData.AutoComputeTapIndices = v;
    if cf.Constructed
        initialize(cf);
    end % if
end % function
function v = getAutoComputeTapIndices(cf, v)
    if isfield(cf.PrivateData, 'AutoComputeTapIndices')
        v = cf.PrivateData.AutoComputeTapIndices;
    end % if
end % function
function tapidx = setTapIndices(cf, tapidx)
    cf.AutoComputeTapIndices = 0.0;
    cf.PrivateData.TapIndices = tapidx;
    if cf.Constructed
        initialize(cf);
    end % if
end % function
function tapidx = getTapIndices(cf, tapidx)
    if isfield(cf.PrivateData, 'TapIndices')
        tapidx = cf.PrivateData.TapIndices;
    end % if
end % function
function v = setAlphaTol(cf, v)
    cf.PrivateData.AlphaTol = v;
    if cf.Constructed
        initialize(cf);
    end % if
end % function
function v = getAlphaTol(cf, v)
    if isfield(cf.PrivateDat, 'AlphaTol')
        v = cf.PrivateData.AlphaTol;
    end % if
end % function
function d = getFilterDelay(h, d)
    % 177 180
    % 178 180
    d = uminus(h.TapIndices(1.0));
    if lt(d, 0.0)
        warning('comm:channel_getChannelFilterDelay:negativedelay', 'Smallest path delay is much greater than the input sample period, which causes a negative channel filter delay.');
        % 182 186
        % 183 186
        % 184 186
    end % if
end % function
function v = setState(cf, v)
    % 188 191
    % 189 191
    cf.PrivateData.State = v;
end % function
function v = getState(cf, v)
    if isfield(cf.PrivateData, 'State')
        v = cf.PrivateData.State;
    end % if
end % function
