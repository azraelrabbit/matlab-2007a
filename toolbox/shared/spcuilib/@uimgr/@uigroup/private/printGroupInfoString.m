function printGroupInfoString(ch, level, i)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    s = sprintf('%sChild %d: %s', blanks(mtimes(3.0, level)), i, getGroupInfoString(ch));
    % 8 9
    disp(s);
end % function
