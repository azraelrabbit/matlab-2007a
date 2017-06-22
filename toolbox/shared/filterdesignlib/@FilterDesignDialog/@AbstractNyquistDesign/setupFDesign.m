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
    if isempty(hd)
        return;
    end % if
    % 16 17
    if gt(nargin, 1.0) && not(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end % if
    % 22 23
    spec = getSpecification(this, source);
    set(hd, 'Specification', spec);
    % 25 26
    try
        specs = getSpecs(this, source);
        % 28 29
        if strncmpi(specs.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end % if
        % 34 35
        switch spec
        case 'tw,ast'
            setspecs(hd, specs.Band{:}, specs.TransitionWidth, specs.Astop, specs.MagnitudeUnits);
        case 'n,tw'
            % 39 40
            setspecs(hd, specs.Band{:}, specs.Order, specs.TransitionWidth);
        case 'n'
            setspecs(hd, specs.Band{:}, specs.Order);
        case 'n,ast'
            setspecs(hd, specs.Band{:}, specs.Order, specs.Astop, specs.MagnitudeUnits);
        otherwise
            disp(sprintf('Finish %s', spec));
        end % switch
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
        lasterr('');
    end % try
end % function
