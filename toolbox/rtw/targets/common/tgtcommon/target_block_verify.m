function varargout = target_block_verify(simulation_component, target_component)
    % 1 41
    % 2 41
    % 3 41
    % 4 41
    % 5 41
    % 6 41
    % 7 41
    % 8 41
    % 9 41
    % 10 41
    % 11 41
    % 12 41
    % 13 41
    % 14 41
    % 15 41
    % 16 41
    % 17 41
    % 18 41
    % 19 41
    % 20 41
    % 21 41
    % 22 41
    % 23 41
    % 24 41
    % 25 41
    % 26 41
    % 27 41
    % 28 41
    % 29 41
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    error(nargchk(2.0, 2.0, nargin, 'struct'));
    error(nargchk(0.0, 3.0, nargout, 'struct'));
    % 43 45
    % 44 45
    [target_model, target_subsys] = i_validateBlockName(target_component);
    % 46 48
    % 47 48
    [simulation_model, simulation_subsys] = i_validateBlockName(simulation_component);
    % 49 51
    % 50 51
    open_system(simulation_model);
    % 52 53
    if strcmpi(get_param(simulation_model, 'StopTime'), 'inf')
        error('The model simulation time is set to "inf", which will cause the model to simulate indefintely. Please set this to a finite value first.');
        % 55 56
    end % if
    % 57 58
    if strcmpi(get_param(simulation_component, 'LinkStatus'), 'implicit')
        error(horzcat('The following subsystem being verified is part of a library block ', 'which cannot be modified unless the link to the library is disabled. ', 'Please disable the link to the library first: ', '"', simulation_component, '".'));
        % 60 63
        % 61 63
        % 62 63
    end % if
    % 64 67
    % 65 67
    % 66 67
    ModelParamsToSave = {'SignalLogging','SignalLoggingName'};
    % 68 69
    OutputPortParamsToSave = {'DataLogging','TestPoint','DataLoggingName','DataLoggingNameMode'};
    % 70 73
    % 71 73
    % 72 73
    [SavedModelParamsValues, simulation_SavedOutputPortsParamsValues] = i_saveModelSettings(simulation_component, ModelParamsToSave, OutputPortParamsToSave);
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    if not(strcmp(simulation_model, target_model))
        % 80 81
        SigLogName_s = 'simlogs';
        i_setLoggingOptions(simulation_component, SigLogName_s, 'out');
        % 83 85
        % 84 85
        simulation_results = i_sim(simulation_model);
        % 86 88
        % 87 88
        pil_block_replace(target_component, simulation_component);
        % 89 91
        % 90 91
        SigLogName_t = 'tgtlogs';
        i_setLoggingOptions(simulation_component, SigLogName_t, 'out');
        % 93 96
        % 94 96
        % 95 96
        try
            % 97 98
            target_results = i_sim(simulation_model);
        catch
            % 100 101
            pil_block_replace(horzcat(target_model, simulation_subsys), simulation_component);
            % 102 104
            % 103 104
            rethrow(lasterror);
        end % try
        % 106 107
        pil_block_replace(horzcat(target_model, simulation_subsys), simulation_component);
        % 108 110
        % 109 110
        set_param(horzcat(target_model, simulation_subsys), 'Name', target_subsys(2.0:end));
        % 111 113
        % 112 113
        varargout(1.0) = cellhorzcat(simulation_results);
        varargout(2.0) = cellhorzcat(target_results);
    else
        % 116 119
        % 117 119
        % 118 119
        [SavedModelParamsValues, target_SavedOutputPortsParamsValues] = i_saveModelSettings(target_component, ModelParamsToSave, OutputPortParamsToSave);
        % 120 125
        % 121 125
        % 122 125
        % 123 125
        % 124 125
        SigLogName = 'logs';
        i_setLoggingOptions(simulation_component, SigLogName, 'simout');
        i_setLoggingOptions(target_component, SigLogName, 'tgtout');
        results = i_sim(simulation_model);
        % 129 131
        % 130 131
        varargout(1.0) = cellhorzcat(results);
        % 132 134
        % 133 134
        i_restoreModelSettings(target_component, ModelParamsToSave, SavedModelParamsValues, OutputPortParamsToSave, target_SavedOutputPortsParamsValues);
        % 135 137
        % 136 137
    end % if
    % 138 140
    % 139 140
    i_restoreModelSettings(simulation_component, ModelParamsToSave, SavedModelParamsValues, OutputPortParamsToSave, simulation_SavedOutputPortsParamsValues);
    % 141 142
end % function
function results = i_sim(model)
    % 144 147
    % 145 147
    % 146 147
    SigLogName = get_param(model, 'SignalLoggingName');
    % 148 149
    switch SigLogName
    case 'simlogs'
        disp('### Running algorithm simulation. Please wait...');
    case 'tgtlogs'
        disp('### Running target simulation. Please wait...');
    case 'logs'
        disp('### Simulating the model. Please wait...');
    otherwise
        error('Unsupported mode action.');
    end % switch
    % 159 161
    % 160 161
    t = tic;
    % 162 163
    sim(model, [], simset('SrcWorkspace', 'base', 'DstWorkspace', 'base'));
    disp(horzcat('--> Simulation of model: ', model, ' took ', num2str(toc(t)), ' seconds.'));
    % 165 167
    % 166 167
    results = evalin('base', horzcat(SigLogName, ';'));
end % function
function i_setLoggingOptions(simulation_component, SigLogName, DataLoggingPrefix)
    % 170 172
    % 171 172
    model = strtok(simulation_component, '/');
    set_param(model, 'SignalLogging', 'on');
    set_param(model, 'BusObjectLabelMismatch', 'none')
    set_param(model, 'SignalLoggingName', SigLogName);
    portHandles = get_param(simulation_component, 'PortHandles');
    outPorts = portHandles.Outport;
    % 178 179
    for k=1.0:length(outPorts)
        set(outPorts(k), 'DataLogging', 'on');
        set(outPorts(k), 'DataLoggingNameMode', 'Custom');
        set(outPorts(k), 'DataLoggingName', horzcat(DataLoggingPrefix, num2str(k)));
    end % for
end % function
function i_restoreModelSettings(simulation_component, ModelParamsToSave, SavedModelParamsValues, OutputPortParamsToSave, SavedOutputPortsParamsValues)
    % 186 191
    % 187 191
    % 188 191
    % 189 191
    % 190 191
    model = strtok(simulation_component, '/');
    % 192 194
    % 193 194
    for k=1.0:length(ModelParamsToSave)
        set_param(model, ModelParamsToSave{k}, SavedModelParamsValues{k});
    end % for
    % 197 199
    % 198 199
    portHandles = get_param(simulation_component, 'PortHandles');
    outPorts = portHandles.Outport;
    for m=1.0:length(outPorts)
        for n=1.0:length(OutputPortParamsToSave)
            set(outPorts(m), OutputPortParamsToSave{n}, SavedOutputPortsParamsValues{m}{n});
        end % for
    end % for
end % function
function [SavedModelParamsValues, SavedOutputPortsParamsValues] = i_saveModelSettings(simulation_component, ModelParamsToSave, OutputPortParamsToSave)
    % 208 212
    % 209 212
    % 210 212
    % 211 212
    model = strtok(simulation_component, '/');
    % 213 215
    % 214 215
    SavedModelParamsValues = [];
    for k=1.0:length(ModelParamsToSave)
        SavedModelParamsValues{k} = get_param(model, ModelParamsToSave{k});
    end % for
    % 219 222
    % 220 222
    % 221 222
    SavedOutputPortsParamsValues = [];
    portHandles = get_param(simulation_component, 'PortHandles');
    outPorts = portHandles.Outport;
    for m=1.0:length(outPorts)
        for n=1.0:length(OutputPortParamsToSave)
            SavedOutputPortsParamsValues{m}{n} = get(outPorts(m), OutputPortParamsToSave{n});
        end % for
    end % for
end % function
function [model, block] = i_validateBlockName(BlockNameFullPath)
    % 232 234
    % 233 234
    if not(isempty(findstr(BlockNameFullPath, '\')))
        error('Please use a forward slash "/" to refer to a Simulink system');
    end % if
    % 237 238
    ndx = findstr(BlockNameFullPath, '/');
    if isempty(ndx)
        error(horzcat('Please pass the full path of: ', BlockNameFullPath, '.'))
    end % if
    % 242 243
    model = strtok(BlockNameFullPath, '/');
    % 244 246
    % 245 246
    load_system(model);
    % 247 250
    % 248 250
    % 249 250
    load_system(BlockNameFullPath);
    % 251 253
    % 252 253
    block = BlockNameFullPath(ndx(end):end);
end % function
