function [success, msg] = setupFDesign(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    success = true;
    msg = false;
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
        if strncmpi(source.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end % if
        % 32 33
        switch spec
        case 'fp,fst,ap,ast'
            setspecs(hd, specs.Fpass, specs.Fstop, specs.Apass, specs.Astop, specs.MagnitudeUnits);
        case 'n'
            % 37 38
            setspecs(hd, specs.Order);
        case 'n,fp,fst'
            setspecs(hd, specs.Order, specs.Fpass, specs.Fstop);
        case 'ap'
            setspecs(hd, specs.Apass, specs.MagnitudeUnits);
        otherwise
            disp(sprintf('Finish %s', spec));
        end % switch
    catch
        success = false;
        msg = lasterr;
        lasterr('');
    end % try
end % function
