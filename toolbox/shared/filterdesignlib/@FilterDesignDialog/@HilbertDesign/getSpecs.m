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
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
    % 20 22
    switch lower(getSpecification(this, source))
    case 'n,tw'
        specs.Order = evaluatevars(source.Order);
        specs.TransitionWidth = getnum(source, 'TransitionWidth');
    case 'tw,ap'
        specs.TransitionWidth = getnum(source, 'TransitionWidth');
        specs.Apass = evaluatevars(source.Apass);
        specs.MagnitudeUnits = source.MagnitudeUnits;
    end
end
function value = getnum(source, prop)
    % 32 36
    % 33 36
    % 34 36
    value = source.(prop);
    value = evaluatevars(value);
    % 37 39
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
