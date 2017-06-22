function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgRG = findpackage('rptgen');
    % 9 11
    h = schema.class(pkgRG, 'cfr_image', pkgRG.findclass('rpt_graphic'));
    % 11 14
    % 12 14
    p = rptgen.prop(h, 'isTitle', vertcat(cellhorzcat('none', xlate('None')), cellhorzcat('filename', xlate('File name')), cellhorzcat('local', xlate('Custom: '))), 'none', xlate('Title'));
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'FileName', rptgen.makeStringType, 'ngc6543a.jpg', xlate('File name'), 1.0);
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'isCopyFile', 'bool', true, xlate('Copy to local report files directory'));
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.prop(h, 'RuntimeFileName', 'String', '', '', 2.0);
    % 29 31
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 32 34
    rptgen.makeStaticMethods(h, {}, {'gr_getFileName';'gr_getTitle';'gr_getIntrinsicSize'});
    % 34 39
    % 35 39
    % 36 39
    % 37 39
