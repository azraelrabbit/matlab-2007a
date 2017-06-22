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
    h = schema.class(pkg, 'rpt_list', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'ListTitle', rptgen.makeStringType, '', xlate('List title'));
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.makeProp(h, 'ListStyle', vertcat(cellhorzcat('itemizedlist', xlate('Bulleted list')), cellhorzcat('orderedlist', xlate('Numbered list'))), 'itemizedlist', xlate('List style'));
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.makeProp(h, 'Spacing', vertcat(cellhorzcat('compact', xlate('Compact')), cellhorzcat('normal', xlate('Normal'))), 'compact', xlate('List spacing'));
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    p.Visible = 'off';
    % 31 34
    % 32 34
    p = rptgen.makeProp(h, 'NumerationType', {'arabic','1,2,3,4,...';'loweralpha','a,b,c,d,...';'upperalpha','A,B,C,D,...';'lowerroman','i,ii,iii,iv,...';'upperroman','I,II,III,IV,...'}, 'arabic', xlate('Numbering style'));
    % 34 44
    % 35 44
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    p = rptgen.makeProp(h, 'NumInherit', vertcat(cellhorzcat('inherit', xlate('Show parent number in nested list (1.1.a)')), cellhorzcat('ignore', xlate('Show only current list value (a)'))), 'ignore', '');
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    p = rptgen.makeProp(h, 'NumContinue', vertcat(cellhorzcat('continues', xlate('Continue numbering from previous list')), cellhorzcat('restarts', xlate('Always start at 1'))), 'restarts', '');
    % 50 54
    % 51 54
    % 52 54
    p.Visible = 'off';
    % 54 57
    % 55 57
    rptgen.makeStaticMethods(h, {}, {'list_getDialogSchema';'list_getContent';'list_getTitle'});
    % 57 62
    % 58 62
    % 59 62
    % 60 62
