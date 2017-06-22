function labels = StripMenuAccel(labels)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(ispc)
        if iscell(labels)
            for i=1.0:numel(labels)
                s = labels{i};
                s(eq(s, '&')) = [];
                labels{i} = s;
            end % for
        else
            labels(eq(labels, '&')) = [];
        end % if
    end % if
end % function
