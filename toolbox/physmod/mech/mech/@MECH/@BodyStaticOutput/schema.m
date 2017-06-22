function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MECH');
    cls = schema.class(pkg, 'BodyStaticOutput');
    % 9 10
    nameP = schema.prop(cls, 'Name', 'string');
    massP = schema.prop(cls, 'Mass', 'double');
    inertiaP = schema.prop(cls, 'Inertia', 'Transform3');
    handleP = schema.prop(cls, 'Handle', 'double');
    b = MECH.WFrameStaticOutput;
    framesP = schema.prop(cls, 'Frames', 'MECH.WFrameStaticOutput vector');
end % function
