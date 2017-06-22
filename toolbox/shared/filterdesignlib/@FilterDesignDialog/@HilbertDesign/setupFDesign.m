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
    spec = getSpecification(this, varargin{:});
    % 14 15
    set(hd, 'Specification', spec);
    % 16 17
    if gt(nargin, 1.0) && not(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end % if
    % 22 23
    try
        specs = getSpecs(this, source);
        % 25 26
        if strncmpi(specs.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end % if
        % 31 32
        switch lower(spec)
        case 'n,tw'
            setspecs(hd, specs.Order, specs.TransitionWidth);
        case 'tw,ap'
            setspecs(hd, specs.TransitionWidth, specs.Apass, specs.MagnitudeUnits);
        end % switch
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
        lasterr('');
    end % try
end % function
