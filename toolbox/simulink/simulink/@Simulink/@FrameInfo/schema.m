function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    p = findpackage('Simulink');
    c = schema.class(p, 'FrameInfo', findclass(p, 'TimeInfo'));
    % 10 12
    % 11 12
    if isempty(findtype('FrameState'))
        schema.EnumType('FrameState', {'Samples','Frames'});
    end % if
    % 15 17
    % 16 17
    p = schema.prop(c, 'State', 'FrameState');
    p.FactoryValue = 'Samples';
    schema.prop(c, 'Framesize', 'double');
    schema.prop(c, 'FrameStart', 'MATLAB array');
    schema.prop(c, 'FrameEnd', 'MATLAB array');
    schema.prop(c, 'FrameIncrement', 'double');
end % function
