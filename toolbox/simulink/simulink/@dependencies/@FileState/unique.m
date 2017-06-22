function fs_out = unique(fs_in)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    filenames = cellstr(get(fs_in, 'FileName'));
    [unique_f, ignore, reverse_ind] = unique(filenames);
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    sizes = get(fs_in, 'Size');
    if iscell(sizes)
        sizes = horzcat(sizes{:});
    end % if
    dates = cellstr(get(fs_in, 'LastModifiedDate'));
    % 27 29
    unique_s = zeros(size(unique_f));
    unique_d = cell(size(unique_f));
    % 30 32
    for k=1.0:numel(unique_f)
        % 32 34
        matching_s = sizes(eq(reverse_ind, k));
        matching_d = dates(eq(reverse_ind, k));
        if eq(numel(unique(matching_s)), 1.0) && eq(numel(unique(matching_d)), 1.0)
            % 36 38
            unique_s(k) = matching_s(1.0);
            unique_d(k) = matching_d(1.0);
        else
            warning('Simulink:dependencies:MultipleFileStates', 'More than one size and/or last-modified date is specified for file "%s"', unique_f{k});
            % 41 45
            % 42 45
            % 43 45
            numeric_d = zeros(size(matching_d));
            for m=1.0:numel(matching_d)
                numeric_d(m) = datenum(matching_d{m}, dependencies.dateformat);
            end % for
            % 48 50
            [newest_d, ind] = max(numeric_d);
            unique_d(k) = matching_d(ind);
            unique_s(k) = matching_s(ind);
        end % if
    end % for
    % 54 56
    fs_out = dependencies.FileState.Create(unique_f, unique_s, unique_d);
