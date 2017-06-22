function y = rtmdlsortflds(flds, indices)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    [junk, sortI] = sort(indices);
    % 10 11
    y = flds(sortI, :);
end % function
