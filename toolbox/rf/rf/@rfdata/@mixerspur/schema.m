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
    h = schema.class(package, 'mixerspur', parent);
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    p = schema.prop(h, 'PLORef', 'double');
    p.FactoryValue = 0.0;
    p.Description = 'Reference LO power';
    % 30 32
    p = schema.prop(h, 'PinRef', 'double');
    p.FactoryValue = 0.0;
    p.Description = 'Reference input power';
    % 34 36
    p = schema.prop(h, 'Data', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Mixer spur table';
    p.SetFunction = cellhorzcat(@setspurtable, p);
    % 39 41
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Reference impedance';
    p.SetFunction = cellhorzcat(@setcomplex, 'rf', p, false);
    p.Visible = 'off';
end % function
function out = setspurtable(h, out, prop)
    if isempty(out)
        return;
    end % if
    msg = sprintf('%s of %s must be an N by N matrix of real numbers between 0 and 99, \nwhere N is greater than 2.', prop.name, upper(class(h)));
    [s1, s2, s3] = size(out);
    if ne(s3, 1.0) || ne(s1, s2) || le(s1, 2.0)
        id = sprintf('rf:%s:schema:WrongSpurTableSize', strrep(class(h), '.', ':'));
        error(id, msg)
    end % if
    if not(isreal(out)) || any(gt(out(:), 99.0)) || any(lt(out(:), 0.0))
        id = sprintf('rf:%s:schema:ElementOutofRange', strrep(class(h), '.', ':'));
        error(id, msg)
    end % if
end % function
