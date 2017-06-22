function [TunedBlocks, vportios] = utCreateTunedBlocks(this, mdl, blockdata, opt)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if strcmp(get_param(mdl, 'SimulationStatus'), 'stopped')
        dirty = get_param(mdl, 'Dirty');
        % 12 14
        activeConfig = setNonSimWarningOff(slcontrol.Utilities, mdl);
        feval(mdl, [], [], [], 'lincompile');
        precompiled = false;
    else
        precompiled = true;
    end % if
    % 19 22
    % 20 22
    vportios = handle(NaN(0.0, 1.0));
    % 22 25
    % 23 25
    for ct=numel(blockdata):-1.0:1.0
        block = blockdata(ct).block;
        blockfcn = blockdata(ct).blockfcn;
        % 27 30
        % 28 30
        try
            if strcmp(get_param(block, 'BlockType'), 'SubSystem')
                % 31 33
                parameterdata = get_param(block, 'MaskWSVariables');
                for ct2=length(parameterdata):-1.0:1.0
                    % 34 37
                    % 35 37
                    if isa(parameterdata(ct2).Value, 'double')
                        parameterdata(ct2).Tunable = 'on';
                    else
                        parameterdata(ct2).Tunable = 'off';
                    end % if
                end % for
                blockstruct = feval(blockfcn{:}, block, parameterdata);
            else
                blockstruct = feval(blockfcn{:}, block);
            end % if
        catch
            if not(precompiled)
                LocalCleanUpCompiledModel(mdl, activeConfig, dirty)
            end % if
            lsterror = lasterror;
            if strcmp(lsterror.identifier, 'MATLAB:UndefinedFunction')
                error('slcontrol:ConfigFunctionNotFound', 'The configuration function for the block ''%s'', ''%s'' could not be found on your MATLAB path.  Please add this function to your path.', block, blockfcn{1.0})
            else
                rethrow(lasterror);
            end % if
        end % try
        % 57 60
        % 58 60
        port_dim = get_param(block, 'CompiledPortDimensions');
        % 60 62
        valid_inports = find(eq(port_dim.Inport(2.0:2.0:length(port_dim.Inport)), 1.0));
        valid_outports = find(eq(port_dim.Outport(2.0:2.0:length(port_dim.Outport)), 1.0));
        if not(any(eq(valid_inports, blockstruct.Inport))) || not(any(eq(valid_outports, blockstruct.Outport)))
            % 64 66
            error('slcontrol:InvalidBlockConfiguration', 'The selected input and output ports of a block with a custom configuration function must have scalar inputs.');
            % 66 68
        end % if
        % 68 71
        % 69 71
        if isempty(blockstruct.InvFcn)
            TunedBlocks(ct) = sisodata.TunedMask;
        else
            TunedBlocks(ct) = sisodata.TunedZPK;
            TunedBlocks(ct).Constraints = blockstruct.Constraints;
            TunedBlocks(ct).ZPK2ParFcn = blockstruct.InvFcn;
        end % if
        InPars = blockstruct.TunableParameters;
        TunedBlocks(ct).Identifier = sprintf('TC%d', ct);
        TunedBlocks(ct).Name = block;
        TunedBlocks(ct).Parameters = InPars;
        TunedBlocks(ct).AuxData = struct('InportPort', blockstruct.Inport, 'OutportPort', blockstruct.Outport);
        % 82 84
        TunedBlocks(ct).Par2ZpkFcn = blockstruct.EvalFcn;
        % 84 87
        % 85 87
        if iscell(TunedBlocks(ct).Par2ZpkFcn)
            zpkTuned = feval(TunedBlocks(ct).Par2ZpkFcn{1.0}, InPars, TunedBlocks(ct).Par2ZpkFcn{2.0:end});
        else
            zpkTuned = TunedBlocks(ct).Par2ZpkFcn(InPars);
        end % if
        % 91 93
        TunedBlocks(ct).TsOrig = zpkTuned.Ts;
        % 93 96
        % 94 96
        if strcmpi(opt.RateConversionMethod, 'prewarp')
            C2DMethod = cellhorzcat(opt.RateConversionMethod, str2double(opt.PreWarpFreq));
        else
            C2DMethod = cellhorzcat(opt.RateConversionMethod);
        end % if
        TunedBlocks(ct).C2DMethod = C2DMethod;
        TunedBlocks(ct).D2CMethod = C2DMethod;
    end % for
    % 103 106
    % 104 106
    ts = opt.SampleTime;
    if eq(ts, -1.0)
        % 107 109
        tsall = get(TunedBlocks, {'TsOrig'});
        ts = max(horzcat(tsall{:}));
        opt.SampleTime = ts;
    end % if
    % 112 116
    % 113 116
    % 114 116
    for ct=1.0:numel(TunedBlocks)
        TunedBlocks(ct).Ts = ts;
        % 117 120
        % 118 120
        TunedBlocks(ct).updateZPK;
        % 120 122
        if not(isempty(blockstruct.InvFcn))
            TunedBlocks(ct).addListeners;
        end % if
    end % for
    % 125 128
    % 126 128
    if not(precompiled)
        LocalCleanUpCompiledModel(mdl, activeConfig, dirty)
    end % if
function LocalCleanUpCompiledModel(mdl, activeConfig, dirty)
    % 131 137
    % 132 137
    % 133 137
    % 134 137
    % 135 137
    feval(mdl, [], [], [], 'term');
    % 137 139
    tmpConfigSet = getActiveConfigSet(mdl);
    setActiveConfigSet(mdl, activeConfig.Name);
    detachConfigSet(mdl, tmpConfigSet.Name);
    set_param(mdl, 'Dirty', dirty);
