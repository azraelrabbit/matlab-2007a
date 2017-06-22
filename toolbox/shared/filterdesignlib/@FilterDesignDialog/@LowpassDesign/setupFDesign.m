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
        switch spec
        case 'fp,fst,ap,ast'
            setspecs(hd, specs.Fpass, specs.Fstop, specs.Apass, specs.Astop, specs.MagnitudeUnits);
        case 'n,f3db'
            % 38 39
            setspecs(hd, specs.Order, specs.F3dB);
        case 'n,f3db,ap'
            setspecs(hd, specs.Order, specs.F3dB, specs.Apass, specs.MagnitudeUnits);
        case 'n,f3db,ap,ast'
            setspecs(hd, specs.Order, specs.F3dB, specs.Apass, specs.Astop, specs.MagnitudeUnits);
        case 'n,f3db,ast'
            % 45 46
            setspecs(hd, specs.Order, specs.F3dB, specs.Astop, specs.MagnitudeUnits);
        case 'n,f3db,fst'
            setspecs(hd, specs.Order, specs.F3dB, specs.Fstop);
        case 'n,fc'
            setspecs(hd, specs.Order, specs.F6dB);
        case 'n,fc,ap,ast'
            setspecs(hd, specs.Order, specs.F6dB, specs.Apass, specs.Astop, specs.MagnitudeUnits);
        case 'n,fp,ap'
            % 54 55
            setspecs(hd, specs.Order, specs.Fpass, specs.Apass, specs.MagnitudeUnits);
        case 'n,fp,ap,ast'
            setspecs(hd, specs.Order, specs.Fpass, specs.Apass, specs.Astop, specs.MagnitudeUnits);
        case 'n,fp,f3db'
            % 59 60
            setspecs(hd, specs.Order, specs.Fpass, specs.F3dB);
        case 'n,fp,fst'
            setspecs(hd, specs.Order, specs.Fpass, specs.Fstop);
        case 'n,fp,fst,ap'
            setspecs(hd, specs.Order, specs.Fpass, specs.Fstop, specs.Apass, specs.MagnitudeUnits);
        case 'n,fp,fst,ast'
            % 66 67
            setspecs(hd, specs.Order, specs.Fpass, specs.Fstop, specs.Astop, specs.MagnitudeUnits);
        case 'n,fst,ap,ast'
            % 69 70
            setspecs(hd, specs.Order, specs.Fstop, specs.Apass, specs.Astop, specs.MagnitudeUnits);
        case 'n,fst,ast'
            % 72 73
            setspecs(hd, specs.Order, specs.Fstop, specs.Astop, specs.MagnitudeUnits);
        otherwise
            disp(sprintf('Finish %s', spec));
        end % switch
    catch
        success = false;
        msg = lasterr;
        lasterr('');
    end % try
end % function
