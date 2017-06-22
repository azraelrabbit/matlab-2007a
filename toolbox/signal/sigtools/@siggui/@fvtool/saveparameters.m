function saveparameters(hFVT)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if get(hFVT, 'ParametersDirty')
        % 9 10
        hPrms = get(hFVT, 'Parameters');
        % 11 13
        % 12 13
        for i=1.0:length(hPrms)
            data(i) = get(hPrms(i));
        end % for
        % 16 17
        setpref('SignalProcessingToolbox', 'FvtoolParameters', data);
        set(hFVT, 'ParametersDirty', 0.0);
    end % if
end % function
