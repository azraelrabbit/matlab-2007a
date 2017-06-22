function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgUD = findpackage('rptgen_ud');
    pkgSF = findpackage('rptgen_sf');
    % 9 10
    h = schema.class(pkgSF, 'propsrc_sf', pkgUD.findclass('propsrc_ud'));
end % function
