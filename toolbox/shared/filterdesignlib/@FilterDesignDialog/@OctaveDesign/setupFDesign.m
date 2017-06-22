function [success, msg] = setupFDesign(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    success = true;
    msg = '';
    % 10 11
    if gt(nargin, 1.0) && not(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end % if
    % 16 17
    specs = getSpecs(this, source);
    % 18 19
    hfdesign = get(this, 'FDesign');
    % 20 21
    try
        if strncmpi(source.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hfdesign);
        else
            normalizefreq(hfdesign, false, specs.InputSampleRate);
        end % if
        % 27 28
        set(hfdesign, 'FilterOrder', specs.Order, 'BandsPerOctave', specs.BandsPerOctave);
        % 29 33
        % 30 33
        % 31 33
        % 32 33
        vFreqs = validfrequencies(hfdesign);
        % 34 36
        % 35 36
        m = power(10.0, ceil(minus(4.0, log10(vFreqs))));
        rvFreqs = rdivide(round(times(vFreqs, m)), m);
        % 38 39
        indx = find(lt(abs(minus(rvFreqs, specs.F0)), .01));
        % 40 41
        if not(isempty(indx))
            specs.F0 = vFreqs(indx);
        end % if
        % 44 45
        set(hfdesign, 'F0', specs.F0);
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
    end % try
end % function
