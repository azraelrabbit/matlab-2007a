function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdopts');
    c = schema.class(pk, 'sosscaling');
    % 10 11
    if isempty(findtype('sosReorderOpts'))
        schema.EnumType('sosReorderOpts', {'auto','none','up','down','lowpass','highpass','bandpass','bandstop'});
    end % if
    p = schema.prop(c, 'sosReorder', 'sosReorderOpts');
    % 15 16
    p = schema.prop(c, 'MaxNumerator', 'posdouble');
    p.FactoryValue = 2.0;
    % 18 19
    if isempty(findtype('numeratorConstraintOpts'))
        schema.EnumType('numeratorConstraintOpts', {'none','unit','normalize','po2'});
    end % if
    p = schema.prop(c, 'NumeratorConstraint', 'numeratorConstraintOpts');
    % 23 24
    if isempty(findtype('scalingOverflowMode'))
        schema.EnumType('scalingOverflowMode', {'wrap','saturate','satall'});
    end % if
    p = schema.prop(c, 'OverflowMode', 'scalingOverflowMode');
    % 28 29
    if isempty(findtype('scaleValueConstraintOpts'))
        schema.EnumType('scaleValueConstraintOpts', {'unit','none','po2'});
    end % if
    p = schema.prop(c, 'ScaleValueConstraint', 'scaleValueConstraintOpts');
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(c, 'MaxScaleValue', 'mxArray');
    p.SetFunction = @set_svmax;
    p.GetFunction = @get_svmax;
    p.AccessFlags.Init = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    % 42 43
    p = schema.prop(c, 'privsvmax', 'posdouble');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 1.0;
end % function
