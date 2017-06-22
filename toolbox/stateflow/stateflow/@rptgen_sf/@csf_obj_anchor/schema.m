function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgSF = findpackage('rptgen_sf');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkgSF, 'csf_obj_anchor', pkgRG.findclass('rpt_anchor'));
    % 13 15
    % 14 15
    rptgen.makeStaticMethods(h, {}, {'anchor_getObject';'anchor_getPropSrc'});
    % 16 19
    % 17 19
    % 18 19
end % function
