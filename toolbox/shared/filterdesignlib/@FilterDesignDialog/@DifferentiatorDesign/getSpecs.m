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
    switch lower(getSpecification(this, source))
    case 'fp,fst,ap,ast'
        specs.Fpass = getnum(source, 'Fpass');
        specs.Fstop = getnum(source, 'Fstop');
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop = evaluatevars(source.Astop);
        specs.MagnitudeUnits = source.MagnitudeUnits;
    case 'ap'
        specs.Apass = evaluatevars(source.Apass);
        specs.MagnitudeUnits = source.MagnitudeUnits;
    case 'n,fp,fst'
        specs.Order = evaluatevars(source.Order);
        specs.Fpass = getnum(source, 'Fpass');
        specs.Fstop = getnum(source, 'Fstop');
    case 'n'
        specs.Order = evaluatevars(source.Order);
    otherwise
        disp(sprintf('Finish %s', spec));
    end
end
function value = getnum(source, prop)
    % 40 43
    % 41 43
    value = source.(prop);
    value = evaluatevars(value);
    % 44 46
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
        % 48 50
    end
end
