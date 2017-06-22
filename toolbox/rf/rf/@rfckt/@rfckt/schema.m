function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfbase');
    parent = findclass(package, 'rfbase');
    % 8 11
    % 9 11
    h = schema.class(findpackage('rfckt'), 'rfckt', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'nPort', 'int32');
    p.FactoryValue = 2.0;
    p.Description = 'Number of Ports';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    p.AccessFlags.PublicSet = 'Off';
    % 18 20
    p = schema.prop(h, 'AnalyzedResult', 'handle');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = [];
    p.Description = 'Data';
    p.SetFunction = cellhorzcat(@setdata, p);
    % 24 26
    p = schema.prop(h, 'Flag', 'int32');
    p.FactoryValue = 28.0;
    p.AccessFlags.PublicSet = 'Off';
    p.Description = 'Circuit Flag';
    p.Visible = 'Off';
    % 30 32
    p = schema.prop(h, 'SimulationFreq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Simulation frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    p.Visible = 'off';
    % 36 38
    p = schema.prop(h, 'DefaultFreq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Default frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    p.Visible = 'off';
    % 42 44
    p = schema.prop(h, 'RFdata', 'handle');
    % 44 46
    p.FactoryValue = [];
    p.Description = 'Data';
    p.SetFunction = cellhorzcat(@setdata1, p);
    p.Visible = 'Off';
    % 49 51
    p = schema.prop(h, 'UserData', 'MATLAB array');
    p.FactoryValue = {};
    p.Description = 'User data';
    p.SetFunction = cellhorzcat(@setuserdata, p);
    p.Visible = 'off';
    % 55 57
    p = schema.prop(h, 'SimData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Simulation data';
    p.SetFunction = cellhorzcat(@setsimdata, p);
    p.Visible = 'off';
end
function out = setdata1(h, out, prop)
    % 63 65
    if isempty(out)
        return
    end
    if not(isa(out, 'rfdata.data'))
        id = sprintf('rf:%s:schema:NotRFdataObj', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be an RFDATA.DATA object.', h.Name, prop.name);
        else
            error(id, '%s must be an RFDATA.DATA object.', prop.Description);
        end
    end
end
function out = setdata(h, out, prop)
    set(h, 'RFdata', out);
    if isempty(out)
        return
    end
    if not(isa(out, 'rfdata.data'))
        id = sprintf('rf:%s:schema:NotRFdataObj', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be an RFDATA.DATA object.', h.Name, prop.name);
        else
            error(id, '%s must be an RFDATA.DATA object.', prop.Description);
        end
    end
    if h.CopyPropertyObj
        out = copy(out);
        set(h, 'RFdata', out);
    end
end
function out = setsimdata(h, out, prop)
    if isempty(out)
        return
    end
    if not(isa(out, 'rfdata.network'))
        id = sprintf('rf:%s:schema:NotNetworkDdataObj', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be an RFDATA.NETWORK object.', h.Name, prop.name);
        else
            error(id, '%s must be an RFDATA.NETWORK object.', prop.Description);
        end
    end
    if h.CopyPropertyObj
        out = copy(out);
    end
end
function out = setuserdata(h, out, prop)
    if isempty(out)
        return
    end
    if not(isa(out, 'cell'))
        id = sprintf('rf:%s:schema:NotACKTCell', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be a cell array of 2-port RFCKT objects.', h.Name, prop.name);
        else
            error(id, '%s must be a cell array of 2-port RFCKT objects.', prop.Description);
        end
    end
    nckts = length(out);
    for i=1.0:nckts
        ckt = out{i};
        if not(isa(ckt, 'rfckt.rfckt'))
            id = sprintf('rf:%s:schema:NotACKTObj', strrep(class(h), '.', ':'));
            if isempty(h.Block)
                error(id, '%s: %s must be a cell array of 2-port RFCKT objects.', h.Name, prop.name);
            else
                error(id, '%s must be a cell array of 2-port RFCKT objects.', prop.Description);
            end
        else
            if ne(get(ckt, 'nPort'), 2.0)
                id = sprintf('rf:%s:schema:NotATwoPort', strrep(class(h), '.', ':'));
                if isempty(h.Block)
                    error(id, '%s: %s must be a cell array of 2-port RFCKT objects.', h.Name, prop.name);
                else
                    error(id, '%s must be a cell array of 2-port RFCKT objects.', prop.Description);
                end
            end
        end
        out{i} = copy(ckt);
    end % for
end
