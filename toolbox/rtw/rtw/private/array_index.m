function output = array_index(array, keyfield, value)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if not(isfield(array, keyfield))
        error(horzcat(keyfield, ' is not a field of the input array, ', array, '.'));
    end % if
    % 14 15
    for k=1.0:length(array)
        if isequal(getfield(array(k), keyfield), value)
            output = k;
            return;
        end % if
    end % for
    output = -1.0;
end % function
