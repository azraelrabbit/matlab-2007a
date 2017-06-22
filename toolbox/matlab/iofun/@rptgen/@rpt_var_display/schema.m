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
    h = schema.class(pkg, 'rpt_var_display', pkgRG.findclass('rptcomponent'));
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'SizeLimit', 'int32', 32.0, xlate('Size limit'));
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.makeProp(h, 'DisplayTable', vertcat(cellhorzcat('table', xlate('Table')), cellhorzcat('para', xlate('Paragraph')), cellhorzcat('text', xlate('Inline text')), cellhorzcat('auto', xlate('Auto table/paragraph'))), 'auto', xlate('Display as:'));
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    p = rptgen.makeProp(h, 'TitleMode', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('auto', xlate('Automatic')), cellhorzcat('manual', horzcat(xlate('Custom'), ':'))), 'auto', xlate('Title'));
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.makeProp(h, 'CustomTitle', rptgen.makeStringType, '', xlate(''));
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.makeProp(h, 'IgnoreIfEmpty', 'bool', logical(0), xlate('Ignore if value is empty'));
    % 45 49
    % 46 49
    % 47 49
    rptgen.makeStaticMethods(h, {}, {'vdGetDialogSchema';'applyTitle';'displayAsTable';'getDisplayName';'getDisplayValue'});
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
end
