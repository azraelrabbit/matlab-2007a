function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    if not(strcmpi(get(hfdesign, 'Response'), 'parametric equalizer'))
        b = false;
        return;
    end % if
    % 13 16
    % 14 16
    set(this, 'Gref', num2str(hfdesign.Gref), 'G0', num2str(hfdesign.G0), 'GBW', num2str(hfdesign.GBW));
    % 16 20
    % 17 20
    % 18 20
    switch hfdesign.Specification
    case 'F0,BW,BWp,Gref,G0,GBW,Gp'
        set(this, 'FrequencyConstraints', 'Center frequency, bandwidth, passband width', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, passband', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'BWpass', num2str(hfdesign.BWpass), 'Gpass', num2str(hfdesign.Gpass));
        % 23 29
        % 24 29
        % 25 29
        % 26 29
        % 27 29
    case 'F0,BW,BWst,Gref,G0,GBW,Gst'
        % 28 30
        set(this, 'FrequencyConstraints', 'Center frequency, bandwidth, stopband width', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, stopband', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'BWstop', num2str(hfdesign.BWstop), 'Gstop', num2str(hfdesign.Gstop));
        % 31 37
        % 32 37
        % 33 37
        % 34 37
        % 35 37
    case 'F0,BW,BWp,Gref,G0,GBW,Gp,Gst'
        % 36 38
        set(this, 'FrequencyConstraints', 'Center frequency, bandwidth, passband width', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, passband, stopband', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'BWpass', num2str(hfdesign.BWpass), 'Gpass', num2str(hfdesign.Gpass), 'Gstop', num2str(hfdesign.Gstop));
        % 39 46
        % 40 46
        % 41 46
        % 42 46
        % 43 46
        % 44 46
    case 'N,F0,BW,Gref,G0,GBW'
        % 45 47
        set(this, 'FrequencyConstraints', 'Center frequency, bandwidth', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW));
        % 48 52
        % 49 52
        % 50 52
    case 'N,F0,BW,Gref,G0,GBW,Gp'
        % 51 53
        set(this, 'FrequencyConstraints', 'Center frequency, bandwidth', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, passband', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'Gpass', num2str(hfdesign.Gpass));
        % 54 59
        % 55 59
        % 56 59
        % 57 59
    case 'N,F0,BW,Gref,G0,GBW,Gst'
        % 58 60
        set(this, 'FrequencyConstraints', 'Center frequency, bandwidth', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, stopband', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'Gstop', num2str(hfdesign.Gstop));
        % 61 66
        % 62 66
        % 63 66
        % 64 66
    case 'N,F0,BW,Gref,G0,GBW,Gp,Gst'
        % 65 67
        set(this, 'FrequencyConstraints', 'Center frequency, bandwidth', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, passband, stopband', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'Gpass', num2str(hfdesign.Gpass), 'Gstop', num2str(hfdesign.Gstop));
        % 68 74
        % 69 74
        % 70 74
        % 71 74
        % 72 74
    case 'N,Flow,Fhigh,Gref,G0,GBW'
        % 73 75
        set(this, 'FrequencyConstraints', 'Low frequency, high frequency', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth', 'Flow', num2str(hfdesign.Flow), 'Fhigh', num2str(hfdesign.Fhigh));
        % 76 80
        % 77 80
        % 78 80
    case 'N,Flow,Fhigh,Gref,G0,GBW,Gp'
        % 79 81
        set(this, 'FrequencyConstraints', 'Low frequency, high frequency', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, passband', 'Flow', num2str(hfdesign.Flow), 'Fhigh', num2str(hfdesign.Fhigh), 'Gpass', num2str(hfdesign.Gpass));
        % 82 87
        % 83 87
        % 84 87
        % 85 87
    case 'N,Flow,Fhigh,Gref,G0,GBW,Gst'
        % 86 88
        set(this, 'FrequencyConstraints', 'Low frequency, high frequency', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, stopband', 'Flow', num2str(hfdesign.Flow), 'Fhigh', num2str(hfdesign.Fhigh), 'Gstop', num2str(hfdesign.Gstop));
        % 89 94
        % 90 94
        % 91 94
        % 92 94
    case 'N,Flow,Fhigh,Gref,G0,GBW,Gp,Gst'
        % 93 95
        set(this, 'FrequencyConstraints', 'Low frequency, high frequency', 'MagnitudeConstraints', 'Reference, center frequency, bandwidth, passband, stopband', 'Flow', num2str(hfdesign.Flow), 'Fhigh', num2str(hfdesign.Fhigh), 'Gpass', num2str(hfdesign.Gpass), 'Gstop', num2str(hfdesign.Gstop));
        % 95 102
        % 96 102
        % 97 102
        % 98 102
        % 99 102
        % 100 102
    end % switch
    % 102 104
    abstract_setGUI(this, Hd);
