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
    h = schema.class(pkg, 'cfr_paragraph', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'TitleType', vertcat(cellhorzcat('none', xlate('No paragraph title')), cellhorzcat('subcomp', xlate('Get title from first child')), cellhorzcat('specify', xlate('Custom title:'))), 'none', '');
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.makeProp(h, 'ParaTitle', rptgen.makeStringType, xlate('Paragraph Title'), '');
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.makeProp(h, 'ParaText', rptgen.makeStringType, '', '');
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    rptgen.makeStaticMethods(h, {}, {});
    % 31 33
