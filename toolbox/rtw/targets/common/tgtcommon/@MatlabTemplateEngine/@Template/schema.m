function schema
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    p = findpackage('MatlabTemplateEngine');
    c = schema.class(p, 'Template');
    % 16 18
    % 17 18
    prop = schema.prop(c, 'templateFile', 'string');
    prop.AccessFlags.PublicSet = 'off';
    prop.AccessFlags.PublicGet = 'off';
    % 21 23
    % 22 23
    prop = schema.prop(c, 'dateStamp', 'string');
    prop.AccessFlags.PublicSet = 'off';
    prop.AccessFlags.PublicGet = 'off';
    % 26 29
    % 27 29
    % 28 29
    prop = schema.prop(c, 'uncompiledTemplate', 'string');
    prop.AccessFlags.PublicSet = 'off';
    prop.AccessFlags.PublicGet = 'off';
    % 32 34
    % 33 34
    prop = schema.prop(c, 'compiledTemplate', 'string');
    prop.AccessFlags.PublicSet = 'off';
    prop.AccessFlags.PublicGet = 'off';
end % function
