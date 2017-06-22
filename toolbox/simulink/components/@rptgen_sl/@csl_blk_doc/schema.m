function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'csl_blk_doc', pkgRG.findclass('rptcomponent'));
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.prop(h, 'ImportType', vertcat(cellhorzcat('text', xlate('Plain text (ignore line breaks)')), cellhorzcat('para-lb', xlate('Paragraphs defined by line breaks')), cellhorzcat('para-emptyrow', xlate('Paragraphs defined by empty rows')), cellhorzcat('honorspaces', xlate('Text (retain line breaks)')), cellhorzcat('fixedwidth', xlate('Fixed-width text (retain line breaks)'))), 'honorspaces', xlate('Import file as'), 'SIMULINK_Report_Gen');
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    p = rptgen.prop(h, 'LinkingAnchor', 'bool', true, xlate('Insert linking anchor for blocks'), 'SIMULINK_Report_Gen');
    % 30 34
    % 31 34
    % 32 34
    rptgen.makeStaticMethods(h, {}, {});
    % 34 36
