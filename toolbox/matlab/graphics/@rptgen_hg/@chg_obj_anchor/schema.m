function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgHG = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkgHG, 'chg_obj_anchor', pkgRG.findclass('rpt_anchor'));
    % 13 16
    % 14 16
    % 15 16
    p = rptgen.makeProp(h, 'ObjectType', {'Automatic','Automatic';'Figure','Figure';'Axes','Axes';'Object','Object'}, 'Automatic', xlate('Link from current'));
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    rptgen.makeStaticMethods(h, {}, {'anchor_getGenericType';'anchor_getObject';'anchor_getPropSrc'});
    % 25 29
    % 26 29
    % 27 29
    % 28 29
end % function
