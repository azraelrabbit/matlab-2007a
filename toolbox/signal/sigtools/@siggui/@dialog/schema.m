function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'dialog', pk.findclass('sigcontainer'));
    % 12 13
    if isempty(findtype('sigguiDialogWindowStyle'))
        schema.EnumType('sigguiDialogWindowStyle', {'Normal','Modal'});
    end % if
    % 16 17
    p = vertcat(schema.prop(c, 'DialogHandles', 'MATLAB array'), schema.prop(c, 'isApplied', 'bool'), schema.prop(c, 'Operations', 'handle vector'), schema.prop(c, 'WindowStyle', 'sigguiDialogWindowStyle'));
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    set(p(3.0), 'AccessFlags.Listener', 'Off');
    set(p(4.0), 'FactoryValue', 'Normal');
    % 26 27
    schema.event(c, 'DialogApplied');
    schema.event(c, 'DialogCancelled');
end % function
