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
    h = schema.class(package, 'p2d', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 17 19
    p = schema.prop(h, 'Type', 'MATLAB array');
    p.FactoryValue = 'S-Parameters';
    p.Description = 'Type of the Network Parameters';
    p.SetFunction = cellhorzcat(@setnetworkparametertype, 'rf', p, false);
    p.AccessFlags.PublicSet = 'Off';
    % 23 25
    p = schema.prop(h, 'P1', 'MATLAB array');
    p.FactoryValue = {[1.0]};
    p.Description = 'Power incident at port 1';
    p.SetFunction = cellhorzcat(@setpowercell, p);
    % 28 30
    p = schema.prop(h, 'P2', 'MATLAB array');
    p.FactoryValue = {[1.0]};
    p.Description = 'Power incident at port 2';
    p.SetFunction = cellhorzcat(@setpowercell, p);
    % 33 35
    p = schema.prop(h, 'Data', 'MATLAB array');
    p.FactoryValue = {[0.0,0.0;1.0,0.0]};
    p.Description = 'Network parameters';
    p.SetFunction = cellhorzcat(@setparamcell, p);
    % 38 40
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Reference impedance';
    p.SetFunction = cellhorzcat(@setcomplex, 'rf', p, false);
    p.Visible = 'off';
end % function
function out = setpowercell(h, out, prop)
    % 46 48
    cl = class(h);
    cl = strrep(cl, '.', ':');
    if isempty(out) || not(iscell(out))
        id = sprintf('rf:%s:schema:EmptyPowerCell', cl);
        error(id, '%s of %s must be a cell array of real vectors.', prop.name, upper(class(h)));
        % 52 54
    end % if
    for i=1.0:length(out)
        if isempty(out{i}) || not(isnumeric(out{i})) || not(isreal(out{i})) || not(isvector(out{i})) || any(lt(out{i}, 0.0)) || any(isnan(out{i})) || any(isinf(out{i}))
            % 56 59
            % 57 59
            id = sprintf('rf:%s:schema:IllegalPowerCell', cl);
            error(id, '%s of %s must be a cell array of real vectors.', prop.name, upper(class(h)));
            % 60 62
        end % if
        % 62 64
        if eq(size(out{i}, 1.0), 1.0)
            out{i} = ctranspose(out{i});
        end % if
    end % for
    h.PropertyChanged = true;
end % function
function out = setparamcell(h, out, prop)
    % 70 72
    cl = class(h);
    cl = strrep(cl, '.', ':');
    if isempty(out) || not(iscell(out))
        id = sprintf('rf:%s:schema:EmptyNetparamCell', cl);
        error(id, '%s of %s must be a cell array of complex 2-by-2-by-m matrices.', prop.name, upper(class(h)));
        % 76 78
    end % if
    for i=1.0:length(out)
        temp = squeeze(out{i});
        if isempty(out{i}) || not(isnumeric(out{i})) || ne(size(out{i}, 1.0), 2.0) || ne(size(out{i}, 2.0), 2.0) || ne(size(temp, 4.0), 1.0) || any(isnan(out{i}(:))) || any(isinf(out{i}(:)))
            % 81 84
            % 82 84
            id = sprintf('rf:%s:schema:IllegalNetparamSize', cl);
            error(id, '%s of %s must be a cell array of complex 2-by-2-by-m matrices.', prop.name, upper(class(h)));
            % 85 87
        end % if
    end % for
    h.PropertyChanged = true;
end % function
