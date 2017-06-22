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
    specs.Scale = strcmpi(this.Scale, 'on');
    specs.ForceLeadingNumerator = strcmpi(this.ForceLeadingNumerator, 'on');
    % 17 19
    specs.Band = cellhorzcat(evaluatevars(source.Band));
    specs.MagnitudeUnits = this.MagnitudeUnits;
    % 20 22
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
    % 23 25
    spec = lower(getSpecification(this, source));
    % 25 27
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
    % 43 47
    % 44 47
    % 45 47
    value = source.(prop);
    value = evaluatevars(value);
    % 48 50
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
