function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('uiservices');
    h = schema.class(pkg, 'MessageItem');
    % 9 12
    % 10 12
    % 11 12
    if isempty(findtype('MessageItemType'))
        schema.EnumType('MessageItemType', {'info','warn','fail'});
    end % if
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    schema.prop(h, 'Time', 'double');
    % 21 23
    % 22 23
    p = schema.prop(h, 'Type', 'MessageItemType');
    p.FactoryValue = 'info';
    % 25 27
    % 26 27
    schema.prop(h, 'Category', 'string');
    % 28 30
    % 29 30
    schema.prop(h, 'Summary', 'string');
    % 31 33
    % 32 33
    p = schema.prop(h, 'Detail', 'string');
end % function
