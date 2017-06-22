function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'abstractap', findclass(pk, 'adaptdffir'));
    c.Description = 'abstract';
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'StepSize', 'double0t1');
    p.FactoryValue = 1.0;
    % 19 20
    if isempty(findtype('spt_uint32geq2'))
        schema.UserType('spt_uint32geq2', 'spt_uint32', @checkgeq2);
    end % if
    % 23 24
    p = schema.prop(c, 'ProjectionOrder', 'spt_uint32geq2');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 2.0;
end % function
function checkgeq2(ord)
    % 30 33
    % 31 33
    % 32 33
    if lt(ord, 2.0)
        error('Value cannot be less than two.');
    end % if
end % function
