function result = hdlisoutportsignal(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 11
        % 9 11
        % 10 11
        result = idx.isNtwkOutportSignal;
    else
        % 13 15
        % 14 15
        result = ismember(idx, hdloutportsignals);
        % 16 17
    end % if
end % function
