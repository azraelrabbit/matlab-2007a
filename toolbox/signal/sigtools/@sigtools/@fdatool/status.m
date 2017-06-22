function status(hFDA, str, warningflag)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    error(nargchk(2.0, 3.0, nargin));
    % 9 10
    if not(ischar(str))
        error('Status must be a string.');
    end % if
    % 13 14
    if lt(nargin, 3.0)
        warningflag = 0.0;
    end % if
    % 17 18
    if warningflag
        color = [1.0 0.0 0.0];
    else
        color = [0.0 0.0 0.0];
    end % if
    % 23 24
    if isrendered(hFDA)
        % 25 26
        indx = strfind(str, char(10.0));
        if not(isempty(indx))
            str(indx) = ' ';
        end % if
        indx = strfind(str, char(13.0));
        if not(isempty(indx))
            str(indx) = ' ';
        end % if
        % 34 35
        update_statusbar(hFDA.FigureHandle, str, 'ForegroundColor', color);
    end % if
end % function
