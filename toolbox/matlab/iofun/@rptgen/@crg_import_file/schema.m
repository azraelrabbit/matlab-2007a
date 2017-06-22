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
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkg, 'crg_import_file', pkgRG.findclass('rpt_importer'));
    % 13 15
    % 14 15
    p = rptgen.makeProp(h, 'FileName', rptgen.makeStringType, '', xlate('File name'));
    % 16 19
    % 17 19
    % 18 19
    rptgen.makeStaticMethods(h, {}, {});
    % 20 21
end % function
