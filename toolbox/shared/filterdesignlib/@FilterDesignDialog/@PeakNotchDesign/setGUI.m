function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    hfdesign = getfdesign(Hd);
    switch lower(get(hfdesign, 'Response'))
    case 'peaking filter'
        set(this, 'ResponseType', 'peak')
    case 'notching filter'
        set(this, 'ResponseType', 'notch')
    otherwise
        b = false;
        return;
    end % switch
    % 18 20
    switch hfdesign.Specification
    case 'N,F0,Q'
        set(this, 'FrequencyConstraints', 'Center frequency and quality factor', 'MagnitudeConstraints', 'Unconstrained', 'F0', num2str(hfdesign.F0), 'Q', num2str(hfdesign.Q));
        % 23 27
        % 24 27
        % 25 27
    case 'N,F0,Q,Ap'
        % 26 28
        set(this, 'FrequencyConstraints', 'Center frequency and quality factor', 'MagnitudeConstraints', 'Passband ripple', 'F0', num2str(hfdesign.F0), 'Q', num2str(hfdesign.Q), 'Apass', num2str(hfdesign.Apass));
        % 29 34
        % 30 34
        % 31 34
        % 32 34
    case 'N,F0,Q,Ast'
        % 33 35
        set(this, 'FrequencyConstraints', 'Center frequency and quality factor', 'MagnitudeConstraints', 'Stopband attenuation', 'F0', num2str(hfdesign.F0), 'Q', num2str(hfdesign.Q), 'Astop', num2str(hfdesign.Astop));
        % 36 41
        % 37 41
        % 38 41
        % 39 41
    case 'N,F0,Q,Ap,Ast'
        % 40 42
        set(this, 'FrequencyConstraints', 'Center frequency and quality factor', 'MagnitudeConstraints', 'Passband ripple and stopband attenuation', 'F0', num2str(hfdesign.F0), 'Q', num2str(hfdesign.Q), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 43 49
        % 44 49
        % 45 49
        % 46 49
        % 47 49
    case 'N,F0,BW'
        % 48 50
        set(this, 'FrequencyConstraints', 'Center frequency and bandwidth', 'MagnitudeConstraints', 'Unconstrained', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW));
        % 51 55
        % 52 55
        % 53 55
    case 'N,F0,BW,Ap'
        % 54 56
        set(this, 'FrequencyConstraints', 'Center frequency and bandwidth', 'MagnitudeConstraints', 'Passband ripple', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'Apass', num2str(hfdesign.Apass));
        % 57 62
        % 58 62
        % 59 62
        % 60 62
    case 'N,F0,BW,Ast'
        % 61 63
        set(this, 'FrequencyConstraints', 'Center frequency and bandwidth', 'MagnitudeConstraints', 'Stopband attenuation', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'Astop', num2str(hfdesign.Astop));
        % 64 69
        % 65 69
        % 66 69
        % 67 69
    case 'N,F0,BW,Ap,Ast'
        % 68 70
        set(this, 'FrequencyConstraints', 'Center frequency and bandwidth', 'MagnitudeConstraints', 'Passband ripple and stopband attenuation', 'F0', num2str(hfdesign.F0), 'BW', num2str(hfdesign.BW), 'Apass', num2str(hfdesign.Apass), 'Astop', num2str(hfdesign.Astop));
        % 70 77
        % 71 77
        % 72 77
        % 73 77
        % 74 77
        % 75 77
    end % switch
    % 77 79
    abstract_setGUI(this, Hd);
