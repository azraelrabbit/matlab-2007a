function sl_customization(cm)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    cm.addModelAdvisorCheckFcn(@defineModelAdvisorChecks);
end % function
function recordCellArray = defineModelAdvisorChecks
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    recordCellArray = {};
    % 18 20
    % 19 20
    feature('scopedaccelenablement', 'off');
    % 21 22
    recordCellArray{plus(end, 1.0)} = styleguide_db_0112;
    recordCellArray{plus(end, 1.0)} = styleguide_ar_0001;
    recordCellArray{plus(end, 1.0)} = styleguide_ar_0002;
    recordCellArray{plus(end, 1.0)} = styleguide_jm_0001;
    recordCellArray{plus(end, 1.0)} = styleguide_hd_0001;
    recordCellArray{plus(end, 1.0)} = styleguide_db_0008;
    % 28 31
    % 29 31
    % 30 31
    recordCellArray{plus(end, 1.0)} = styleguide_db_0031;
    % 32 34
    % 33 34
    recordCellArray{plus(end, 1.0)} = styleguide_db_0042;
    recordCellArray{plus(end, 1.0)} = styleguide_jm_0010;
    recordCellArray{plus(end, 1.0)} = styleguide_db_0142;
    recordCellArray{plus(end, 1.0)} = styleguide_db_0143;
    % 38 39
    recordCellArray{plus(end, 1.0)} = styleguide_db_0033;
    % 40 41
    recordCellArray{plus(end, 1.0)} = styleguide_db_0146;
    recordCellArray{plus(end, 1.0)} = styleguide_jm_0008;
    recordCellArray{plus(end, 1.0)} = styleguide_jm_0009;
    recordCellArray{plus(end, 1.0)} = styleguide_jm_0013;
    % 45 47
    % 46 47
    recordCellArray{plus(end, 1.0)} = styleguide_db_0110;
    recordCellArray{plus(end, 1.0)} = styleguide_db_0126;
    % 49 52
    % 50 52
    % 51 52
    recordCellArray{plus(end, 1.0)} = styleguide_db_0123;
    % 53 54
    recordCellArray{plus(end, 1.0)} = styleguide_db_0125;
end % function
