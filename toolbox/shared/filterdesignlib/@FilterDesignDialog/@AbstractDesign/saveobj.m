function s = saveobj(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    s.class = this.class;
    % 8 10
    s.OperatingMode = this.OperatingMode;
    s.VariableName = this.VariableName;
    s.ImpulseResponse = this.ImpulseResponse;
    s.OrderMode = this.OrderMode;
    s.Order = this.Order;
    s.FilterType = this.FilterType;
    s.Factor = this.Factor;
    s.FrequencyUnits = this.FrequencyUnits;
    s.InputSampleRate = this.InputSampleRate;
    s.MagnitudeUnits = this.MagnitudeUnits;
    s.LastAppliedState = this.LastAppliedState;
    s.LastAppliedSpecs = this.LastAppliedSpecs;
    s.LastAppliedDesignOpts = this.LastAppliedDesignOpts;
    % 22 24
    s = thissaveobj(this, s);
    % 24 27
    % 25 27
    s.DesignMethod = this.DesignMethod;
    s.Structure = this.Structure;
    s.Scale = this.Scale;
    % 29 31
    s.DesignOptionsCache = saveDesignOptions(this);
    % 31 33
    s.FixedPoint = this.FixedPoint;
end
function s = saveDesignOptions(this)
    % 35 38
    % 36 38
    hfd = get(this, 'FDesign');
    % 38 40
    if isempty(hfd)
        s = this.DesignOptionsCache;
    else
        % 42 44
        optstruct = designoptions(this.FDesign, getSimpleMethod(this));
        % 44 46
        fn = fieldnames(optstruct);
        % 46 49
        % 47 49
        fn = fn(1.0:mrdivide(length(fn), 2.0));
        % 49 52
        % 50 52
        fn = setdiff(fn, {'FilterStructure','SOSScaleNorm','SOSScaleOpts'});
        % 52 54
        if isempty(fn)
            s = [];
        else
            % 56 58
            for indx=1.0:length(fn)
                s.(fn{indx}) = this.(fn{indx});
            end % for
        end
    end
end
