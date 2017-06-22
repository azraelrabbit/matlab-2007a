function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfckt');
    parent = findclass(package, 'rfckt');
    % 8 11
    % 9 11
    h = schema.class(package, 'passive', parent);
    % 11 14
    % 12 14
    if isempty(findtype('InterpolationMethodDATATYPE'))
        schema.EnumType('InterpolationMethodDATATYPE', {'Linear','Cubic','Spline'});
    end % if
    % 16 19
    % 17 19
    p = schema.prop(h, 'IntpType', 'InterpolationMethodDATATYPE');
    p.FactoryValue = 'Linear';
    p.Description = 'Interpolation type';
    % 21 23
    p = schema.prop(h, 'NetworkData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Network parameters';
    p.GetFunction = cellhorzcat(@getnetwork);
    p.SetFunction = cellhorzcat(@setnetwork, p);
    % 27 29
    p = schema.prop(h, 'File', 'MATLAB array');
    p.FactoryValue = '';
    p.Description = 'File';
    p.SetFunction = cellhorzcat(@setfilename, p);
    p.Visible = 'Off';
end % function
function out = setfilename(h, out, prop)
    % 35 37
    if isempty(out)
        return;
    end % if
    if not(isa(out, 'char'))
        id = sprintf('rf:%s:schema:NotAString', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be a string.', h.Name, prop.name);
        else
            error(id, '%s must be a string.', prop.Description);
        end % if
    end % if
end % function
function out = setnetwork(h, in, prop)
    if not(isempty(in)) && not(isa(in, 'rfdata.network'))
        id = sprintf('rf:%s:schema:NotAString', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be an RFDATA.NETWORK object.', h.Name, prop.name);
        else
            error(id, '%s must be an RFDATA.NETWORK object.', prop.Description);
        end % if
    end % if
    data = h.AnalyzedResult;
    if not(isa(data, 'rfdata.data'))
        setrfdata(h, rfdata.data);
        data = h.AnalyzedResult;
    end % if
    if not(hasreference(data))
        setreference(data, rfdata.reference);
    end % if
    refobj = getreference(data);
    if isempty(in)
        set(refobj, 'NetworkData', []);
    else
        if not(hasnetworkreference(data))
            set(refobj, 'NetworkData', rfdata.network);
        end % if
        networkdataobj = get(refobj, 'NetworkData');
        set(networkdataobj, 'Freq', in.Freq, 'Data', in.Data, 'Type', in.Type, 'Z0', in.Z0, 'Block', h.Block);
    end % if
    out = get(refobj, 'NetworkData');
end % function
function out = getnetwork(h, in)
    out = [];
    data = h.AnalyzedResult;
    if not(isa(data, 'rfdata.data')) || not(hasreference(data))
        return;
    end % if
    refobj = getreference(data);
    out = get(refobj, 'NetworkData');
end % function
