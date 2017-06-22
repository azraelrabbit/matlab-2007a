function [success, msg] = setupFDesign(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    success = true;
    msg = '';
    % 9 11
    hd = get(this, 'FDesign');
    % 11 13
    if isempty(hd)
        return
    end
    % 15 18
    % 16 18
    if strcmpi(this.ResponseType, 'amplitudes')
        if ~(isa(hd, 'fdesign.arbmag'))
            hd = fdesign.arbmag;
            set(this, 'FDesign', hd);
        end
    else
        if ~(isa(hd, 'fdesign.arbmagnphase'))
            hd = fdesign.arbmagnphase;
            set(this, 'FDesign', hd);
        end
    end
    % 28 30
    if gt(nargin, 1.0) && ~(isempty(varargin{1.0}))
        source = varargin{1.0};
    else
        source = this;
    end
    % 34 36
    spec = getSpecification(this, source);
    % 36 38
    set(hd, 'Specification', spec);
    % 38 40
    if isprop(hd, 'NBands')
        set(hd, 'NBands', plus(source.NumberOfBands, 1.0));
    end
    % 42 46
    % 43 46
    % 44 46
    try
        specs = getSpecs(this, source);
        % 47 49
        if strncmpi(specs.FrequencyUnits, 'normalized', 10.0)
            normalizefreq(hd);
        else
            normalizefreq(hd, false, specs.InputSampleRate);
        end
        % 53 55
        switch spec
        case 'N,F,A'
            setspecs(hd, specs.Order, specs.Band1.Frequencies, specs.Band1.Amplitudes);
        case 'Nb,Na,F,A'
            setspecs(hd, specs.Order, specs.DenominatorOrder, specs.Band1.Frequencies, specs.Band1.Amplitudes);
        case 'N,B,F,A'
            % 60 63
            % 61 63
            inputs = cell(1.0, plus(2.0, mtimes(2.0, specs.NumberOfBands)));
            inputs{1.0} = specs.Order;
            inputs{2.0} = specs.NumberOfBands;
            for indx=1.0:specs.NumberOfBands
                band_str = sprintf('Band%d', indx);
                inputs{plus(mtimes(2.0, indx), 1.0)} = specs.(band_str).Frequencies;
                inputs{plus(mtimes(2.0, indx), 2.0)} = specs.(band_str).Amplitudes;
            end % for
            setspecs(hd, inputs{:});
        case 'Nb,Na,B,F,A'
            % 72 75
            % 73 75
            inputs = cell(1.0, plus(3.0, mtimes(2.0, specs.NumberOfBands)));
            inputs{1.0} = specs.Order;
            inputs{2.0} = specs.DenominatorOrder;
            inputs{3.0} = specs.NumberOfBands;
            for indx=1.0:specs.NumberOfBands
                band_str = sprintf('Band%d', indx);
                inputs{plus(mtimes(2.0, indx), 2.0)} = specs.(band_str).Frequencies;
                inputs{plus(mtimes(2.0, indx), 3.0)} = specs.(band_str).Amplitudes;
            end % for
            setspecs(hd, inputs{:});
        case 'N,F,H'
            inputs = cellhorzcat(specs.Order, specs.Band1.Frequencies, specs.Band1.FreqResp);
            setspecs(hd, inputs{:});
        case 'Nb,Na,F,H'
            inputs = cellhorzcat(specs.Order, specs.DenominatorOrder, specs.Band1.Frequencies, specs.Band1.FreqResp);
            % 89 91
            setspecs(hd, inputs{:});
        case 'N,B,F,H'
            % 92 94
            inputs = cell(1.0, plus(2.0, mtimes(2.0, specs.NumberOfBands)));
            % 94 96
            inputs{1.0} = specs.Order;
            inputs{2.0} = specs.NumberOfBands;
            for indx=1.0:specs.NumberOfBands
                inputs{plus(mtimes(2.0, indx), 1.0)} = specs.(sprintf('Band%d', indx)).Frequencies;
                inputs{plus(mtimes(2.0, indx), 2.0)} = specs.(sprintf('Band%d', indx)).FreqResp;
            end % for
            setspecs(hd, inputs{:});
        case 'Nb,Na,B,F,H'
            % 103 106
            % 104 106
            inputs = cell(1.0, plus(3.0, mtimes(2.0, specs.NumberOfBands)));
            inputs{1.0} = specs.Order;
            inputs{2.0} = specs.DenominatorOrder;
            inputs{3.0} = specs.NumberOfBands;
            % 109 111
            for indx=1.0:specs.NumberOfBands
                inputs{plus(mtimes(2.0, indx), 2.0)} = specs.(sprintf('Band%d', indx)).Frequencies;
                inputs{plus(mtimes(2.0, indx), 3.0)} = specs.(sprintf('Band%d', indx)).FreqResp;
            end % for
            setspecs(hd, inputs{:});
        otherwise
            disp(sprintf('Finish %s', spec));
        end
    catch
        success = false;
        msg = cleanerrormsg(lasterr);
        lasterr('');
    end % try
end
