function varargout = who(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    nameStruct = get(h, 'Members');
    s = [];
    names = {};
    % 13 14
    num = length(nameStruct);
    % 15 18
    % 16 18
    % 17 18
    for i=1.0:num
        name = nameStruct(i).name;
        if not(isvarname(name))
            names{i} = horzcat('(''', name, ''')');
        else
            names{i} = name;
        end % if
    end % for
    % 26 27
    if gt(nargout, 0.0)
        varargout{1.0} = ctranspose(names);
    else
        % 30 31
        [s, err] = sprintf('\nYour logs for ''%s'' are:\n', h.Name);
        disp(s);
        % 33 34
        for i=1.0:num
            if eq(i, 1.0)
                s = names{i};
            else
                s = horzcat(s, '  ', names{i});
            end % if
        end % for
        disp(s);
        % 42 44
        % 43 44
        disp(sprintf('\n'));
    end % if
end % function
