function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtstates');
    c = schema.class(pk, 'state');
    % 9 11
    c.Handle = 'off';
    % 11 13
    p = schema.prop(c, 'Value', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    p.FactoryValue = 0.0;
end
function val = set_value(this, val)
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    if ~(isnumeric(val) || isa(val, 'embedded.fi'))
        error('The value must be a number or a FI object.');
    end
end
