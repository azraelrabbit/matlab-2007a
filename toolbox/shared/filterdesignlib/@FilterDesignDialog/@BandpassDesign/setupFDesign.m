function [success, msg] = setupFDesign(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    success = true;
    msg = '';
    % 9 11
    hd = get(this, 'FDesign');
    % 11 13
    spec = getSpecification(this, varargin{:});
    % 13 15
    set(hd, 'Specification', spec);
    % 15 17
    if gt(nargin, 1.0) && ~(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end
    % 21 25
    % 22 25
    % 23 25
    try
        specs = getSpecs(this, source);
        % 26 28
        if strncmpi(specs.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end
        % 32 34
        switch spec
        case 'fst1,fp1,fp2,fst2,ast1,ap,ast2'
            setspecs(hd, specs.Fstop1, specs.Fpass1, specs.Fpass2, specs.Fstop2, specs.Astop1, specs.Apass, specs.Astop2, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2'
            % 37 39
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2);
        case 'n,f3db1,f3db2,ap'
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.Apass, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2,ast'
            % 42 44
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.Astop1, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2,ast1,ap,ast2'
            % 45 47
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.Astop1, specs.Apass, specs.Astop2, specs.MagnitudeUnits);
        case 'n,f3db1,f3db2,bwp'
            % 48 50
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.BWpass);
        case 'n,f3db1,f3db2,bws'
            setspecs(hd, specs.Order, specs.F3dB1, specs.F3dB2, specs.BWstop);
        case 'n,fc1,fc2'
            setspecs(hd, specs.Order, specs.F6dB1, specs.F6dB2);
        case 'n,fp1,fp2,ap'
            setspecs(hd, specs.Order, specs.Fpass1, specs.Fpass2, specs.Apass, specs.MagnitudeUnits);
        case 'n,fp1,fp2,ast1,ap,ast2'
            % 57 59
            setspecs(hd, specs.Order, specs.Fpass1, specs.Fpass2, specs.Astop1, specs.Apass, specs.Astop2, specs.MagnitudeUnits);
        case 'n,fst1,fp1,fp2,fst2'
            % 60 62
            setspecs(hd, specs.Order, specs.Fstop1, specs.Fpass1, specs.Fpass2, specs.Fstop2);
        case 'n,fst1,fp1,fp2,fst2,ap'
            % 63 65
            setspecs(hd, specs.Order, specs.Fstop1, specs.Fpass1, specs.Fpass2, specs.Fstop2, specs.Apass, specs.MagnitudeUnits);
        case 'n,fst1,fst2,ast'
            % 66 68
            setspecs(hd, specs.Order, specs.Fstop1, specs.Fstop2, specs.Astop1, specs.MagnitudeUnits);
        otherwise
            % 69 71
            disp(sprintf('Finish %s', spec));
        end
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
        lasterr('');
    end % try
end
function value = getnum(source, prop)
    % 79 82
    % 80 82
    value = source.(prop);
    value = evaluatevars(value);
    % 83 85
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
