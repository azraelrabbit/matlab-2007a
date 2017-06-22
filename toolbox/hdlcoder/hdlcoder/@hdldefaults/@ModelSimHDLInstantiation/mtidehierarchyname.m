function [path, name] = mtidehierarchyname(this, namestr)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    sep = find(eq(namestr, '/'));
    if not(isempty(sep))
        path = namestr(1.0:sep(end));
        if ne(path(1.0), '/')
            path = horzcat('/', path);
        end % if
        name = namestr(plus(sep(end), 1.0):end);
    else
        path = '';
        name = namestr;
    end % if
end % function
