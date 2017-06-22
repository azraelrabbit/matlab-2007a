function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstractmultirate2', pk.findclass('abstracttype'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'MultirateType', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.Init', 'Off');
    % 14 15
    p = schema.prop(c, 'privResponse', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 17 19
    % 18 19
    findclass(findpackage('fdesign'), 'abstracttypewspecs');
    % 20 21
    p = schema.prop(c, 'CurrentFDesign', 'fdesign.abstracttypewspecs');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_currentfdesign, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 23 25
    % 24 25
    p = vertcat(schema.prop(c, 'AllFDesign', 'fdesign.abstracttypewspecs vector'), schema.prop(c, 'SpecificationTypeListeners', 'handle.listener vector'));
    % 26 28
    % 27 28
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 29 30
    p = schema.prop(c, 'Fs_in', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'GetFunction', @get_fs_in, 'AccessFlags.Init', 'Off');
    % 32 33
    p = schema.prop(c, 'Fs_out', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'GetFunction', @get_fs_out, 'AccessFlags.Init', 'Off');
end % function
