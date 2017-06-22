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
    c = schema.class(findpackage('hdsviewer'), 'scatterview', superclass);
    % 11 13
    % 12 13
    schema.prop(c, 'Scatters', 'MATLAB array');
    p = schema.prop(c, 'Style', 'string');
    p.FactoryValue = 'scatter';
    p = schema.prop(c, 'DefaultMarker', 'string');
    p.FactoryValue = 'o';
    p.setFunction = @localReset;
    schema.prop(c, 'SelectionMarker', 'MATLAB array');
    p = schema.prop(c, 'Envelope', 'on/off');
    p.FactoryValue = 'off';
    p = schema.prop(c, 'EnvelopeLimit', 'MATLAB array');
    p.FactoryValue = 400.0;
    p = schema.prop(c, 'SelectionMode', 'on/off');
    p.FactoryValue = 'on';
    % 26 28
    % 27 28
    schema.event(c, 'Selection');
end % function
function outData = localReset(eventSrc, eventData)
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    delete(eventSrc.Scatters);
    eventSrc.Scatters = [];
    outData = eventData;
end % function
