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
    h = schema.class(pkg, 'csl_mdl_sim', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    lic = 'SIMULINK_Report_Gen';
    % 15 18
    % 16 18
    p = rptgen.prop(h, 'UseMdlIOParam', 'bool', true, xlate('Use model''s workspace I/O variable names'), lic);
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.prop(h, 'TimeOut', 'string', 'T', xlate('Time'), lic);
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.prop(h, 'StatesOut', 'string', 'X', xlate('States'), lic);
    % 26 30
    % 27 30
    % 28 30
    p = rptgen.prop(h, 'MatrixOut', 'string', 'Y', xlate('Output'), lic);
    % 30 34
    % 31 34
    % 32 34
    p = rptgen.prop(h, 'UseMdlTimespan', 'bool', true, xlate('Use model''s timespan values'));
    % 34 38
    % 35 38
    % 36 38
    p = rptgen.prop(h, 'StartTime', 'string', '0', xlate('Start'), lic);
    % 38 42
    % 39 42
    % 40 42
    p = rptgen.prop(h, 'EndTime', 'string', '60', xlate('Stop'), lic);
    % 42 46
    % 43 46
    % 44 46
    p = rptgen.prop(h, 'MessageDisplay', vertcat(cellhorzcat('screen', xlate('Display to command line')), cellhorzcat('msglist', xlate('Display to Report Generator message list')), cellhorzcat('report', xlate('Insert into report'))), 'screen', xlate('Simulation status messages'), lic);
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    p = rptgen.prop(h, 'SimParam', 'string vector', {}, xlate('Simulation Parameters'), lic);
    % 54 56
    p.Visible = 'off';
    % 56 59
    % 57 59
    p = rptgen.prop(h, 'CompileModel', 'bool', false, xlate('Compile model before simulation'), lic);
    % 59 63
    % 60 63
    % 61 63
    rptgen.makeStaticMethods(h, {}, {'makeOptionStruct';'preSimulateAction';'postSimulateAction';'dlgIOParameters';'dlgTimespan';'dlgSimOpt'});
    % 63 71
    % 64 71
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
