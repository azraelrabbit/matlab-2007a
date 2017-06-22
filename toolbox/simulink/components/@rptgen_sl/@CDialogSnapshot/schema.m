function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgSL = findpackage('rptgen_sl');
    pkgDA = findpackage('RptgenDA');
    % 11 12
    h = schema.class(pkgSL, 'CDialogSnapshot', pkgDA.findclass('RptDialogSnapshot'));
    % 13 16
    % 14 16
    % 15 16
    rptgen.makeStaticMethods(h, {}, {});
    % 17 18
end % function
