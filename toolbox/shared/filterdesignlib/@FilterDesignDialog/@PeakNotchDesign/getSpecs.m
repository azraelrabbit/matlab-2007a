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
    specs.Response = get(this, 'ResponseType');
    % 14 16
    specs.Scale = strcmpi(this.Scale, 'on');
    specs.ForceLeadingNumerator = strcmpi(this.ForceLeadingNumerator, 'on');
    % 17 19
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
    % 20 22
    specs.Order = evaluatevars(source.Order);
    specs.F0 = getnum(source, 'F0');
    % 23 25
    switch lower(getSpecification(this, source))
    case 'n,f0,q'
        specs.Q = evaluatevars(source.Q);
    case 'n,f0,q,ap'
        specs.Q = evaluatevars(source.Q);
        specs.Apass = evaluatevars(source.Apass);
    case 'n,f0,q,ast'
        specs.Q = evaluatevars(source.Q);
        specs.Astop = evaluatevars(source.Astop);
    case 'n,f0,q,ap,ast'
        specs.Q = evaluatevars(source.Q);
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop = evaluatevars(source.Astop);
    case 'n,f0,bw'
        specs.BW = getnum(source, 'BW');
    case 'n,f0,bw,ap'
        specs.BW = getnum(source, 'BW');
        specs.Apass = evaluatevars(source.Apass);
    case 'n,f0,bw,ast'
        specs.BW = getnum(source, 'BW');
        specs.Astop = evaluatevars(source.Astop);
    case 'n,f0,bw,ap,ast'
        specs.BW = getnum(source, 'BW');
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop = evaluatevars(source.Astop);
    otherwise
        disp(sprintf('Finish %s', spec));
    end
end
function value = getnum(source, prop)
    % 54 57
    % 55 57
    value = source.(prop);
    value = evaluatevars(value);
    % 58 60
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
