function specification = getSpecification(this, laState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 1.0) && not(isempty(laState))
        freqcons = laState.FrequencyConstraints;
        magcons = laState.MagnitudeConstraints;
    else
        freqcons = get(this, 'FrequencyConstraints');
        magcons = get(this, 'MagnitudeConstraints');
    end % if
    % 15 16
    specification = 'N';
    % 17 18
    switch lower(freqcons)
    case 'center frequency and quality factor'
        specification = sprintf('%s,F0,Q', specification);
    case 'center frequency and bandwidth'
        specification = sprintf('%s,F0,BW', specification);
    end % switch
    % 24 25
    switch lower(magcons)
    case 'passband ripple'
        specification = sprintf('%s,Ap', specification);
    case 'stopband attenuation'
        specification = sprintf('%s,Ast', specification);
    case 'passband ripple and stopband attenuation'
        specification = sprintf('%s,Ap,Ast', specification);
    end % switch
end % function
