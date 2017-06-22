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
    if strcmpi(this.ImpulseResponse, 'fir')
        validFreqConstraints = validFreqConstraints([1.0 4.0]);
    else
        validFreqConstraints = validFreqConstraints([1.0 2.0 3.0 5.0 6.0 7.0]);
    end % if
end % function
