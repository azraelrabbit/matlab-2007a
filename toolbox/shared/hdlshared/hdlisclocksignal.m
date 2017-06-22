function result = hdlisclocksignal(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        result = false;
        clksigs = hdlclocksignals;
        for ii=1.0:length(clksigs)
            if strcmp(idx.RefNum, clksigs(ii).RefNum)
                result = true;
                return;
            end % if
        end % for
    else
        result = ismember(idx, hdlclocksignals);
    end % if
end % function
