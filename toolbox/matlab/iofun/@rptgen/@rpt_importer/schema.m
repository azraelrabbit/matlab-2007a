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
    h = schema.class(pkg, 'rpt_importer', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'ImportType', vertcat(cellhorzcat('text', xlate('Plain text (ignore line breaks)')), cellhorzcat('para-lb', xlate('Paragraphs defined by line breaks')), cellhorzcat('para-emptyrow', xlate('Paragraphs defined by empty rows')), cellhorzcat('honorspaces', xlate('Text (retain line breaks)')), cellhorzcat('fixedwidth', xlate('Fixed-width text (retain line breaks)')), cellhorzcat('docbook', xlate('DocBook XML')), cellhorzcat('external', xlate('Formatted text (HTML/RTF)')), cellhorzcat('code_highlighted', xlate('Syntax highlighted M-code'))), 'honorspaces', xlate('Import file as'));
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    rptgen.makeStaticMethods(h, {}, {'importFile'});
    % 28 31
    % 29 31
