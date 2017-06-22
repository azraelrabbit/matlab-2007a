function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    superclass = findclass(findpackage('wrfc'), 'view');
    c = schema.class(findpackage('hdsviewer'), 'xyview', superclass);
    % 11 13
    % 12 13
    schema.prop(c, 'Lines', 'MATLAB array');
    p = schema.prop(c, 'Style', 'string');
    p.FactoryValue = 'line';
    p.setFunction = @localReset;
    schema.prop(c, 'SelectionMarker', 'MATLAB array');
    p = schema.prop(c, 'Envelope', 'on/off');
    p.FactoryValue = 'off';
    p = schema.prop(c, 'EnvelopeLimit', 'MATLAB array');
    p.FactoryValue = 500.0;
    p = schema.prop(c, 'SelectionMode', 'on/off');
    p.FactoryValue = 'on';
    % 24 25
    schema.event(c, 'Selection');
end % function
function outData = localReset(eventSrc, eventData)
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    delete(eventSrc.Lines);
    eventSrc.Lines = [];
    outData = eventData;
end % function
