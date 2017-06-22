function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MECH');
    cls = schema.class(pkg, 'WFrameStaticOutput');
    % 9 10
    nameP = schema.prop(cls, 'Name', 'string');
    posP = schema.prop(cls, 'Pos', 'Position3');
    rotP = schema.prop(cls, 'Rot', 'VectorAngle');
    TP = schema.prop(cls, 'T', 'Transform3');
end % function
