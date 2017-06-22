function abstract_setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hfdesign = getfdesign(Hd);
    hfmethod = getfmethod(Hd);
    % 9 11
    spec = get(hfdesign, 'Specification');
    % 11 15
    % 12 15
    % 13 15
    if isfir(hfmethod)
        set(this, 'ImpulseResponse', 'FIR');
    else
        set(this, 'ImpulseResponse', 'IIR');
    end
    % 19 22
    % 20 22
    if strncmp(spec, 'Nb', 2.0)
        Nb = get(hfdesign, 'NumOrder');
        Na = get(hfdesign, 'DenOrder');
        % 24 28
        % 25 28
        % 26 28
        if ne(Nb, Na)
            error('filterdesign:filterbuilder:CannotImport', 'Cannot import designs if the numerator and denominator orders do not match.');
            % 29 31
        end
        % 31 33
        set(this, 'OrderMode', 'specify', 'Order', num2str(Nb));
    else
        if isequal(spec(1.0), 'N')
            set(this, 'OrderMode', 'specify', 'Order', num2str(hfdesign.FilterOrder));
        else
            % 37 39
            set(this, 'OrderMode', 'minimum');
        end
    end
    if isa(hfdesign, 'fdesign.decimator')
        set(this, 'FilterType', 'decimator', 'Factor', num2str(hfdesign.DecimationFactor));
    else
        % 44 46
        if isa(hfdesign, 'fdesign.interpolator')
            set(this, 'FilterType', 'interpolator', 'Factor', num2str(hfdesign.InterpolationFactor));
        else
            % 48 50
            if isa(hfdesign, 'fdesign.rsrc')
                set(this, 'FilterType', 'sample-rate converter', 'Factor', num2str(hfdesign.InterpolationFactor), 'SecondFactor', num2str(hfdesign.DecimationFactor));
                % 51 56
                % 52 56
                % 53 56
                % 54 56
            end
        end
    end
    if hfdesign.NormalizedFrequency
        set(this, 'FrequencyUnits', 'normalized');
    else
        % 61 63
        fs = hfdesign.Fs;
        set(this, 'FrequencyUnits', 'Hz', 'InputSampleRate', num2str(fs));
    end
    % 65 68
    % 66 68
    set(this, 'DesignMethod', get(hfmethod, 'DesignAlgorithm'));
    % 68 70
    dopts = designopts(hfmethod);
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    if strcmpi(hfmethod.DesignAlgorithm, 'multistage equiripple')
        cls = hfmethod.FilterStructure;
    else
        cls = getClassName(Hd);
    end
    structure = convertStructure(this, cls);
    set(this, 'Structure', structure);
    % 81 84
    % 82 84
    fn = setdiff(fieldnames(dopts), {'FilterStructure','DesignAlgorithm','SOSScaleNorm','SOSScaleOpts'});
    % 84 86
    for indx=1.0:length(fn)
        value = dopts.(fn{indx});
        if isnumeric(value) && ~(islogical(value))
            value = num2str(value);
        else
            if isa(value, 'function_handle')
                value = func2str(value);
            else
                if iscell(value)
                    if isa(value{1.0}, 'function_handle')
                        value{1.0} = func2str(value{1.0});
                    end
                    if gt(length(value), 1.0)
                        if isnumeric(value{2.0})
                            value{2.0} = mat2str(value{2.0});
                        end
                        % 101 103
                        value = sprintf('{''%s'', %s}', value{:});
                    else
                        value = sprintf('{''%s''}', value{1.0});
                    end
                end
            end
        end
        set(this, fn{indx}, value);
    end % for
    if isfield(dopts, 'SOSScaleNorm') && isempty(dopts.SOSScaleNorm)
        set(this, 'Scale', 'off');
    end
    if isfield(dopts, 'SOSScaleOpts') && isempty(dopts.SOSScaleOpts)
        set(this, 'Scale', 'off');
    end
    % 117 120
    % 118 120
    updateSettings(this.FixedPoint, Hd);
end
function cls = getClassName(Hd)
    % 122 125
    % 123 125
    cls = get(classhandle(Hd), 'Name');
    % 125 127
    switch cls
    case {'cascade','parallel'}
        for indx=1.0:nstages(Hd)
            cls = getClassName(Hd.Stage(indx));
            if ~(isempty(cls))
                return
            end
        end % for
    case 'scalar'
        % 135 137
        cls = '';
    end
end
