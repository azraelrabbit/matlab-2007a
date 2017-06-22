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
    specs.Band = {};
    specs.MagnitudeUnits = this.MagnitudeUnits;
    % 18 20
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
    % 21 23
    spec = lower(getSpecification(this, source));
    % 23 25
    switch spec
    case 'tw,ast'
        specs.TransitionWidth = getnum(source, 'TransitionWidth');
        specs.Astop = evaluatevars(source.Astop);
    case 'n,tw'
        specs.Order = evaluatevars(source.Order);
        specs.TransitionWidth = getnum(source, 'TransitionWidth');
    case 'n'
        specs.Order = evaluatevars(source.Order);
    case 'n,ast'
        specs.Order = evaluatevars(source.Order);
        specs.Astop = evaluatevars(source.Astop);
    otherwise
        disp(sprintf('Finish %s', spec));
    end
end
function value = getnum(source, prop)
    % 41 44
    % 42 44
    value = source.(prop);
    value = evaluatevars(value);
    % 45 47
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
