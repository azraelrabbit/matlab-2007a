function s = thissaveobj(this, s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    s.Fstop = this.Fstop;
    s.F6dB = this.F6dB;
    s.F3dB = this.F3dB;
    s.Fpass = this.Fpass;
    s.Astop = this.Astop;
    s.Apass = this.Apass;
    s.FrequencyConstraints = this.FrequencyConstraints;
    s.MagnitudeConstraints = this.MagnitudeConstraints;
end % function
