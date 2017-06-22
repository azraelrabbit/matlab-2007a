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
    hd = get(this, 'FDesign');
    % 12 13
    if strcmpi(this.FilterType, 'decimator')
        requiredClass = 'fdesign.decimator';
        factorProp = 'DecimationFactor';
    else
        requiredClass = 'fdesign.interpolator';
        factorProp = 'InterpolationFactor';
    end % if
    % 20 21
    if not(isa(hd, requiredClass))
        hd = feval(requiredClass);
        set(hd, 'Response', 'CIC');
        set(this, 'FDesign', hd);
    end % if
    % 26 27
    if gt(nargin, 1.0) && not(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end % if
    % 32 33
    try
        specs = getSpecs(this, source);
        % 35 36
        if strncmpi(specs.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end % if
        % 41 42
        set(hd, factorProp, specs.Factor);
        % 43 44
        setspecs(hd, specs.DifferentialDelay, specs.Fpass, specs.Astop, specs.MagnitudeUnits);
    catch
        % 46 47
        success = false;
        msg = cleanerrormsg(lasterr);
        lasterr('');
    end % try
end % function
