function value = hdldfs(node, level, func)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    value = [];
    if not(hdlsubsystemisblock(get_param(get(node, 'FullPath'), 'Handle')))
        nchild = get(node, 'NumberOfChild');
        for n=1.0:nchild
            if eq(n, 1.0)
                child = down(node);
            else
                child = right(child);
            end % if
            tmp = hdldfs(child, plus(level, 1.0), func);
            if isa(tmp, 'cell')
                if isempty(value)
                    value = tmp;
                else
                    value = cellhorzcat(value{:}, tmp{:});
                end % if
            else
                value = horzcat(value, tmp);
            end % if
        end % for
        tmp = func(node, level);
        if isa(tmp, 'cell')
            if isempty(value)
                value = tmp;
            else
                value = cellhorzcat(value{:}, tmp{:});
            end % if
        else
            value = horzcat(value, tmp);
        end % if
    end % if
end % function
