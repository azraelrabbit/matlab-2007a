function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfckt');
    parent = findclass(package, 'amplifier');
    % 8 11
    % 9 11
    h = schema.class(package, 'mixer', parent);
    % 11 14
    % 12 14
    if isempty(findtype('MixerTypeDATATYPE'))
        schema.EnumType('MixerTypeDATATYPE', {'Downconverter','Upconverter'});
    end % if
    % 16 19
    % 17 19
    p = schema.prop(h, 'MixerSpurData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Mixer spur table';
    p.GetFunction = cellhorzcat(@getmixerspur);
    p.SetFunction = cellhorzcat(@setmixerspur, p);
    % 23 25
    p = schema.prop(h, 'MixerType', 'MixerTypeDATATYPE');
    p.FactoryValue = 'Downconverter';
    p.Description = 'Type';
    % 27 29
    p = schema.prop(h, 'FLO', 'MATLAB array');
    p.FactoryValue = 1e+09;
    p.Description = 'LO frequency';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, false, false);
    % 32 34
    p = schema.prop(h, 'FreqOffset', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Phase noise frequency offset';
    p.SetFunction = cellhorzcat(@setfreqoffset, 'rf', p);
    % 37 39
    p = schema.prop(h, 'PhaseNoiseLevel', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Phase noise level (dBc/Hz)';
    p.SetFunction = cellhorzcat(@setphasenoise, 'rf', p);
end % function
function out = setmixerspur(h, in, prop)
    % 44 46
    if not(isempty(in)) && not(isa(in, 'rfdata.mixerspur'))
        id = sprintf('rf:%s:schema:NotMixerSpurObj', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be an RFDATA.MIXERSPUR object.', h.Name, prop.name);
        else
            error(id, '%s must be an RFDATA.MIXERSPUR object.', prop.Description);
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
        set(refobj, 'MixerSpurData', []);
    else
        mixspurdataobj = get(refobj, 'MixerSpurData');
        if not(isa(mixspurdataobj, 'rfdata.mixerspur'))
            set(refobj, 'MixerSpurData', rfdata.mixerspur);
            mixspurdataobj = get(refobj, 'MixerSpurData');
        end % if
        set(mixspurdataobj, 'PinRef', in.PinRef, 'PLORef', in.PLORef, 'Data', in.Data, 'Block', h.Block);
        % 71 73
    end % if
    out = get(refobj, 'MixerSpurData');
end % function
function out = getmixerspur(h, in)
    out = [];
    data = h.AnalyzedResult;
    if not(isa(data, 'rfdata.data')) || not(hasreference(data))
        return;
    end % if
    refobj = getreference(data);
    if isa(refobj.MixerSpurData, 'rfdata.mixerspur')
        out = refobj.MixerSpurData;
        return;
    end % if
end % function
function out = setfreqoffset(h, out, product, prop)
    data = h.AnalyzedResult;
    if not(isa(data, 'rfdata.data'))
        setrfdata(h, rfdata.data);
        data = h.AnalyzedResult;
    end % if
    if isempty(out)
        set(data, 'FreqOffset', []);
    else
        out = setpositivevector(h, out, product, prop, true, false, true);
        n = length(out);
        set(data, 'FreqOffset', horzcat(mtimes(.5, out(1.0)), ctranspose(out(1.0:n)), mtimes(1.5, out(n))));
    end % if
end % function
function out = setphasenoise(h, out, product, prop)
    data = h.AnalyzedResult;
    if not(isa(data, 'rfdata.data'))
        setrfdata(h, rfdata.data);
        data = h.AnalyzedResult;
    end % if
    if isempty(out)
        set(data, 'PhaseNoiseLevel', []);
    else
        out = setnegativevector(h, out, product, prop, true, false, true);
        n = length(out);
        set(data, 'PhaseNoiseLevel', horzcat(out(1.0), ctranspose(out(1.0:n)), out(n)));
    end % if
end % function
