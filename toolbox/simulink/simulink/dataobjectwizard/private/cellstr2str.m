function str = cellstr2str(cellofstr)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if eq(length(cellofstr), 1.0)
        str = sprintf('''%s''', cellofstr{1.0});
    else
        str = sprintf('''%s'', ', cellofstr{1.0});
        for i=2.0:length(cellofstr)
            if lt(i, length(cellofstr))
                str = sprintf('%s''%s'', ', str, cellofstr{i});
            else
                str = sprintf('%s''%s''', str, cellofstr{i});
            end % if
        end % for
    end % if
end % function
