function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen');
    % 10 12
    % 11 12
    h = schema.class(pkg, 'cfr_text', pkg.findclass('rptcomponent'));
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    p = rptgen.prop(h, 'Content', rptgen.makeStringType, '', xlate('Text to include in report'));
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = rptgen.prop(h, 'isCode', 'bool', false, xlate('Show text as syntax-highlighted M code'));
    % 25 28
    % 26 28
    % 27 28
    p = rptgen.prop(h, 'isEmphasis', 'bool', false, xlate('Emphasize text'));
    % 29 32
    % 30 32
    % 31 32
    p = rptgen.prop(h, 'isLiteral', 'bool', false, xlate('Retain spaces and carriage returns'));
    % 33 36
    % 34 36
    % 35 36
    p = rptgen.prop(h, 'ForceParagraph', 'bool', false, xlate('Force output to be a paragraph'));
    % 37 38
    p.Visible = 'off';
    % 39 41
    % 40 41
    rptgen.makeStaticMethods(h, {}, {});
    % 42 43
end % function
