function pathOut = stripPath(this, pathIn)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if iscell(pathIn)
        pathIn = pathIn{1.0};
    end % if
    % 8 9
    pathOut = strtrim(pathIn);
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if not(isempty(pathOut)) && strcmp(pathOut(1.0), '{')
        colonInd = strfind(pathOut, ':');
        if not(isempty(colonInd))
            % 21 22
            pathOut = pathOut(plus(colonInd(1.0), 1.0):end);
            spaceInd = strfind(pathOut, ' ');
            if not(isempty(spaceInd)) && gt(spaceInd(1.0), 1.0)
                pathOut = pathOut(1.0:minus(spaceInd(1.0), 1.0));
                % 26 27
                bracketInd = strfind(pathOut, '(');
                if not(isempty(bracketInd)) && gt(bracketInd(1.0), 1.0)
                    pathOut = pathOut(1.0:minus(bracketInd(1.0), 1.0));
                end % if
            end % if
        end % if
    end % if
end % function
