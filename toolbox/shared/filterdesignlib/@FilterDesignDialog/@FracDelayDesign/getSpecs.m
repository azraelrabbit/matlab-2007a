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
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
    specs.FracDelay = evaluatevars(source.FracDelay);
    specs.Order = evaluatevars(source.Order);
end
function value = getnum(source, prop)
    % 19 22
    % 20 22
    value = source.(prop);
    value = evaluatevars(value);
    % 23 25
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
