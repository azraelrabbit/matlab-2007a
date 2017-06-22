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
    c = schema.class(pk, 'buffer', findclass(pk, 'baseclass'));
    % 11 13
    privateVisibility = 'off';
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = schema.prop(c, 'PrivateData', 'mxArray');
    p.FactoryValue = struct('NumChannels', 1.0, 'BufferSize', 1.0);
    p.Visible = privateVisibility;
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    p = schema.prop(c, 'BufferSize', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setBufferSize;
    p.GetFunction = @getBufferSize;
    % 35 38
    % 36 38
    p = schema.prop(c, 'NumChannels', 'udouble');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setNumChannels;
    p.GetFunction = @getNumChannels;
    % 41 44
    % 42 44
    p = schema.prop(c, 'DownsampleFactor', 'udouble');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicSet = 'off';
    p.SetFunction = @setDownsampleFactor;
    % 47 50
    % 48 50
    p = schema.prop(c, 'Buffer', 'mxArray');
    p.FactoryValue = 0.0;
    p.AccessFlags.PublicSet = 'off';
    % 52 55
    % 53 55
    p = schema.prop(c, 'IdxNext', 'udouble');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicSet = 'off';
    % 57 60
    % 58 60
    p = schema.prop(c, 'Enable', 'strictbool');
    p.FactoryValue = 0.0;
    % 61 64
    % 62 64
    p = schema.prop(c, 'NumNewSamples', 'udouble');
    p.FactoryValue = 0.0;
    p.AccessFlags.PublicSet = 'off';
    % 66 69
    % 67 69
    p = schema.prop(c, 'NumSamplesProcessed', 'udouble');
    p.FactoryValue = 0.0;
    p.AccessFlags.PublicSet = 'off';
end % function
function N = getBufferSize(h, N)
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    N = h.PrivateData.BufferSize;
end % function
function N = setBufferSize(h, N)
    h.PrivateData.BufferSize = N;
    if h.Constructed
        initialize(h);
    end % if
end % function
function N = getNumChannels(h, N)
    % 87 89
    N = h.PrivateData.NumChannels;
end % function
function N = setNumChannels(h, N)
    h.PrivateData.NumChannels = N;
    if h.Constructed
        initialize(h);
    end % if
end % function
function N = setDownsampleFactor(h, N)
end % function
