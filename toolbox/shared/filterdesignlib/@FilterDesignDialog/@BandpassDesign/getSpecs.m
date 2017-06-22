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
    spec = getSpecification(this, source);
    switch lower(spec)
    case 'fst1,fp1,fp2,fst2,ast1,ap,ast2'
        specs.Fstop1 = getnum(source, 'Fstop1');
        specs.Fpass1 = getnum(source, 'Fpass1');
        specs.Fpass2 = getnum(source, 'Fpass2');
        specs.Fstop2 = getnum(source, 'Fstop2');
        specs.Astop1 = evaluatevars(source.Astop1);
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop2 = evaluatevars(source.Astop2);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,f3db1,f3db2'
        specs.Order = evaluatevars(source.Order);
        specs.F3dB1 = getnum(source, 'F3dB1');
        specs.F3dB2 = getnum(source, 'F3dB2');
    case 'n,f3db1,f3db2,ap'
        specs.Order = evaluatevars(source.Order);
        specs.F3dB1 = getnum(source, 'F3dB1');
        specs.F3dB2 = getnum(source, 'F3dB2');
        specs.Apass = evaluatevars(source.Apass);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,f3db1,f3db2,ast'
        specs.Order = evaluatevars(source.Order);
        specs.F3dB1 = getnum(source, 'F3dB1');
        specs.F3dB2 = getnum(source, 'F3dB2');
        specs.Astop1 = evaluatevars(source.Astop1);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,f3db1,f3db2,ast1,ap,ast2'
        specs.Order = evaluatevars(source.Order);
        specs.F3dB1 = getnum(source, 'F3dB1');
        specs.F3dB2 = getnum(source, 'F3dB2');
        specs.Astop1 = evaluatevars(source.Astop1);
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop2 = evaluatevars(source.Astop2);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,f3db1,f3db2,bwp'
        specs.Order = evaluatevars(source.Order);
        specs.F3dB1 = getnum(source, 'F3dB1');
        specs.F3dB2 = getnum(source, 'F3dB2');
        specs.BWpass = getnum(source, 'BWpass');
    case 'n,f3db1,f3db2,bws'
        specs.Order = evaluatevars(source.Order);
        specs.F3dB1 = getnum(source, 'F3dB1');
        specs.F3dB2 = getnum(source, 'F3dB2');
        specs.BWstop = getnum(source, 'BWstop');
    case 'n,fc1,fc2'
        specs.Order = evaluatevars(source.Order);
        specs.F6dB1 = getnum(source, 'F6dB1');
        specs.F6dB2 = getnum(source, 'F6dB2');
    case 'n,fp1,fp2,ap'
        specs.Order = evaluatevars(source.Order);
        specs.Fpass1 = getnum(source, 'Fpass1');
        specs.Fpass2 = getnum(source, 'Fpass2');
        specs.Apass = evaluatevars(source.Apass);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,fp1,fp2,ast1,ap,ast2'
        specs.Order = evaluatevars(source.Order);
        specs.Fpass1 = getnum(source, 'Fpass1');
        specs.Fpass2 = getnum(source, 'Fpass2');
        specs.Astop1 = evaluatevars(source.Astop1);
        specs.Apass = evaluatevars(source.Apass);
        specs.Astop2 = evaluatevars(source.Astop2);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,fst1,fp1,fp2,fst2'
        specs.Order = evaluatevars(source.Order);
        specs.Fstop1 = getnum(source, 'Fstop1');
        specs.Fpass1 = getnum(source, 'Fpass1');
        specs.Fpass2 = getnum(source, 'Fpass2');
        specs.Fstop2 = getnum(source, 'Fstop2');
    case 'n,fst1,fp1,fp2,fst2,ap'
        specs.Order = evaluatevars(source.Order);
        specs.Fstop1 = getnum(source, 'Fstop1');
        specs.Fpass1 = getnum(source, 'Fpass1');
        specs.Fpass2 = getnum(source, 'Fpass2');
        specs.Fstop2 = getnum(source, 'Fstop2');
        specs.Apass = evaluatevars(source.Apass);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    case 'n,fst1,fst2,ast'
        specs.Order = evaluatevars(source.Order);
        specs.Fstop1 = getnum(source, 'Fstop1');
        specs.Fstop2 = getnum(source, 'Fstop2');
        specs.Astop1 = evaluatevars(source.Astop1);
        specs.MagnitudeUnits = this.MagnitudeUnits;
    otherwise
        disp(sprintf('Finish %s', spec));
    end
end
function value = getnum(source, prop)
    % 109 113
    % 110 113
    % 111 113
    value = source.(prop);
    value = evaluatevars(value);
    % 114 116
    funits = source.FrequencyUnits;
    if ~(strncmpi(funits, 'normalized', 10.0))
        value = convertfrequnits(value, funits, 'Hz');
    end
end
