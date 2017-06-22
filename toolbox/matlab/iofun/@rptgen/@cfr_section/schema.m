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
    h = schema.class(pkg, 'cfr_section', pkgRG.findclass('rpt_section'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'SectionTitle', rptgen.makeStringType, xlate('Section Title'), xlate('Title'));
    % 15 18
    % 16 18
    p = rptgen.prop(h, 'isTitleFromSubComponent', 'bool', false, xlate('Get title from first child component'));
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.prop(h, 'NumberMode', vertcat(cellhorzcat('auto', xlate('Automatic')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'auto', xlate('Numbering'));
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.prop(h, 'Number', rptgen.makeStringType, '1');
    % 29 31
    rptgen.makeStaticMethods(h, {}, {});
    % 31 33
