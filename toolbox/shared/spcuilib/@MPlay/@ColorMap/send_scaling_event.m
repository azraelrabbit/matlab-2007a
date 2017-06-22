function send_scaling_event(colormapObj, eventStruct)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    send(colormapObj, 'ScalingChanged', handle.EventData(colormapObj, 'ScalingChanged'));
end % function
