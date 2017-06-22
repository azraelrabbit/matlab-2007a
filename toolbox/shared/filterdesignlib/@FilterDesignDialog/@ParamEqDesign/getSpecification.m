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
    switch lower(freqcons)
    case 'center frequency, bandwidth, passband width'
        specification = 'F0,BW,BWp';
    case 'center frequency, bandwidth, stopband width'
        specification = 'F0,BW,BWst';
    case 'center frequency, bandwidth'
        specification = 'N,F0,BW';
    case 'low frequency, high frequency'
        specification = 'N,Flow,Fhigh';
    end % switch
    % 26 27
    specification = sprintf('%s,Gref', specification);
    % 28 29
    switch lower(magcons)
    case 'reference, center frequency, bandwidth, passband'
        specification = sprintf('%s,G0,GBW,Gp', specification);
    case 'reference, center frequency, bandwidth, stopband'
        specification = sprintf('%s,G0,GBW,Gst', specification);
    case 'reference, center frequency, bandwidth, passband, stopband'
        specification = sprintf('%s,G0,GBW,Gp,Gst', specification);
    case 'reference, center frequency, bandwidth'
        specification = sprintf('%s,G0,GBW', specification);
    end % switch
end % function
