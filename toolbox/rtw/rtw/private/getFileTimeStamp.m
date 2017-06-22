function timestamp = getFileTimeStamp(file)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    timestamp = '';
    if not(isempty(file)) && exist(file, 'file')
        record = dir(eval('file'));
        if not(isempty(record))
            timestamp = record(1.0).date;
        end % if
    end % if
end % function
