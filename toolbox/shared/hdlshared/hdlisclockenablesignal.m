function result = hdlisclockenablesignal(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        result = false;
        clkensigs = hdlclockenablesignals;
        for ii=1.0:length(clkensigs)
            if strcmp(idx.RefNum, clkensigs(ii).RefNum)
                result = true;
                return;
            end % if
        end % for
    else
        result = ismember(idx, hdlclockenablesignals);
    end % if
end % function
