function specs = getSpecs(this, source)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 2.0)
        source = this;
    end
    % 10 12
    specs.FilterType = source.FilterType;
    specs.Factor = evaluatevars(source.Factor);
    specs.Order = evaluatevars(source.Order);
    specs.Scale = strcmpi(source.Scale, 'on');
    specs.F0 = getnum(source, 'F0');
    specs.ForceLeadingNumerator = strcmpi(source.ForceLeadingNumerator, 'on');
    specs.BandsPerOctave = evaluatevars(source.BandsPerOctave);
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
end
function value = getnum(source, prop)
    % 22 26
    % 23 26
    % 24 26
    value = source.(prop);
    value = evaluatevars(value);
    % 27 29
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
