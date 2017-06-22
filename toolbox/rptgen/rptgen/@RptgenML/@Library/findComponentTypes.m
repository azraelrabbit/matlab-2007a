function ct = findComponentTypes(libH)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ctNodes = find(libH, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory');
    ct = sort(get(ctNodes, 'Name'));
end % function
