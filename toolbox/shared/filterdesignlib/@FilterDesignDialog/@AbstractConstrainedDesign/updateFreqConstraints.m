function updateFreqConstraints(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    validConstraints = getValidFreqConstraints(this);
    if not(any(strcmpi(this.FrequencyConstraints, validConstraints)))
        set(this, 'FrequencyConstraints', validConstraints{1.0});
    else
        updateMagConstraints(this);
    end % if
end % function
