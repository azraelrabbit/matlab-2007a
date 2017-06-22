function forward = hdlsignalforward(idx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 11
        % 10 11
        if isscalar(idx)
            forward = idx.Forward;
            if isempty(forward)
                forward = 0.0;
            end % if
        else
            % 17 18
            for n=1.0:length(idx)
                f = idx(n).Forward;
                if isempty(f)
                    f = 0.0;
                end % if
                forward(n) = f;
            end % for
            % 25 26
        end % if
    else
        % 28 30
        % 29 30
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        forward = signalTable.getForwards(idx);
        % 33 34
    end % if
end % function
