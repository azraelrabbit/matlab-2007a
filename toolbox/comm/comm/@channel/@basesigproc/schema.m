function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('channel');
    % 9 10
    c = schema.class(pk, 'basesigproc', findclass(pk, 'baseclass'));
    % 11 12
    visibility = 'off';
    privateVisibility = 'off';
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(c, 'PrivateData', 'mxArray');
    p.FactoryValue = struct('EnableProbe', 1.0, 'ProbeFcn', @probe, 'NumSampOutput', 0.0, 'UseCMEX', 1.0);
    % 21 24
    % 22 24
    % 23 24
    p.Visible = privateVisibility;
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'ObjectLocked', 'strictbool');
    p.FactoryValue = 0.0;
    p.Visible = visibility;
    % 34 36
    % 35 36
    p = schema.prop(c, 'EnableProbe', 'strictbool');
    p.AccessFlags.Init = 'off';
    p.Visible = visibility;
    p.SetFunction = @setEnableProbe;
    p.GetFunction = @getEnableProbe;
    % 41 43
    % 42 43
    p = schema.prop(c, 'ProbeFcn', 'mxArray');
    p.AccessFlags.Init = 'off';
    p.Visible = visibility;
    p.SetFunction = @setProbeFcn;
    p.GetFunction = @getProbeFcn;
    % 48 50
    % 49 50
    p = schema.prop(c, 'NumSampOutput', 'udouble');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.Visible = visibility;
    p.SetFunction = @setNumSampOutput;
    p.GetFunction = @getNumSampOutput;
    % 56 58
    % 57 58
    p = schema.prop(c, 'UseCMEX', 'strictbool');
    p.FactoryValue = 1.0;
    p.Visible = visibility;
    p.SetFunction = @setUseCMEX;
    p.GetFunction = @getUseCMEX;
end % function
function u = setEnableProbe(s, u)
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    % 69 70
    check_object_locked(s, 'enable probe flag')
    s.PrivateData.EnableProbe = u;
end % function
function u = getEnableProbe(s, u)
    if isfield(s.PrivateData, 'EnableProbe')
        u = s.PrivateData.EnableProbe;
    end % if
end % function
function u = setProbeFcn(s, u)
    % 79 80
    check_object_locked(s, 'probe function')
    s.PrivateData.ProbeFcn = u;
end % function
function u = getProbeFcn(s, u)
    if isfield(s.PrivateData, 'ProbeFcn')
        u = s.PrivateData.ProbeFcn;
    end % if
end % function
function u = setNumSampOutput(s, u)
    % 89 90
    s.PrivateData.NumSampOutput = u;
end % function
function u = getNumSampOutput(s, u)
    if isfield(s.PrivateData, 'NumSampOutput')
        u = s.PrivateData.NumSampOutput;
    end % if
end % function
function u = setUseCMEX(s, u)
    % 98 99
    check_object_locked(s, 'UseCMEX')
    s.PrivateData.UseCMEX = u;
end % function
function u = getUseCMEX(s, u)
    if isfield(s.PrivateData, 'UseCMEX')
        u = s.PrivateData.UseCMEX;
    end % if
end % function
