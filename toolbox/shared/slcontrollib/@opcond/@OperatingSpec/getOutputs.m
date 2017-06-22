function y = getOutputs(this, x, u, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    Outputs = this.Outputs;
    y = [];
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if eq(nargin, 3.0) || not(strcmp(varargin{1.0}, 'SimulationMode'))
        if isstruct(x) && eq(numel(x.signals), 0.0)
            x = [];
        end % if
        y_struct = feval(this.model, this.Time, x, u, 'outputs');
        y_outport = simulinkStructToVector(slcontrol.Utilities, y_struct);
    end % if
    % 26 28
    if not(isempty(Outputs))
        % 28 30
        BlockHandles = get_param(get(Outputs, {'Block'}), 'Object');
        bt = get(horzcat(BlockHandles{:}), 'BlockType');
        % 31 34
        % 32 34
        isOutport = strcmpi(bt, 'Outport');
        % 34 36
        Outports = find(isOutport);
        % 36 39
        % 37 39
        if gt(nargin, 3.0) && strcmp(varargin{1.0}, 'SimulationMode')
            y_outport = [];
            outports = find_system(this.model, 'SearchDepth', 1.0, 'BlockType', 'Outport');
            for ct=1.0:length(outports)
                obj = get_param(outports{ct}, 'RunTimeObject');
                portdata = obj.InputPort(1.0);
                y_outport = vertcat(y_outport, horzcat(portdata.Data));
            end % for
        end % if
        % 47 50
        % 48 50
        OutportHandles = BlockHandles(Outports);
        OutportNumbersChar = get(horzcat(OutportHandles{:}), {'Port'});
        % 51 54
        % 52 54
        OutportNumbers = ones(size(OutportNumbersChar));
        for ct=1.0:length(OutportNumbersChar)
            OutportNumbers(ct) = str2num(OutportNumbersChar{ct});
        end % for
        % 57 60
        % 58 60
        [SortedOutportNumbers, OutportRefInd] = sort(OutportNumbers);
        % 60 64
        % 61 64
        % 62 64
        OutputVectorOffsetInd = ones(size(OutportNumbersChar));
        for ct=2.0:length(SortedOutportNumbers)
            portwidth = this.Outputs(Outports(OutportRefInd(minus(ct, 1.0)))).PortWidth;
            OutputVectorOffsetInd(ct) = plus(OutputVectorOffsetInd(minus(ct, 1.0)), portwidth);
        end % for
        % 68 71
        % 69 71
        OutportCount = 1.0;
        % 71 73
        for ct1=1.0:length(isOutport)
            if isOutport(ct1)
                % 74 76
                offset = OutputVectorOffsetInd(find(eq(OutportCount, OutportRefInd)));
                y = vertcat(y, y_outport(offset:minus(plus(offset, Outputs(ct1).PortWidth), 1.0)));
                OutportCount = plus(OutportCount, 1.0);
            else
                % 79 81
                block = get_param(Outputs(ct1).Block, 'object');
                port = get_param(block.PortHandles.Outport(Outputs(ct1).PortNumber), 'object');
                % 82 85
                % 83 85
                old_engine_interface = feature('EngineInterface');
                feature('EngineInterface', 1001.0);
                % 86 88
                blockoutput = port.getOutput;
                if eq(nargin, 4.0)
                    y = vertcat(y, horzcat(blockoutput.Values));
                else
                    y = vertcat(y, blockoutput);
                end % if
                % 93 95
                feature('EngineInterface', old_engine_interface);
            end % if
        end % for
    end % if
end % function
