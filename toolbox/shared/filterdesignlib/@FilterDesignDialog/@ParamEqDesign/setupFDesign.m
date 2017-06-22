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
        % 33 35
        % 34 35
        switch lower(spec)
        case 'f0,bw,bwp,gref,g0,gbw,gp'
            setspecs(hd, specs.F0, specs.BW, specs.BWpass, specs.Gref, specs.G0, specs.GBW, specs.Gpass);
        case 'f0,bw,bwst,gref,g0,gbw,gst'
            % 39 40
            setspecs(hd, specs.F0, specs.BW, specs.BWstop, specs.Gref, specs.G0, specs.GBW, specs.Gstop);
        case 'f0,bw,bwp,gref,g0,gbw,gp,gst'
            % 42 43
            setspecs(hd, specs.F0, specs.BW, specs.BWpass, specs.Gref, specs.G0, specs.GBW, specs.Gpass, specs.Gstop);
        case 'n,f0,bw,gref,g0,gbw'
            % 45 46
            setspecs(hd, specs.Order, specs.F0, specs.BW, specs.Gref, specs.G0, specs.GBW);
        case 'n,f0,bw,gref,g0,gbw,gp'
            % 48 49
            setspecs(hd, specs.Order, specs.F0, specs.BW, specs.Gref, specs.G0, specs.GBW, specs.Gpass);
        case 'n,f0,bw,gref,g0,gbw,gst'
            % 51 52
            setspecs(hd, specs.Order, specs.F0, specs.BW, specs.Gref, specs.G0, specs.GBW, specs.Gstop);
        case 'n,f0,bw,gref,g0,gbw,gp,gst'
            % 54 55
            setspecs(hd, specs.Order, specs.F0, specs.BW, specs.Gref, specs.G0, specs.GBW, specs.Gpass, specs.Gstop);
        case 'n,flow,fhigh,gref,g0,gbw'
            % 57 58
            setspecs(hd, specs.Order, specs.Flow, specs.Fhigh, specs.Gref, specs.G0, specs.GBW);
        case 'n,flow,fhigh,gref,g0,gbw,gp'
            % 60 61
            setspecs(hd, specs.Order, specs.Flow, specs.Fhigh, specs.Gref, specs.G0, specs.GBW, specs.Gpass);
        case 'n,flow,fhigh,gref,g0,gbw,gst'
            % 63 64
            setspecs(hd, specs.Order, specs.Flow, specs.Fhigh, specs.Gref, specs.G0, specs.GBW, specs.Gstop);
        case 'n,flow,fhigh,gref,g0,gbw,gp,gst'
            % 66 67
            setspecs(hd, specs.Order, specs.Flow, specs.Fhigh, specs.Gref, specs.G0, specs.GBW, specs.Gpass, specs.Gstop);
        otherwise
            % 69 70
            disp(sprintf('Finish %s', spec));
        end % switch
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
        lasterr('');
    end % try
end % function
