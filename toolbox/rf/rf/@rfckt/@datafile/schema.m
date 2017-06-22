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
    h = schema.class(package, 'datafile', parent);
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
    p = schema.prop(h, 'File', 'MATLAB array');
    p.FactoryValue = '';
    p.Description = 'File';
    p.SetFunction = cellhorzcat(@setfilename, p);
end % function
function out = setfilename(h, out, prop)
    % 28 30
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
