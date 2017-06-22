function cleanup(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    locDeleteNewFigures(h, double(h.PreRunOpenFigures));
    % 9 11
    % 10 11
    h.reset;
end % function
function locDeleteNewFigures(h, oldFigures)
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    curFigures = findall(allchild(0.0), 'type', 'figure');
    % 19 21
    % 20 21
    badFigures = setdiff(curFigures, oldFigures);
    % 22 23
    badFigures = find(handle(badFigures), '-depth', 0.0, '-not', {'tag'}, h.getSafeTags);
    % 24 27
    % 25 27
    % 26 27
    delete(badFigures);
end % function
