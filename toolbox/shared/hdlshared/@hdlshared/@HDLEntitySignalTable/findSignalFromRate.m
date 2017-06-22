function signals = findSignalFromRate(this, rate)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    signals = [];
    for ii=1.0:length(this.Signals)
        % 9 10
        if any(eq(rate, this.Signals(ii).Rate))
            if isempty(signals)
                signals = ii;
            else
                signals = horzcat(signals, ii);
            end % if
        end % if
    end % for
end % function
