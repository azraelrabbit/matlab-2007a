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
    specs.Scale = strcmpi(this.Scale, 'on');
    specs.ForceLeadingNumerator = strcmpi(this.ForceLeadingNumerator, 'on');
    % 15 17
    specs.FrequencyUnits = source.FrequencyUnits;
    specs.InputSampleRate = getnum(source, 'InputSampleRate');
    % 18 20
    specs.Gref = evaluatevars(source.Gref);
    specs.G0 = evaluatevars(source.G0);
    specs.GBW = evaluatevars(source.GBW);
    % 22 24
    spec = getSpecification(this, source);
    % 24 26
    switch lower(spec)
    case 'f0,bw,bwp,gref,g0,gbw,gp'
        specs.F0 = getnum(source, 'F0');
        specs.BW = getnum(source, 'BW');
        specs.BWpass = getnum(source, 'BWpass');
        specs.Gpass = evaluatevars(source.Gpass);
    case 'f0,bw,bwst,gref,g0,gbw,gst'
        specs.F0 = getnum(source, 'F0');
        specs.BW = getnum(source, 'BW');
        specs.BWstop = getnum(source, 'BWstop');
        specs.Gstop = evaluatevars(source.Gstop);
    case 'f0,bw,bwp,gref,g0,gbw,gp,gst'
        specs.F0 = getnum(source, 'F0');
        specs.BW = getnum(source, 'BW');
        specs.BWpass = getnum(source, 'BWpass');
        specs.Gpass = evaluatevars(source.Gpass);
        specs.Gstop = evaluatevars(source.Gstop);
    case 'n,f0,bw,gref,g0,gbw'
        specs.Order = evaluatevars(source.Order);
        specs.F0 = getnum(source, 'F0');
        specs.BW = getnum(source, 'BW');
    case 'n,f0,bw,gref,g0,gbw,gp'
        specs.Order = evaluatevars(source.Order);
        specs.F0 = getnum(source, 'F0');
        specs.BW = getnum(source, 'BW');
        specs.Gpass = evaluatevars(source.Gpass);
    case 'n,f0,bw,gref,g0,gbw,gst'
        specs.Order = evaluatevars(source.Order);
        specs.F0 = getnum(source, 'F0');
        specs.BW = getnum(source, 'BW');
        specs.Gpass = evaluatevars(source.Gpass);
        specs.Gstop = evaluatevars(source.Gstop);
    case 'n,f0,bw,gref,g0,gbw,gp,gst'
        specs.Order = evaluatevars(source.Order);
        specs.F0 = getnum(source, 'F0');
        specs.BW = getnum(source, 'BW');
        specs.Gpass = evaluatevars(source.Gpass);
        specs.Gstop = evaluatevars(source.Gstop);
    case 'n,flow,fhigh,gref,g0,gbw'
        specs.Order = evaluatevars(source.Order);
        specs.Flow = getnum(source, 'Flow');
        specs.Fhigh = getnum(source, 'Fhigh');
    case 'n,flow,fhigh,gref,g0,gbw,gp'
        specs.Order = evaluatevars(source.Order);
        specs.Flow = getnum(source, 'Flow');
        specs.Fhigh = getnum(source, 'Fhigh');
        specs.Gpass = evaluatevars(source.Gpass);
    case 'n,flow,fhigh,gref,g0,gbw,gst'
        specs.Order = evaluatevars(source.Order);
        specs.Flow = getnum(source, 'Flow');
        specs.Fhigh = getnum(source, 'Fhigh');
        specs.Gstop = evaluatevars(source.Gstop);
    case 'n,flow,fhigh,gref,g0,gbw,gp,gst'
        specs.Order = evaluatevars(source.Order);
        specs.Flow = getnum(source, 'Flow');
        specs.Fhigh = getnum(source, 'Fhigh');
        specs.Gpass = evaluatevars(source.Gpass);
        specs.Gstop = evaluatevars(source.Gstop);
    otherwise
        disp(sprintf('Finish %s', spec));
    end
end
function value = getnum(source, prop)
    % 88 91
    % 89 91
    value = source.(prop);
    value = evaluatevars(value);
    % 92 94
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
