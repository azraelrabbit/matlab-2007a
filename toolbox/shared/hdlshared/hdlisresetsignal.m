function result = hdlisresetsignal(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        result = false;
        clkresetsigs = hdlresetsignals;
        for ii=1.0:length(clkresetsigs)
            if strcmp(idx.RefNum, clkresetsigs(ii).RefNum)
                result = true;
                return;
            end % if
        end % for
    else
        result = ismember(idx, hdlresetsignals);
    end % if
end % function
