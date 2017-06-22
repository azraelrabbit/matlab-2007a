function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'abstractfilterorder', pk.findclass('sigcontainer'));
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'isMinOrd', 'bool');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @setisminord);
    % 15 17
    % 16 17
    p = schema.prop(c, 'order', 'string');
    set(p, 'FactoryValue', '10');
end % function
function out = setisminord(h, out)
    % 21 23
    % 22 23
    if not(out)
        set(h, 'mode', 'specify')
    end % if
end % function
