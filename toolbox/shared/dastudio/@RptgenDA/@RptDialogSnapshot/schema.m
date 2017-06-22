function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgDA = findpackage('RptgenDA');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkgDA, 'RptDialogSnapshot', pkgRG.findclass('rpt_graphic'));
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    p = rptgen.prop(h, 'ImageFormat', vertcat(cellhorzcat('auto', xlate('Automatic')), cellhorzcat('bmp', getfield(imformats('bmp'), 'description')), cellhorzcat('tif', getfield(imformats('tif'), 'description')), cellhorzcat('png', getfield(imformats('png'), 'description')), cellhorzcat('jpg', getfield(imformats('jpg'), 'description'))), 'auto', xlate('Image file format'));
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.prop(h, 'CaptureTabs', 'bool', true, xlate('Show all tabs'));
    % 29 33
    % 30 33
    % 31 33
    rptgen.makeStaticMethods(h, {}, {'traverseTabs';'captureDialog';'gr_getFileName';'gr_getIntrinsicSize'});
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
