function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractsrc', pk.findclass('abstractfirmultirate'));
    set(c, 'Description', 'abstract');
    % 11 12
    dpk = findpackage('sigdatatypes');
    findclass(dpk, 'posint_vector');
    p = schema.prop(c, 'RateChangeFactors', 'posint_vector');
    p.SetFunction = @setratechangefactor;
    p.GetFunction = @getratechangefactor;
    p.AccessFlags.Init = 'off';
    % 18 19
    p = schema.prop(c, 'InputOffset', 'mxArray');
    p.SetFunction = @set_inputoffset;
    p.FactoryValue = 0.0;
end % function
function io = set_inputoffset(this, io)
    % 24 27
    % 25 27
    % 26 27
    io = uint32(io);
end % function
