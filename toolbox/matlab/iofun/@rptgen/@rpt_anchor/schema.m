function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgRG = findpackage('rptgen');
    % 10 11
    h = schema.class(pkgRG, 'rpt_anchor', pkgRG.findclass('rptcomponent'));
    % 12 14
    % 13 14
    p = rptgen.makeProp(h, 'LinkText', rptgen.makeStringType, '', xlate('Insert text'));
    % 15 18
    % 16 18
    % 17 18
    rptgen.makeStaticMethods(h, {}, {'anchor_getGenericType';'anchor_getObject';'anchor_getPropSrc'});
    % 19 23
    % 20 23
    % 21 23
    % 22 23
end % function
