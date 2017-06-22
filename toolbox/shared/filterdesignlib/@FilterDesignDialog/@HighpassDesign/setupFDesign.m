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
    % 22 24
    % 23 24
    try
        specs = getSpecs(this, source);
        % 26 27
        if strncmpi(specs.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end % if
        % 32 33
        switch spec
        case 'fst,fp,ast,ap'
            setspecs(hd, specs.Fstop, specs.Fpass, specs.Astop, specs.Apass, specs.MagnitudeUnits);
        case 'n,f3db'
            % 37 38
            setspecs(hd, specs.Order, specs.F3dB);
        case 'n,f3db,ap'
            setspecs(hd, specs.Order, specs.F3dB, specs.Apass, specs.MagnitudeUnits);
        case 'n,f3db,ast'
            setspecs(hd, specs.Order, specs.F3dB, specs.Astop, specs.MagnitudeUnits);
        case 'n,f3db,ast,ap'
            setspecs(hd, specs.Order, specs.F3dB, specs.Astop, specs.Apass, specs.MagnitudeUnits);
        case 'n,f3db,fp'
            % 46 47
            setspecs(hd, specs.Order, specs.F3dB, specs.Fpass);
        case 'n,fc'
            setspecs(hd, specs.Order, specs.F6dB);
        case 'n,fc,ast,ap'
            setspecs(hd, specs.Order, specs.F6dB, specs.Astop, specs.Apass, specs.MagnitudeUnits);
        case 'n,fp,ap'
            % 53 54
            setspecs(hd, specs.Order, specs.Fpass, specs.Apass, specs.MagnitudeUnits);
        case 'n,fp,ast,ap'
            setspecs(hd, specs.Order, specs.Fpass, specs.Astop, specs.Apass, specs.MagnitudeUnits);
        case 'n,fst,ast'
            % 58 59
            setspecs(hd, specs.Order, specs.Fstop, specs.Astop, specs.MagnitudeUnits);
        case 'n,fst,ast,ap'
            setspecs(hd, specs.Order, specs.Fstop, specs.Astop, specs.Apass, specs.MagnitudeUnits);
        case 'n,fst,f3db'
            % 63 64
            setspecs(hd, specs.Order, specs.Fstop, specs.F3dB);
        case 'n,fst,fp'
            setspecs(hd, specs.Order, specs.Fstop, specs.Fpass);
        case 'n,fst,fp,ap'
            setspecs(hd, specs.Order, specs.Fstop, specs.Fpass, specs.Apass, specs.MagnitudeUnits);
        case 'n,fst,fp,ast'
            % 70 71
            setspecs(hd, specs.Order, specs.Fstop, specs.Fpass, specs.Astop, specs.MagnitudeUnits);
        otherwise
            % 73 74
            disp(sprintf('Finish %s', spec));
        end % switch
    catch
        success = false;
        msg = lasterr;
        lasterr('');
    end % try
end % function
