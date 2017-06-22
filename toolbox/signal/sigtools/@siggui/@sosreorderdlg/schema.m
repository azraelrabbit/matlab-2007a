function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'sosreorderdlg', pk.findclass('helpdialog'));
    % 10 11
    findclass(findpackage('dfilt'), 'abstractsos');
    p = schema.prop(c, 'Filter', 'dfilt.abstractsos');
    set(p, 'SetFunction', @setfilter);
    % 14 15
    if isempty(findtype('sosreordertype'))
        schema.EnumType('sosreordertype', {'none','auto','up','down','custom'});
    end % if
    % 18 19
    p = schema.prop(c, 'ReorderType', 'sosreordertype');
    set(p, 'GetFunction', @getreordertype, 'SetFunction', @setreordertype);
    % 21 22
    if isempty(findtype('sosscalingdlgNumConstraints'))
        schema.EnumType('sosscalingdlgNumConstraints', {'None','Unit','Normalize','Powers of Two'});
        % 24 25
    end % if
    % 26 27
    if isempty(findtype('sosscalingdlgSVConstraints'))
        schema.EnumType('sosscalingdlgSVConstraints', {'None','Unit','Powers of Two'});
        % 29 30
    end % if
    % 31 32
    findclass(findpackage('dfilt'), 'abstractsos');
    p = schema.prop(c, 'Filter', 'dfilt.abstractsos');
    set(p, 'SetFunction', @setfilter);
    % 35 36
    p = schema.prop(c, 'Scale', 'on/off');
    % 37 39
    % 38 39
    p = schema.prop(c, 'PNorm', 'posint');
    set(p, 'AccessFlags.AbortSet', 'Off', 'Description', 'Scaling Norm', 'FactoryValue', 1.0);
    % 41 44
    % 42 44
    % 43 44
    p = schema.prop(c, 'MaxNumerator', 'string');
    set(p, 'FactoryValue', '2', 'Description', 'Maximum Numerator');
    % 46 47
    schema.prop(c, 'NumeratorConstraint', 'sosscalingdlgNumConstraints');
    % 48 49
    schema.prop(c, 'OverflowMode', 'QToolOverflowMode');
    % 50 51
    p = schema.prop(c, 'ScaleValueConstraint', 'sosscalingdlgSVConstraints');
    set(p, 'FactoryValue', 'Unit');
    % 53 54
    p = schema.prop(c, 'MaxScaleValue', 'string');
    set(p, 'FactoryValue', '2');
    % 56 57
    p = vertcat(schema.prop(c, 'refFilter', 'dfilt.abstractsos'), schema.prop(c, 'PropListener', 'handle.listener vector'), schema.prop(c, 'isScaling', 'bool'));
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 63 64
    schema.event(c, 'NewFilter');
end % function
function type = getreordertype(this, type)
    % 67 69
    % 68 69
    hoa = getcomponent(this, 'tag', 'overall');
    type = get(hoa, 'Selection');
end % function
function type = setreordertype(this, type)
    % 73 75
    % 74 75
    hoa = getcomponent(this, 'tag', 'overall');
    set(hoa, 'Selection', type);
end % function
