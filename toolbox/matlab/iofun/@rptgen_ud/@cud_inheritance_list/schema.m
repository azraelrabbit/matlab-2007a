function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cud_inheritance_list', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'ListType', vertcat(cellhorzcat('methods', xlate('Methods')), cellhorzcat('properties', xlate('Properties'))), 'methods', xlate('Display in list'));
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.makeProp(h, 'ShowLocal', 'bool', logical(0), xlate('Show local (non-inherited) methods/properties'));
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.makeProp(h, 'ShowInherited', 'bool', logical(1), xlate('Show local inherited methods/properties'));
    % 26 30
    % 27 30
    % 28 30
    rptgen.makeStaticMethods(h, {}, {});
    % 30 32
end
