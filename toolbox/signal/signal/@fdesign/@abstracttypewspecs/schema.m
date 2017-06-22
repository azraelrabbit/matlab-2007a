function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstracttypewspecs', pk.findclass('abstracttype'));
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    p = schema.prop(c, 'Response', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.Init', 'Off');
    % 15 16
    p = schema.prop(c, 'ResponseType', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.Init', 'Off', 'Visible', 'Off', 'GetFunction', @get_responsetype);
    % 18 20
    % 19 20
    findclass(findpackage('fspecs'), 'abstractspec');
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(c, 'CurrentSpecs', 'fspecs.abstractspec');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'SetFunction', @setcurrentspecs);
    % 26 28
    % 27 28
    p = vertcat(schema.prop(c, 'CapturedState', 'mxArray'), schema.prop(c, 'AllSpecs', 'fspecs.abstractspec vector'));
    % 29 32
    % 30 32
    % 31 32
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 33 34
    p = schema.prop(c, 'Description', 'string vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'GetFunction', @getdescription, 'AccessFlags.Init', 'Off');
    % 36 38
    % 37 38
    p = schema.prop(c, 'SpecificationType', 'string');
    set(p, 'AccessFlags.Init', 'Off', 'Visible', 'Off', 'GetFunction', @get_specificationtype, 'SetFunction', @set_specificationtype);
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    p = schema.prop(c, 'privSpecification', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 47 48
    schema.event(c, 'FaceChanged');
    schema.event(c, 'FaceChanging');
end % function
function rtype = get_responsetype(this, rtype)
    % 52 54
    % 53 54
    rtype = get(this, 'Response');
end % function
function stype = get_specificationtype(this, stype)
    % 57 59
    % 58 59
    stype = get(this, 'Specification');
end % function
function stype = set_specificationtype(this, stype)
    % 62 64
    % 63 64
    set(this, 'Specification', stype);
end % function
