function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 11 13
    h = schema.class(pkg, 'csl_blk_loop', pkgRG.findclass('rpt_looper'));
    % 13 15
    lic = 'SIMULINK_Report_Gen';
    % 15 18
    % 16 18
    p = rptgen.prop(h, 'LoopType', vertcat(cellhorzcat('auto', xlate('Automatic list from context')), cellhorzcat('list', xlate('Custom - use block list:'))), 'auto', '', lic);
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.prop(h, 'ObjectList', 'string vector', {}, '', lic);
    % 24 28
    % 25 28
    % 26 28
    p = rptgen.prop(h, 'SortBy', vertcat(cellhorzcat('alphabetical', xlate('Alphabetically by block name')), cellhorzcat('systemalpha', xlate('Alphabetically by system name')), cellhorzcat('fullpathalpha', xlate('Alphabetically by full Simulink path')), cellhorzcat('blocktype', xlate('By block type')), cellhorzcat('depth', xlate('By block depth')), cellhorzcat('none', xlate('By traversal order')), cellhorzcat('runtime', xlate('By simulation order'))), 'alphabetical', xlate('Sort blocks'), lic);
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    p = rptgen.prop(h, 'isFilterList', 'bool', false, horzcat(xlate('Search for Simulink property name/property value pairs'), ':'), lic);
    % 39 43
    % 40 43
    % 41 43
    p = rptgen.prop(h, 'FilterTerms', 'string vector', {'BlockType','Gain'}, '', lic);
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    p.Visible = 'off';
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    rptgen.makeStaticMethods(h, {}, {'getLoopBlocks';'loop_getDialogSchema';'loop_getContextString';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState';'parseList';'sortBlocks'});
    % 54 66
    % 55 66
    % 56 66
    % 57 66
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
