function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'csl_sys_filter', pkgRG.findclass('rptcomponent'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 17
    % 15 17
    p = rptgen.prop(h, 'minNumBlocks', 'double', 0.0, xlate('Report only if system has at least N blocks'), lic);
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'minNumSubSystems', 'double', 0.0, xlate('Report only if system has at least N subsystems'), lic);
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'isMask', vertcat(cellhorzcat('yes', xlate('masked')), cellhorzcat('no', xlate('unmasked')), cellhorzcat('either', xlate('either masked or unmasked'))), 'either', xlate('Report only if system mask type is'), lic);
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    rptgen.makeStaticMethods(h, {}, {'isTrue'});
    % 32 35
    % 33 35
