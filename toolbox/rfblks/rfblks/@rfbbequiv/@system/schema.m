function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfbbequiv');
    parent = findclass(package, 'rfbbequiv');
    % 8 11
    % 9 11
    h = schema.class(package, 'system', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'nModels', 'int32');
    p.FactoryValue = 0.0;
    p.Description = 'Number of models';
    p.SetFunction = cellhorzcat(@setpositive, 'rfblks', p, true, false, false);
    p.Visible = 'Off';
    % 18 20
    p = schema.prop(h, 'Models', 'MATLAB array');
    p.FactoryValue = {};
    p.Description = 'RF model objects';
    p.SetFunction = cellhorzcat(@setmodels, p);
    % 23 25
    p = schema.prop(h, 'ZS', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Source Impedance';
    p.SetFunction = cellhorzcat(@setcomplex, 'rfblks', p, false);
    % 28 30
    p = schema.prop(h, 'ZL', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Load Impedance';
    p.SetFunction = cellhorzcat(@setcomplex, 'rfblks', p, false);
    % 33 35
    p = schema.prop(h, 'NoiseResp', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Noise Response';
    p.Visible = 'Off';
    % 38 40
    p = schema.prop(h, 'InputFreq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Input Frequencies';
    p.Visible = 'Off';
    % 43 45
    p = schema.prop(h, 'OriginalCkt', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Original circuit';
    % 47 49
    p.SetFunction = cellhorzcat(@setckt, p);
    p.Visible = 'Off';
end % function
function out = setckt(h, out, prop)
    % 52 54
    if isempty(out)
        return;
    end % if
    if not(isa(out, 'rfckt.rfckt'))
        id = sprintf('rfblks:%s:schema:NotACKTObj', strrep(class(h), '.', ':'));
        error(id, '%s: %s must be a an RFCKT object.', h.Name, prop.name);
    end % if
end % function
function out = setmodels(h, out, prop)
    if isempty(out)
        return;
    end % if
    if not(isa(out, 'cell'))
        id = sprintf('rfblks:%s:schema:WrongModels', strrep(class(h), '.', ':'));
        error(id, '%s: %s must be a cell array of RFBBEQUIV objects.', h.Name, prop.name);
    end % if
    nmodels = length(out);
    for i=1.0:nmodels
        model = out{i};
        if not(isa(model, 'rfbbequiv.linear'))
            id = sprintf('rfblks:%s:schema:WrongModel', strrep(class(h), '.', ':'));
            error(id, '%s: %s each model must be an RFBBEQUIV object.', h.Name, prop.name);
        end % if
    end % for
end % function
