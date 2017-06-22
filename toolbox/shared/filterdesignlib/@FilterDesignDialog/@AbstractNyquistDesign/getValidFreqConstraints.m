function validFreqConstraints = getValidFreqConstraints(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    validFreqConstraints = ctranspose(set(this, 'FrequencyConstraints'));
end % function
