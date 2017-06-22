function [isOpen, wsVars, toWSBlks, inports, outports, signals, mdlLocation, errMsg, isSimTimeInf] = openModel(pathstring, modelname)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    isOpen = true;
    wsVars = [];
    toWSBlks = '';
    inports = 0.0;
    outports = [];
    signals = [];
    errMsg = '';
    mdlLocation = '';
    isSimTimeInf = false;
    % 23 25
    try
        systemtest.JSimulink.loadModel(pathstring, modelname);
    catch
        % 27 29
        isOpen = false;
        err = lasterror;
        errMsg = err.message;
        return;
    end % try
    % 33 36
    % 34 36
    mdlLocation = which(modelname);
    % 36 40
    % 37 40
    % 38 40
    isSimTimeInf = isequal(lower(get_param(modelname, 'StopTime')), 'inf');
    % 40 43
    % 41 43
    wsVars = getModelWorkspaceVariables(modelname);
    % 43 46
    % 44 46
    toWSBlks = getToWorkspaceBlocks(modelname);
    % 46 49
    % 47 49
    inports = getNumOfInportBlocks(modelname);
    % 49 52
    % 50 52
    pathOfModel = fileparts(pathstring);
    % 52 55
    % 53 55
    currentPath = path;
    addpath(pathOfModel);
    % 56 60
    % 57 60
    % 58 60
    mode = get_param(modelname, 'SimulationMode');
    % 60 64
    % 61 64
    % 62 64
    isDirty = get_param(modelname, 'Dirty');
    if strcmp(mode, 'accelerator')
        set_param(modelname, 'SimulationMode', 'normal');
    end % if
    % 67 69
    try
        % 69 71
        feval(modelname, [], [], [], 'compile');
        % 71 74
        % 72 74
        outports = getOutportBlocks(modelname);
        % 74 77
        % 75 77
        signals = getLoggedSignals(modelname);
    catch
        % 78 81
        % 79 81
        outports = [];
        signals = [];
        err = lasterror;
        errMsg = err.message;
    end % try
    % 85 88
    % 86 88
    try
        feval(modelname, [], [], [], 'term');
        % 89 92
        % 90 92
    end % try
    % 92 95
    % 93 95
    set_param(modelname, 'SimulationMode', mode);
    path(currentPath);
    % 96 98
    set_param(modelname, 'Dirty', isDirty);
    set_param(modelname, 'Open', 'on');
    % 99 101
    drawnow
    % 101 103
function mdlWSVars = getModelWorkspaceVariables(modelname)
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    mws = get_param(modelname, 'ModelWorkspace');
    % 111 113
    if strcmp(mws.DataSource, 'MDL-File')
        % 113 115
        tmp = mws.whos;
        % 115 117
        mdlWSVars = cellhorzcat(tmp.name);
        % 117 119
        if isempty(mdlWSVars)
            mdlWSVars = '';
        end % if
    else
        % 122 125
        % 123 125
        mdlWSVars = java.lang.Boolean(false);
    end % if
function mdlToWSBlks = getToWorkspaceBlocks(modelname)
    % 127 135
    % 128 135
    % 129 135
    % 130 135
    % 131 135
    % 132 135
    % 133 135
    mdlToWSBlks = find_system(modelname, 'LookUnderMasks', 'all', 'BlockType', 'ToWorkspace');
    % 135 139
    % 136 139
    % 137 139
    if isempty(mdlToWSBlks)
        mdlToWSBlks = '';
    end % if
function mdlInports = getNumOfInportBlocks(modelname)
    % 142 150
    % 143 150
    % 144 150
    % 145 150
    % 146 150
    % 147 150
    % 148 150
    mdlInports = length(find_system(modelname, 'SearchDepth', 1.0, 'BlockType', 'Inport'));
function mdlOutports = getOutportBlocks(modelname)
    % 151 159
    % 152 159
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    mdlOutports = [];
    % 159 162
    % 160 162
    outs = find_system(modelname, 'SearchDepth', 1.0, 'BlockType', 'Outport');
    % 162 165
    % 163 165
    for n=1.0:length(outs)
        % 165 168
        % 166 168
        hBlock = get_param(outs{n}, 'Object');
        % 168 172
        % 169 172
        % 170 172
        hPort = handle(hBlock.PortHandles.Inport);
        % 172 176
        % 173 176
        % 174 176
        dimensions = int32(hPort.CompiledPortDimensions(2.0:end));
        % 176 187
        % 177 187
        % 178 187
        % 179 187
        % 180 187
        % 181 187
        % 182 187
        % 183 187
        % 184 187
        % 185 187
        mdlOutports = horzcat(mdlOutports, vertcat(outs(n), cellhorzcat(hBlock.Port), cellhorzcat(dimensions)));
    end % for
    % 188 190
function mdlLoggedSignals = getLoggedSignals(modelname)
    % 190 198
    % 191 198
    % 192 198
    % 193 198
    % 194 198
    % 195 198
    % 196 198
    mdlLoggedSignals = [];
    % 198 202
    % 199 202
    % 200 202
    sigs = find_system(modelname, 'findall', 'on', 'LookUnderMasks', 'all', 'type', 'port', 'TestPoint', 'on');
    % 202 208
    % 203 208
    % 204 208
    % 205 208
    % 206 208
    for n=1.0:length(sigs)
        % 208 210
        hPort = handle(sigs(n));
        % 210 214
        % 211 214
        % 212 214
        hParentTokens = regexp(regexprep(hPort.Parent, '\n', ' '), '([^/]*)/', 'tokens');
        % 214 217
        % 215 217
        hParent = '';
        % 217 221
        % 218 221
        % 219 221
        for cnt=2.0:length(hParentTokens)
            hParent = horzcat(hParent, char(hParentTokens{cnt}), '/');
        end % for
        % 223 226
        % 224 226
        if strcmp(hPort.DataLoggingNameMode, 'SignalName')
            mdlLoggedSignals = vertcat(mdlLoggedSignals, cellhorzcat(horzcat(hParent, hPort.Name)));
        else
            % 228 230
            mdlLoggedSignals = vertcat(mdlLoggedSignals, cellhorzcat(horzcat(hParent, hPort.DataLoggingName)));
        end % if
    end % for
    % 232 234
