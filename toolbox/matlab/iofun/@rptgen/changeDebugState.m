function prevState = changeDebugState(newState)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if gt(nargout, 0.0)
        if exist('dbstatus', 'file')
            prevState = dbstatus;
        else
            % 21 24
            % 22 24
            prevState = [];
            % 24 29
            % 25 29
            % 26 29
            % 27 29
        end
    end
    % 30 32
    if lt(nargin, 1.0) || not(exist('dbclear', 'file')) || not(exist('dbstop', 'file'))
        % 32 34
        return
    end
    % 35 37
    dbclear('if', 'warning');
    dbclear('if', 'caught', 'error');
    dbclear('if', 'error');
    % 39 42
    % 40 42
    if isstruct(newState)
        for i=1.0:length(newState)
            if not(isempty(newState(i).cond))
                id = newState(i).identifier;
                for j=1.0:length(id)
                    dbstop('if', newState(i).cond, id{j});
                end % for
            end
        end % for
    else
        if ischar(newState)
            dbstop('if', newState);
        else
            if newState
                dbstop('if', 'caught', 'error');
                dbstop('if', 'error')
                dbstop('if', 'warning');
                % 58 60
            end
        end
    end
end
