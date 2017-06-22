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
    h = schema.class(package, 'power', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 17 19
    p = schema.prop(h, 'Pin', 'MATLAB array');
    p.FactoryValue = {[1.0,10.0]};
    p.Description = 'Input power';
    p.SetFunction = cellhorzcat(@setpowercell, p);
    % 22 24
    p = schema.prop(h, 'Pout', 'MATLAB array');
    p.FactoryValue = {[1.0,10.0]};
    p.Description = 'Output power';
    p.SetFunction = cellhorzcat(@setpowercell, p);
    % 27 29
    p = schema.prop(h, 'Phase', 'MATLAB array');
    p.FactoryValue = {};
    p.Description = 'Phase shift';
    p.SetFunction = cellhorzcat(@setphasecell, p);
    % 32 34
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Reference impedance';
    p.SetFunction = cellhorzcat(@setcomplex, 'rf', p, false);
    p.Visible = 'off';
end % function
function out = setpowercell(h, out, prop)
    % 40 42
    cl = class(h);
    cl = strrep(cl, '.', ':');
    if isempty(out)
        id = sprintf('rf:%s:schema:EmptyPowerCell', cl);
        error(id, '%s of %s must be real cell.', prop.name, upper(class(h)));
    end % if
    for i=1.0:length(out)
        if not(isnumeric(out{i})) || not(isreal(out{i}))
            id = sprintf('rf:%s:schema:NotARealCell', cl);
            error(id, '%s of %s must be a real cell.', prop.name, upper(class(h)));
        end % if
        [row, col] = size(out{i});
        if not(isnumeric(out{i})) || ne(min(horzcat(row, col)), 1.0) || any(isnan(out{i}))
            id = sprintf('rf:%s:schema:NotARealCell', cl);
            error(id, '%s of %s must be a real cell.', prop.name, upper(class(h)));
        end % if
        if eq(row, 1.0)
            out{i} = ctranspose(out{i});
        end % if
    end % for
    h.PropertyChanged = true;
end % function
function out = setphasecell(h, out, prop)
    if isempty(out)
        return;
    end % if
    for i=1.0:length(out)
        cl = class(h);
        cl = strrep(cl, '.', ':');
        if not(isnumeric(out{i})) || not(isreal(out{i}))
            id = sprintf('rf:%s:schema:NotARealCell', cl);
            error(id, '%s of %s must be a real cell.', prop.name, upper(class(h)));
        end % if
        [row, col] = size(out{i});
        if not(isnumeric(out{i})) || ne(min(horzcat(row, col)), 1.0) || any(isnan(out{i}))
            id = sprintf('rf:%s:schema:NotARealCell', cl);
            error(id, '%s of %s must be a real cell.', prop.name, upper(class(h)));
        end % if
        if eq(row, 1.0)
            out{i} = ctranspose(out{i});
        end % if
    end % for
    h.PropertyChanged = true;
end % function
