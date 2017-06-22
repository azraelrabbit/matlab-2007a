function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('channel');
    % 8 10
    c = schema.class(pk, 'interpfilter', findclass(pk, 'basesigproc'));
    % 10 12
    privateVisibility = 'off';
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    p = schema.prop(c, 'InterpFilterType', 'string');
    p.FactoryValue = 'Polyphase-Linear Hybrid';
    % 19 21
    p.AccessFlags.PublicSet = 'off';
    % 21 24
    % 22 24
    p = schema.prop(c, 'PolyphaseInterpFactor', 'posint');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setPolyphaseInterpFactor;
    p.GetFunction = @getPolyphaseInterpFactor;
    % 27 30
    % 28 30
    p = schema.prop(c, 'LinearInterpFactor', 'posint');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setLinearInterpFactor;
    p.GetFunction = @getLinearInterpFactor;
    % 33 36
    % 34 36
    p = schema.prop(c, 'SubfilterLength', 'posint');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setSubfilterLength;
    p.GetFunction = @getSubfilterLength;
    p.AccessFlags.PublicSet = 'off';
    % 40 43
    % 41 43
    p = schema.prop(c, 'MaxSubfilterLength', 'posint');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setMaxSubfilterLength;
    p.GetFunction = @getMaxSubfilterLength;
    % 46 49
    % 47 49
    p = schema.prop(c, 'NumChannels', 'posint');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setNumChannels;
    p.GetFunction = @getNumChannels;
    % 52 55
    % 53 55
    p = schema.prop(c, 'FilterBank', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setFilterBank;
    p.GetFunction = @getFilterBank;
    p.AccessFlags.PublicSet = 'off';
    % 59 62
    % 60 62
    p = schema.prop(c, 'FilterInputState', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setFilterInputState;
    p.GetFunction = @getFilterInputState;
    p.AccessFlags.PublicSet = 'off';
    % 66 69
    % 67 69
    p = schema.prop(c, 'FilterPhase', 'double');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setFilterPhase;
    p.GetFunction = @getFilterPhase;
    p.AccessFlags.PublicSet = 'off';
    % 73 76
    % 74 76
    p = schema.prop(c, 'LastFilterOutputs', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setLastFilterOutputs;
    p.GetFunction = @getLastFilterOutputs;
    p.AccessFlags.PublicSet = 'off';
    % 80 83
    % 81 83
    p = schema.prop(c, 'LinearInterpIndex', 'double');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setLinearInterpIndex;
    p.GetFunction = @getLinearInterpIndex;
    % 86 89
    % 87 89
    p = schema.prop(c, 'NumSamplesProcessed', 'udouble');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
function N = setPolyphaseInterpFactor(f, N)
    % 93 97
    % 94 97
    % 95 97
    f.PrivateData.PolyphaseInterpFactor = N;
    if f.Constructed
        initialize(f);
    end % if
end % function
function N = getPolyphaseInterpFactor(f, N)
    if isfield(f.PrivateData, 'PolyphaseInterpFactor')
        N = f.PrivateData.PolyphaseInterpFactor;
    end % if
end % function
function N = setLinearInterpFactor(f, N)
    f.PrivateData.LinearInterpFactor = N;
    if f.Constructed
        initialize(f);
    end % if
end % function
function N = getLinearInterpFactor(f, N)
    if isfield(f.PrivateData, 'LinearInterpFactor')
        N = f.PrivateData.LinearInterpFactor;
    end % if
end % function
function N = setSubfilterLength(f, N)
    f.PrivateData.SubfilterLength = N;
    if f.Constructed
        initialize(f);
    end % if
end % function
function N = getSubfilterLength(f, N)
    if isfield(f.PrivateData, 'SubfilterLength')
        N = f.PrivateData.SubfilterLength;
    end % if
end % function
function N = setMaxSubfilterLength(f, N)
    L = mrdivide(N, 2.0);
    if ne(N, 1.0) && not(isequal(L, round(L)))
        error('comm:channel_interpfilter:polyPhaseLength', 'Maximum polyphase subfilter length must be either even or 1.');
    end % if
    f.PrivateData.MaxSubfilterLength = N;
    if f.Constructed
        initialize(f);
    end % if
end % function
function N = getMaxSubfilterLength(f, N)
    if isfield(f.PrivateData, 'MaxSubfilterLength')
        N = f.PrivateData.MaxSubfilterLength;
    end % if
end % function
function N = setNumChannels(f, N)
    f.PrivateData.NumChannels = N;
    if f.Constructed
        initialize(f);
    end % if
end % function
function N = getNumChannels(f, N)
    if isfield(f.PrivateData, 'NumChannels')
        N = f.PrivateData.NumChannels;
    end % if
end % function
function N = setFilterBank(f, N)
    f.PrivateData.FilterBank = N;
end % function
function N = getFilterBank(f, N)
    if isfield(f.PrivateData, 'FilterBank')
        N = f.PrivateData.FilterBank;
    end % if
end % function
function N = setFilterInputState(f, N)
    f.PrivateData.FilterInputState = N;
end % function
function N = getFilterInputState(f, N)
    if isfield(f.PrivateData, 'FilterInputState')
        N = f.PrivateData.FilterInputState;
    end % if
end % function
function N = setFilterPhase(f, N)
    f.PrivateData.FilterPhase = N;
end % function
function N = getFilterPhase(f, N)
    if isfield(f.PrivateData, 'FilterPhase')
        N = f.PrivateData.FilterPhase;
    end % if
end % function
function N = setLastFilterOutputs(f, N)
    f.PrivateData.LastFilterOutputs = N;
end % function
function N = getLastFilterOutputs(f, N)
    if isfield(f.PrivateData, 'LastFilterOutputs')
        N = f.PrivateData.LastFilterOutputs;
    end % if
end % function
function N = setLinearInterpIndex(f, N)
    f.PrivateData.LinearInterpIndex = N;
end % function
function N = getLinearInterpIndex(f, N)
    if isfield(f.PrivateData, 'LinearInterpIndex')
        N = f.PrivateData.LinearInterpIndex;
    end % if
end % function
