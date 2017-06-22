function specs = getSpecs(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if gt(nargin, 1.0) && ~(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end
    % 12 14
    specs.FilterType = source.FilterType;
    specs.Factor = evaluatevars(source.Factor);
    % 15 17
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
    % 18 20
    spec = lower(getSpecification(this, source));
    % 20 22
    switch spec
    case 'fp,fst,ap,ast'
        specs.Fpass = getnum(source, 'Fpass');
        specs.Fstop = getnum(source, 'Fstop');
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop = evaluatevars(source.Astop);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,fc,ap,ast'
        specs.Order = evaluatevars(source.Order);
        specs.F6dB = getnum(source, 'F6dB');
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop = evaluatevars(source.Astop);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,fp,ap,ast'
        specs.Order = evaluatevars(source.Order);
        specs.Fpass = getnum(source, 'Fpass');
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop = evaluatevars(source.Astop);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,fp,fst'
        specs.Order = evaluatevars(source.Order);
        specs.Fpass = getnum(source, 'Fpass');
        specs.Fstop = getnum(source, 'Fstop');
    case 'n,fst,ap,ast'
        specs.Order = evaluatevars(source.Order);
        specs.Fstop = getnum(source, 'Fstop');
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop = evaluatevars(source.Astop);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,fst,ast'
        specs.Order = evaluatevars(source.Order);
        specs.Fstop = getnum(source, 'Fstop');
        specs.Astop = evaluatevars(source.Astop);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    otherwise
        disp(sprintf('Finish %s', spec));
    end
end
function value = getnum(source, prop)
    % 60 63
    % 61 63
    value = source.(prop);
    value = evaluatevars(value);
    % 64 66
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
