function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkg, 'chg_property', pkgRG.findclass('rpt_var_display'));
    % 13 14
    p = rptgen.makeProp(h, 'ObjectType', {'Figure','Figure';'Axes','Axes';'Object','Object'}, 'Figure', xlate('Get property from current'));
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = rptgen.makeProp(h, 'FigureProperty', rptgen.makeStringType, 'Name', xlate('Figure property'));
    % 22 24
    % 23 24
    p = rptgen.makeProp(h, 'AxesProperty', rptgen.makeStringType, 'Title', xlate('Axes property'));
    % 25 27
    % 26 27
    p = rptgen.makeProp(h, 'ObjectProperty', rptgen.makeStringType, 'Tag', xlate('Object property'));
    % 28 31
    % 29 31
    % 30 31
    rptgen.makeStaticMethods(h, {}, {'getDisplayName';'getDisplayValue'});
    % 32 35
    % 33 35
    % 34 35
end % function
