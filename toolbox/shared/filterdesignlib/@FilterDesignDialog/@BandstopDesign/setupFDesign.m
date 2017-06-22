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
        if strncmpi(specs.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end % if
        % 33 34
        switch spec
        case 'fp1,fst1,fst2,fp2,ap1,ast,ap2'
            setspecs(hd, specs.Fpass1, specs.Fstop1, specs.Fstop2, specs.Fpass2, specs.Apass1, specs.Astop, specs.Apass2, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2'
            % 38 39
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2);
        case 'n,f3db1,f3db2,ap'
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.Apass1, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2,ap,ast'
            % 43 44
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.Apass1, specs.Astop, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2,ast'
            % 46 47
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.Astop, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2,bwp'
            % 49 50
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.BWpass);
        case 'n,f3db1,f3db2,bws'
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.BWstop);
        case 'n,fc1,fc2'
            setspecs(hd, specs.Order, specs.F6dB1, specs.F6dB2);
        case 'n,fp1,fp2,ap'
            setspecs(hd, specs.Order, specs.Fpass1, specs.Fpass2, specs.Apass1, specs.MagnitudeUnits);
        case 'n,fp1,fp2,ap,ast'
            % 58 59
            setspecs(hd, specs.Order, specs.Fpass1, specs.Fpass2, specs.Apass1, specs.Astop, specs.MagnitudeUnits);
        case 'n,fp1,fst1,fst2,fp2'
            % 61 62
            setspecs(hd, specs.Order, specs.Fpass1, specs.Fstop1, specs.Fstop2, specs.Fpass2);
        case 'n,fp1,fst1,fst2,fp2,ap'
            % 64 65
            setspecs(hd, specs.Order, specs.Fpass1, specs.Fstop1, specs.Fstop2, specs.Fpass2, specs.Apass1, specs.MagnitudeUnits);
        case 'n,fst1,fst2,ast'
            % 67 68
            setspecs(hd, specs.Order, specs.Fstop1, specs.Fstop2, specs.Astop, specs.MagnitudeUnits);
        otherwise
            % 70 71
            disp(sprintf('Finish %s', spec));
        end % switch
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
        lasterr('');
    end % try
end % function
