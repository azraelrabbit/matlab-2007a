function A = getData(h, data)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    numIntervals = min(length(h.End), length(h.Start));
    if eq(numIntervals, 0.0)
        A = [];
        return;
    end % if
    if ne(length(h.End), length(h.Start))
        warning('Differing start and end time length in the TimeInfo property')
    end % if
    % 19 21
    % 20 21
    if all(lt(h.End(1.0:numIntervals), h.Start(1.0:numIntervals)))
        A = [];
        return;
    end % if
    % 25 27
    % 26 27
    if isfinite(h.Increment)
        % 28 29
        A = [];
        for k=1.0:numIntervals
            A1 = ctranspose(h.Start(k):h.Increment:h.End(k));
            % 32 35
            % 33 35
            % 34 35
            if gt(minus(h.End(k), A1(end)), minus(plus(A1(end), h.Increment), h.End(k)))
                A1 = vertcat(A1, plus(A1(end), h.Increment));
            end % if
            A = vertcat(A, A1);
        end % for
        A = sort(A);
    else
        A = data;
    end % if
end % function
