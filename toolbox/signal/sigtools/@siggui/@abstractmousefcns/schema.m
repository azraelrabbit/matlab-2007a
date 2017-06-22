function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'abstractmousefcns', pk.findclass('sigcontainer'));
    c.Description = 'abstract';
    % 12 13
    if isempty(findtype('sigguiButtonClickType'))
        schema.EnumType('sigguiButtonClickType', {'Left','Right','Shift','Double'});
    end % if
    % 16 17
    if isempty(findtype('sigguiButtonState'))
        schema.EnumType('sigguiButtonState', {'Up','Down','DoubleDown'});
    end % if
    % 20 22
    % 21 22
    p = vertcat(schema.prop(c, 'CurrentAxes', 'double'), schema.prop(c, 'CallbackObject', 'double'), schema.prop(c, 'MovementTransaction', 'handle.transaction'), schema.prop(c, 'WindowButtonMotionFcn', 'MATLAB array'), schema.prop(c, 'WindowButtonUpFcn', 'MATLAB array'), schema.prop(c, 'ButtonState', 'sigguiButtonState'));
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    p(1.0).FactoryValue = -1.0;
    p(2.0).FactoryValue = -1.0;
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 33 35
    % 34 35
    schema.prop(c, 'AnnounceNewSpecs', 'on/off');
    % 36 38
    % 37 38
    p = vertcat(schema.prop(c, 'ButtonClickType', 'sigguiButtonClickType'), schema.prop(c, 'CurrentPoint', 'double_vector'));
    % 39 42
    % 40 42
    % 41 42
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 43 44
    schema.event(c, 'ButtonDown');
    schema.event(c, 'ButtonUp');
    schema.event(c, 'MouseMotion');
    schema.event(c, 'NewSpecs');
end % function
