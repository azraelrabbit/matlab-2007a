function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 9 10
    h = schema.class(pkg, 'propsrc_ud', pkgRG.findclass('propsrc'));
end % function
