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
    h = schema.class(pkg, 'rpt_section', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    rptgen.makeStaticMethods(h, {'getParentSectionType'}, {'addTitle';'closeSection';'getChunkFileName';'getSectionFileName';'getSectionType';'makeSection';'writeChildren';'writeComment';'writeProcessingInstruction';'writeXmlHeader'});
    % 15 31
    % 16 31
    % 17 31
    % 18 31
    % 19 31
    % 20 31
    % 21 31
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    p = rptgen.prop(h, 'SectionType', vertcat(cellhorzcat('book', xlate('Book')), cellhorzcat('chapter', xlate('Chapter')), cellhorzcat('sect1', xlate('Section 1')), cellhorzcat('sect2', xlate('Section 2')), cellhorzcat('sect3', xlate('Section 3')), cellhorzcat('sect4', xlate('Section 4')), cellhorzcat('sect5', xlate('Section 5')), cellhorzcat('simplesect', xlate('Simple Section')), cellhorzcat('auto', xlate('Automatic'))), 'auto', 'SectionType');
    % 31 46
    % 32 46
    % 33 46
    % 34 46
    % 35 46
    % 36 46
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    p = rptgen.prop(h, 'RuntimeSectionType', 'string', '', 'Section type (runtime)', 2.0);
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    p = rptgen.prop(h, 'RuntimeSerializer', 'java.lang.Object', [], '', 2.0);
    p = rptgen.prop(h, 'RuntimeRelativeFileName', 'string', '', '', 2.0);
    p = rptgen.prop(h, 'RuntimeSectionIndex', 'int32', 0.0, '', 2.0);
