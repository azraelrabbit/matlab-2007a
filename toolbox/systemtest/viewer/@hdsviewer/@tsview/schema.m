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
    c = schema.class(findpackage('hdsviewer'), 'tsview', superclass);
    % 11 13
    % 12 13
    schema.prop(c, 'Lines', 'MATLAB array');
    p = schema.prop(c, 'Style', 'string');
    p.FactoryValue = 'line';
    p.setFunction = @localReset;
    p = schema.prop(c, 'SelectionMode', 'on/off');
    p.FactoryValue = 'on';
    schema.prop(c, 'SelectionMarker', 'MATLAB array');
    % 20 21
    schema.event(c, 'Selection');
end % function
function outData = localReset(eventSrc, eventData)
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    delete(eventSrc.Lines);
    eventSrc.Lines = [];
    outData = eventData;
end % function
