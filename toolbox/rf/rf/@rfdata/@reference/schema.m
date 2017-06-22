function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfdata');
    parent = findclass(package, 'rfdata');
    % 8 11
    % 9 11
    h = schema.class(package, 'reference', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'NetworkData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Network parameters';
    p.SetFunction = cellhorzcat(@setnetwork, p);
    % 17 19
    p = schema.prop(h, 'NoiseData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Spot noise';
    p.SetFunction = cellhorzcat(@setnoise, p);
    % 22 24
    p = schema.prop(h, 'NFData', 'handle');
    p.FactoryValue = [];
    p.Description = 'NF noise';
    p.SetFunction = cellhorzcat(@setnf, p);
    % 27 29
    p = schema.prop(h, 'PowerData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Power';
    p.SetFunction = cellhorzcat(@setpower, p);
    % 32 34
    p = schema.prop(h, 'IP3Data', 'handle');
    p.FactoryValue = [];
    p.Description = 'IP3 data';
    p.SetFunction = cellhorzcat(@setip3, p);
    % 37 39
    p = schema.prop(h, 'P2DData', 'handle');
    p.FactoryValue = [];
    p.Description = 'P2D data';
    p.SetFunction = cellhorzcat(@setp2d, p);
    % 42 44
    p = schema.prop(h, 'MixerSpurData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Mixer spur table';
    p.SetFunction = cellhorzcat(@setmixerspur, p);
    % 47 49
    p = schema.prop(h, 'OIP3', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Output 3rd order intercept (IP3)';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, true, true);
    p.Visible = 'Off';
    % 53 55
    p = schema.prop(h, 'OneDBC', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = '1dB gain compression power';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, true, true);
    p.Visible = 'Off';
    % 59 61
    p = schema.prop(h, 'PS', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Saturation power';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, true, true);
    p.Visible = 'Off';
    % 65 67
    p = schema.prop(h, 'GCS', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Gain compression at saturation';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, true, true);
    p.Visible = 'Off';
    % 71 73
    p = schema.prop(h, 'Date', 'MATLAB array');
    p.FactoryValue = '';
    p.Description = 'Date modified';
    p.Visible = 'Off';
    % 76 78
    p = schema.prop(h, 'Filename', 'MATLAB array');
    p.FactoryValue = '';
    p.Description = 'Full file name';
    p.Visible = 'Off';
end % function
function out = setnetwork(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(isa(out, 'rfdata.network'))
        id = sprintf('rf:%s:schema:NotNetworkObj', strrep(class(h), '.', ':'));
        error(id, '%s %s must be an RFDATA.NETWORK object.', prop.Description, upper(prop.name));
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
    h.Date = '';
end % function
function out = setnoise(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(isa(out, 'rfdata.noise'))
        id = sprintf('rf:%s:schema:NotNoiseObj', strrep(class(h), '.', ':'));
        error(id, '%s %s must be an RFDATA.NOISE object.', prop.Description, upper(prop.name));
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
    h.Date = '';
end % function
function out = setnf(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(isa(out, 'rfdata.nf'))
        id = sprintf('rf:%s:schema:NotNFObj', strrep(class(h), '.', ':'));
        error(id, '%s %s must be an RFDATA.NF object.', prop.Description, upper(prop.name));
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
    h.Date = '';
end % function
function out = setpower(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(isa(out, 'rfdata.power'))
        id = sprintf('rf:%s:schema:NotPowerObj', strrep(class(h), '.', ':'));
        error(id, '%s %s must be an RFDATA.POWER object.', prop.Description, upper(prop.name));
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
    h.Date = '';
end % function
function out = setip3(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(isa(out, 'rfdata.ip3'))
        id = sprintf('rf:%s:schema:NotIP3Obj', strrep(class(h), '.', ':'));
        error(id, '%s %s must be an RFDATA.IP3 object.', prop.Description, upper(prop.name));
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
    h.Date = '';
end % function
function out = setmixerspur(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(isa(out, 'rfdata.mixerspur'))
        id = sprintf('rf:%s:schema:NotMixerSpurObj', strrep(class(h), '.', ':'));
        error(id, '%s %s must be an RFDATA.MIXERSPUR object.', prop.Description, upper(prop.name));
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
    h.Date = '';
end % function
function out = setp2d(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(isa(out, 'rfdata.p2d'))
        id = sprintf('rf:%s:schema:NotP2DObj', strrep(class(h), '.', ':'));
        error(id, '%s must be an RFDATA.P2D object.', prop.Description);
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
    h.Date = '';
end % function
