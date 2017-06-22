function string = index2string(hSB, index)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    labels = get(hSB, 'Labels');
    % 11 12
    if gt(index, length(labels))
        error('Index is greater than the number of installed panels.');
    else
        string = labels{index};
    end % if
end % function
