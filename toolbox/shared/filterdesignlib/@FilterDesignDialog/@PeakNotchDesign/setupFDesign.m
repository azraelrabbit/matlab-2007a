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
    if gt(nargin, 1.0) && not(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end % if
    % 18 19
    spec = getSpecification(this, source);
    % 20 21
    set(hd, 'Specification', spec);
    % 22 25
    % 23 25
    % 24 25
    try
        specs = getSpecs(this, source);
        % 27 28
        if strncmpi(source.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end % if
        % 33 34
        switch lower(getSpecification(this, source))
        case 'n,f0,q'
            setspecs(hd, specs.Order, specs.F0, specs.Q);
        case 'n,f0,q,ap'
            setspecs(hd, specs.Order, specs.F0, specs.Q, specs.Apass);
        case 'n,f0,q,ast'
            setspecs(hd, specs.Order, specs.F0, specs.Q, specs.Astop);
        case 'n,f0,q,ap,ast'
            setspecs(hd, specs.Order, specs.F0, specs.Q, specs.Apass, specs.Astop);
        case 'n,f0,bw'
            setspecs(hd, specs.Order, specs.F0, specs.BW);
        case 'n,f0,bw,ap'
            setspecs(hd, specs.Order, specs.F0, specs.BW, specs.Apass);
        case 'n,f0,bw,ast'
            setspecs(hd, specs.Order, specs.F0, specs.BW, specs.Astop);
        case 'n,f0,bw,ap,ast'
            setspecs(hd, specs.Order, specs.F0, specs.BW, specs.Apass, specs.Astop);
        otherwise
            disp(sprintf('Finish %s', spec));
        end % switch
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
    end % try
end % function
