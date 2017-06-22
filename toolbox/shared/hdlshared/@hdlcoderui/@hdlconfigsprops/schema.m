function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hPackage = findpackage('hdlcoderui');
    hThisClass = schema.class(hPackage, 'hdlconfigsprops');
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if isempty(findtype('Path'))
        schema.EnumType('Path', {'path1','path2'});
        % 17 18
    end % if
    % 19 20
    if isempty(findtype('BlockScope'))
        schema.EnumType('BlockScope', {'type1','type2','type3','type4','type5','type6','type7'}, [1.0 2.0 3.0 4.0 5.0 6.0 7.0]);
        % 22 24
        % 23 24
    end % if
    % 25 26
    if isempty(findtype('Implementation1'))
        schema.EnumType('Implementation1', {'constraint1','constraint2','constraint3','constraint4','constraint5'}, [1.0 2.0 3.0 4.0 5.0]);
        % 28 30
        % 29 30
    end % if
    % 31 32
    p = schema.prop(hThisClass, 'enable', 'bool');
    p = schema.prop(hThisClass, 'path', 'string');
    p = schema.prop(hThisClass, 'BlockScope', 'string');
    p = schema.prop(hThisClass, 'implementation', 'string');
    p = schema.prop(hThisClass, 'implElements', 'mxArray');
    p = schema.prop(hThisClass, 'implSelIndex', 'int32');
    p = schema.prop(hThisClass, 'parameter', 'string');
    p = schema.prop(hThisClass, 'value', 'string');
end % function
