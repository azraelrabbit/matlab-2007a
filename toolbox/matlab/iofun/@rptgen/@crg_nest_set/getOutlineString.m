function s = getOutlineString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [path, name, ext] = fileparts(c.FileName);
    % 11 12
    if isempty(name)
        name = xlate('<None Selected>');
    end % if
    % 15 17
    % 16 17
    s = horzcat(xlate('Nest'), ' - ', name);
end % function
