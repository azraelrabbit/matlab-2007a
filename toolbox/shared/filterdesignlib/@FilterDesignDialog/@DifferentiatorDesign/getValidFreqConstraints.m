function validFreqConstraints = getValidFreqConstraints(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    validFreqConstraints = ctranspose(set(this, 'FrequencyConstraints'));
end % function
