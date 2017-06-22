function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfckt');
    parent = findclass(package, 'basetxline');
    % 8 11
    % 9 11
    h = schema.class(package, 'microstrip', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Width', 'MATLAB array');
    p.FactoryValue = .0006;
    p.Description = 'Strip width';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 17 19
    p = schema.prop(h, 'Height', 'MATLAB array');
    p.FactoryValue = .000635;
    p.Description = 'Substrate height';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 22 24
    p = schema.prop(h, 'Thickness', 'MATLAB array');
    p.FactoryValue = 5e-06;
    p.Description = 'Strip thickness';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 27 29
    p = schema.prop(h, 'EpsilonR', 'MATLAB array');
    p.FactoryValue = 9.8;
    p.Description = 'Relative permittivity constant';
    p.SetFunction = cellhorzcat(@seter, 'rf', p, false, false, false);
    % 32 34
    p = schema.prop(h, 'SigmaCond', 'MATLAB array');
    p.FactoryValue = Inf;
    p.Description = 'Conductivity in conductor';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, true, false);
    % 37 39
    p = schema.prop(h, 'LossTangent', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Loss tangent of dielectric';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, false, false);
end % function
function out = seter(h, out, prod, prop, incZero, incInf, incEmpty)
    % 44 48
    % 45 48
    % 46 48
    out = setpositive(h, out, prod, prop, incZero, incInf, incEmpty);
    % 48 50
    if le(out, 1.0)
        id = 'rf:rfckt:microstrip:seter:LessThanOne';
        if isempty(h.Block)
            error(id, '%s: %s must be greater than 1.', h.Name, prop.name);
        else
            error(id, '%s must be greater than 1.', prop.Description);
        end % if
    end % if
end % function
