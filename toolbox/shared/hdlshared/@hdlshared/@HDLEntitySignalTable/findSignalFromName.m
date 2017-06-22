function signals = findSignalFromName(this, names)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if not(iscell(names))
        names = cellhorzcat(names);
    end % if
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    signals = [];
    for ii=1.0:length(this.Signals)
        if any(strcmp(names, this.Signals(ii).Name))
            if isempty(signals)
                signals = ii;
            else
                signals = horzcat(signals, ii);
            end % if
        end % if
        % 26 28
        % 27 28
        if isequal(length(names), length(signals))
            break
        end % if
    end % for
end % function
