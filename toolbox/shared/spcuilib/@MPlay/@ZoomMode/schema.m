function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MPlay');
    hThisClass = schema.class(pkg, 'ZoomMode');
    % 9 12
    % 10 12
    % 11 12
    if isempty(findtype('zoom_mode_type'))
        schema.EnumType('zoom_mode_type', {'off','inmode','outmode','panmode'});
    end % if
    % 15 18
    % 16 18
    % 17 18
    cl = pkg.findclass('Widgets');
    p = schema.prop(hThisClass, 'widgetsObj', 'MPlay.Widgets');
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    pk = findpackage('hg');
    cl = findclass(pk, 'uitoggletool');
    cl = findclass(pk, 'uimenu');
    % 25 26
    p = schema.prop(hThisClass, 'zoomin_button', 'hg.uitoggletool');
    p.AccessFlags.PublicSet = 'off';
    % 28 29
    p = schema.prop(hThisClass, 'zoomout_button', 'hg.uitoggletool');
    p.AccessFlags.PublicSet = 'off';
    % 31 32
    p = schema.prop(hThisClass, 'panimage_button', 'hg.uitoggletool');
    p.AccessFlags.PublicSet = 'off';
    % 34 35
    p = schema.prop(hThisClass, 'zoomin_menu', 'hg.uimenu');
    p.AccessFlags.PublicSet = 'off';
    % 37 38
    p = schema.prop(hThisClass, 'zoomout_menu', 'hg.uimenu');
    p.AccessFlags.PublicSet = 'off';
    % 40 41
    p = schema.prop(hThisClass, 'panimage_menu', 'hg.uimenu');
    p.AccessFlags.PublicSet = 'off';
    % 43 44
    p = schema.prop(hThisClass, 'zoom_mode', 'zoom_mode_type');
    p.AccessFlags.PublicSet = 'off';
end % function
