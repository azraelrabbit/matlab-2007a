function validMagConstraints = getValidMagConstraints(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    validMagConstraints = ctranspose(set(this, 'MagnitudeConstraints'));
    % 9 10
    switch lower(this.FrequencyConstraints)
    case 'center frequency, bandwidth, passband width'
        validMagConstraints = validMagConstraints([1.0 3.0]);
    case 'center frequency, bandwidth, stopband width'
        validMagConstraints = validMagConstraints(2.0);
    end % switch
end % function
