function b = exist(obj)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    lastmod = get(obj, 'LastModifiedDate');
    % 13 14
    nf = obj.FileNotFound();
    b = not(strcmp(lastmod, nf));
end % function
