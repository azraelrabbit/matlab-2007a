function this = loadobj(s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    this = feval(s.class, 'OperatingMode', s.OperatingMode);
    % 8 11
    % 9 11
    this.VariableName = s.VariableName;
    this.ImpulseResponse = s.ImpulseResponse;
    this.OrderMode = s.OrderMode;
    this.Order = s.Order;
    this.FilterType = s.FilterType;
    this.Factor = s.Factor;
    this.FrequencyUnits = s.FrequencyUnits;
    this.InputSampleRate = s.InputSampleRate;
    this.MagnitudeUnits = s.MagnitudeUnits;
    this.LastAppliedState = s.LastAppliedState;
    this.LastAppliedSpecs = s.LastAppliedSpecs;
    this.LastAppliedDesignOpts = s.LastAppliedDesignOpts;
    % 22 24
    this.thisloadobj(s);
    % 24 27
    % 25 27
    this.DesignMethod = s.DesignMethod;
    this.Structure = s.Structure;
    this.Scale = s.Scale;
    % 29 31
    loadDesignOptions(this, s);
    % 31 33
    if ~(strcmpi(this.OperatingMode, 'simulink'))
        hFixedPoint = s.FixedPoint;
        if ishandle(s)
            hFixedPoint = copy(hFixedPoint);
        end
        this.FixedPoint = hFixedPoint;
    end
end
function loadDesignOptions(this, s)
    % 41 44
    % 42 44
    hfd = get(this, 'FDesign');
    if isempty(hfd)
        set(this, 'DesignOptionsCache', s);
    else
        % 47 49
        fn = fieldnames(s);
        for indx=1.0:length(fn)
            % 50 54
            % 51 54
            % 52 54
            if isfield(s, fn{indx}) && isprop(this, fn{indx})
                this.(fn{indx}) = s.(fn{indx});
            end
        end % for
    end
end
