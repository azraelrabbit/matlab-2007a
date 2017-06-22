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
    h = schema.class(package, 'noise', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 17 19
    p = schema.prop(h, 'FMIN', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'The optimum noise figure';
    p.SetFunction = cellhorzcat(@setnf, p);
    % 22 24
    p = schema.prop(h, 'GAMMAOPT', 'MATLAB array');
    p.FactoryValue = 1.0;
    p.Description = 'The optimum source reflection coefficient';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, false);
    % 27 29
    p = schema.prop(h, 'RN', 'MATLAB array');
    p.FactoryValue = 1.0;
    p.Description = 'The equivalent normalized noise resistance';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, true, false);
end % function
function out = setnf(h, out, prop)
    % 34 36
    setpositivevector(h, out, 'rf', prop, true, true, false);
    if lt(out, 0.0)
        id = sprintf('rf:%s:schema:NFNotSmallerThanZerodB', strrep(class(h), '.', ':'));
        error(id, '%s of %s must be greater than or equal to 0 dB.', prop.name, upper(class(h)));
    end % if
end % function
