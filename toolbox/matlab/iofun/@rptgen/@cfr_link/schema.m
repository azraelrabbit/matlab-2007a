function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cfr_link', pkgRG.findclass('rptcomponent'));
    % 12 16
    % 13 16
    % 14 16
    p = rptgen.makeProp(h, 'LinkType', vertcat(cellhorzcat('anchor', xlate('Linking anchor')), cellhorzcat('link', xlate('Internal document link')), cellhorzcat('ulink', xlate('URL (external) link'))), 'link', xlate('Link type'));
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.makeProp(h, 'LinkID', rptgen.makeStringType, '', xlate('Link identifier'));
    % 24 28
    % 25 28
    % 26 28
    p = rptgen.makeProp(h, 'LinkText', rptgen.makeStringType, '', xlate('Link text'));
    % 28 32
    % 29 32
    % 30 32
    p = rptgen.makeProp(h, 'isEmphasizeText', 'bool', logical(0), xlate('Emphasize link text'));
    % 32 36
    % 33 36
    % 34 36
    rptgen.makeStaticMethods(h, {}, {});
    % 36 38
end
