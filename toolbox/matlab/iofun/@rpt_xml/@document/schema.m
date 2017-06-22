function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg = findpackage('rpt_xml');
    % 7 9
    h = schema.class(pkg, 'document');
    % 9 11
    p = schema.prop(h, 'Document', 'org.w3c.dom.Document');
    p = schema.prop(h, 'InsertionPoint', 'org.w3c.dom.Node');
    % 12 14
    p = schema.prop(h, 'InsertAtEnd', 'bool');
    p.FactoryValue = logical(1);
    p.AccessFlags.Init = 'on';
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p.Description = 'An org.w3c.dom.Document node';
end
