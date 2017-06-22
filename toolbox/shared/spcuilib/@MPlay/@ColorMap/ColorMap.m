function h = ColorMap(mplayObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h = MPlay.ColorMap;
    % 10 12
    % 11 12
    h.titleStr = 'Colormap';
    h.init(mplayObj);
    % 14 17
    % 15 17
    % 16 17
    h.hfig = mplayObj.widgetsObj.hfig;
    h.hColormapMenu = mplayObj.widgetsObj.hmenus.colormap;
    % 19 22
    % 20 22
    % 21 22
    pk = findpackage('MPlay');
    cl = pk.findclass('ColorMap');
    prop = cl.findprop('cmapStr');
    h.listener_cmapStr = handle.listener(h, prop, 'PropertyPostSet', @cmap_changed);
    % 26 27
    h.listener_cmapStr.CallbackTarget = h;
    % 28 31
    % 29 31
    % 30 31
    prop = cl.findprop('cmap');
    h.listener_cmap = handle.listener(h, prop, 'PropertyPostSet', @cmap_changed);
    % 33 34
    h.listener_cmap.CallbackTarget = h;
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    prop = cl.findprop('UserRange');
    h.listener_scale = handle.listener(h, prop, 'PropertyPostSet', @send_scaling_event);
    % 42 43
    h.listener_scale.CallbackTarget = h;
    % 44 45
    prop = cl.findprop('UserRangeMin');
    h.listener_scale(2.0) = handle.listener(h, prop, 'PropertyPostSet', @send_scaling_event);
    % 47 48
    h.listener_scale(2.0).CallbackTarget = h;
    % 49 50
    prop = cl.findprop('UserRangeMax');
    h.listener_scale(3.0) = handle.listener(h, prop, 'PropertyPostSet', @send_scaling_event);
    % 52 53
    h.listener_scale(3.0).CallbackTarget = h;
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    cmap_changed(h);
end % function
