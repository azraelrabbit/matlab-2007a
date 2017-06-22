function Level = getlevel(LevName)
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
    if not(isstr(LevName))
        LevName = getfullname(LevName);
    end % if
    NewName = horzcat(LevName, 0.0);
    Loc = find(eq(NewName, '/'));
    if not(isempty(Loc))
        NewLoc = find(eq(NewName(plus(Loc, 1.0)), '/'));
        LevName(horzcat(Loc(NewLoc), plus(Loc(NewLoc), 1.0))) = '-';
    end % if
    Level = length(find(eq(LevName, '/')));
end % function
