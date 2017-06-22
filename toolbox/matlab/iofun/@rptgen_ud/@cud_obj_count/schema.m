function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    pkgUD = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 13 15
    h = schema.class(pkgUD, 'cud_obj_count', pkgRG.findclass('rptcomponent'));
    % 15 18
    % 16 18
    p = rptgen.makeProp(h, 'ShowObjects', 'bool', logical(1), xlate('Include a list of objects in the table'));
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.makeProp(h, 'SortBy', vertcat(cellhorzcat('name', xlate('Alphabetically increasing by object type')), cellhorzcat('count', xlate('Numerically decreasing by object count'))), 'count', xlate('Sort results'));
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.makeProp(h, 'CountDepth', vertcat(cellhorzcat('shallow', xlate('Immediate children only')), cellhorzcat('deep', xlate('All descendants'))), 'shallow', xlate('Search depth'));
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    p = rptgen.prop(h, 'IncludeTotal', 'bool', false, xlate('Show total count'));
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    rptgen.makeStaticMethods(h, {}, {'count_getChildObjects';'count_getObjectClass';'count_getObjectType';'count_getPropsrc';'count_getRootObject';'count_getTitle'});
    % 41 49
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
end
