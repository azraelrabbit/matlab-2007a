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
    specs.MagnitudeUnits = this.MagnitudeUnits;
    % 20 22
    specs.Factor = evaluatevars(source.Factor);
    specs.DifferentialDelay = evaluatevars(source.DifferentialDelay);
    specs.Fpass = getnum(source, 'Fpass');
    specs.Astop = evaluatevars(source.Astop);
end
function value = getnum(source, prop)
    % 27 31
    % 28 31
    % 29 31
    value = source.(prop);
    value = evaluatevars(value);
    % 32 34
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
