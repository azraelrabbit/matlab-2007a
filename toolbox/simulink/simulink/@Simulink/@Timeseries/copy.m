function hout = copy(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    hout = Simulink.Timeseries;
    hout.TsValue = h.TsValue;
    hout.Name = h.Name;
    hout.DataChangeEventsEnabled = h.DataChangeEventsEnabled;
end % function
