function rtw_delete_file(fileName, force)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if ge(nargin, 2.0)
        if force
            if ispc
                dos(horzcat('attrib -r ', fileName));
            else
                unix(horzcat('chmod +w ', fileName));
            end % if
        end % if
    end % if
    % 15 16
    builtin('delete', fileName);
end % function
