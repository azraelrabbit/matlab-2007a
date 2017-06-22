function validFreqConstraints = getValidFreqConstraints(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    validFreqConstraints = ctranspose(set(this, 'FrequencyConstraints'));
    % 9 10
    if isminorder(this)
        validFreqConstraints = validFreqConstraints(1.0);
    end % if
end % function
