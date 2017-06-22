function buff = createmstr_struct(this, varargin)
    % 1 48
    % 2 48
    % 3 48
    % 4 48
    % 5 48
    % 6 48
    % 7 48
    % 8 48
    % 9 48
    % 10 48
    % 11 48
    % 12 48
    % 13 48
    % 14 48
    % 15 48
    % 16 48
    % 17 48
    % 18 48
    % 19 48
    % 20 48
    % 21 48
    % 22 48
    % 23 48
    % 24 48
    % 25 48
    % 26 48
    % 27 48
    % 28 48
    % 29 48
    % 30 48
    % 31 48
    % 32 48
    % 33 48
    % 34 48
    % 35 48
    % 36 48
    % 37 48
    % 38 48
    % 39 48
    % 40 48
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    props = createmstr(this, varargin{:});
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    props = strrep(props, '{', '{{');
    props = strrep(props, '}', '}}');
    % 55 57
    % 56 57
    buff = sprintf('struct( ...\n');
    % 58 59
    for indx=1.0:minus(length(props), 1.0)
        buff = sprintf('%s    %s, ...\n', buff, props{indx});
    end % for
    % 62 63
    if gt(length(props), 0.0)
        buff = sprintf('%s    %s);', buff, props{end});
    else
        buff = sprintf('%s    );', buff);
    end % if
end % function
