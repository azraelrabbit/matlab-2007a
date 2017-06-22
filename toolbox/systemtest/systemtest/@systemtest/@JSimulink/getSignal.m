function result = getSignal(signal, id, dimension)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    isLog = true;
    if gt(nargin, 2.0)
        isLog = false;
    end
    % 14 16
    if isLog
        % 16 18
        logPathTokens = regexp(id, '([^/]*)', 'tokens');
        id = logPathTokens{end};
        % 19 21
        if iscell(id)
            % 21 23
            id = id{1.0};
        end
        % 24 26
        for cnt=1.0:minus(length(logPathTokens), 1.0)
            signal = signal.(char(logPathTokens{cnt}));
        end % for
        try
            result = signal.(char(id));
        catch
            result = get(signal, strtrim(sprintf(id)));
        end % try
    else
        % 34 36
        if isstruct(signal)
            % 36 39
            % 37 39
            result.time = signal.time;
            result.signals = signal.signals(id);
        else
            % 41 45
            % 42 45
            % 43 45
            if gt(numel(dimension{1.0}), 1.0)
                result = signal;
            else
                % 47 66
                % 48 66
                % 49 66
                % 50 66
                % 51 66
                % 52 66
                % 53 66
                % 54 66
                % 55 66
                % 56 66
                % 57 66
                % 58 66
                % 59 66
                % 60 66
                % 61 66
                % 62 66
                % 63 66
                % 64 66
                cumsize = cumsum(horzcat(dimension{:}));
                % 66 70
                % 67 70
                % 68 70
                result = signal(:, plus(minus(cumsize(id), dimension{id}), 1.0):cumsize(id));
            end
        end
    end
end
