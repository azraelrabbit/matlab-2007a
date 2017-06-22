function nesl_solverinitialization(hBlock)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    lRemoveContents(hBlock);
    [sys, key] = nesl_dynamicsystemregistry(get_param(hBlock, 'Parent'));
    % 13 15
    if ~(isempty(sys))
        lSetupSFunction(hBlock, sys, key);
    end
end
function lRemoveContents(hBlock)
    % 19 23
    % 20 23
    % 21 23
    contents = find_system(hBlock, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Type', 'block');
    % 23 27
    % 24 27
    % 25 27
    for i=1.0:length(contents)
        if ne(contents(i), hBlock) && ~(strcmp(get_param(contents(i), 'BlockType'), 'PMIOPort'))
            delete_block(contents(i));
        end
    end % for
    % 31 33
    contents = find_system(hBlock, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'FindAll', 'on', 'Type', 'line');
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    for i=1.0:length(contents)
        delete_line(contents(i));
    end % for
    % 40 42
end
function lSetupSFunction(hBlock, sys, key)
    % 43 47
    % 44 47
    % 45 47
    fullname = getfullname(hBlock);
    % 47 49
    [inputH, valid] = lGetIoHandles(sys.Input);
    if ~(valid)
        return
    end
    % 52 54
    [outputH, valid] = lGetIoHandles(sys.Output);
    if ~(valid)
        return
    end
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    mux = horzcat(fullname, '/MUX');
    isel = horzcat(fullname, '/ISEL');
    sfun = horzcat(fullname, '/SFUN');
    demux = horzcat(fullname, '/DEMUX');
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    inputs = sys.Input;
    outputs = sys.Output;
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    sfunType = lGetSFunction(hBlock);
    % 76 88
    % 77 88
    % 78 88
    % 79 88
    % 80 88
    % 81 88
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    loadInitialState = get_param(bdroot(gcs), 'LoadInitialState');
    switch loadInitialState
    case 'on'
        loadInitialStateString = 'true';
    case 'off'
        loadInitialStateString = 'false';
    end
    % 94 96
    switch sfunType
    case 'ne_sl_sfun_dae'
        sfunParams = horzcat('''', key, ''', ResidualTolerance, DynamicScaling, DoDC, ', loadInitialStateString, ', DoFixedCost, MaxNonlinIter, MaxModeIter, LinearAlgebra');
    case 'nesl_sfun_internal'
        sfunParams = horzcat('''', key, '''');
    end
    % 101 103
    add_block('built-in/S-Function', sfun, 'FunctionName', sfunType, 'Parameters', sfunParams, 'Position', [270.0 110.0 310.0 140.0]);
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    if gt(length(inputs), 0.0)
        inputIdx = get(inputs, {'Index'});
        inputIdx = horzcat(inputIdx{:});
        % 113 118
        % 114 118
        % 115 118
        % 116 118
        inputIdx(inputIdx) = 1.0:length(inputIdx);
        % 118 120
        elementsStr = mat2str(inputIdx);
        numInputsStr = int2str(length(inputIdx));
        inputStr = int2str(length(inputIdx));
        % 122 124
        add_block('built-in/Mux', mux, 'Position', [195.0 50.0 200.0 200.0], 'Inputs', inputStr);
        % 124 128
        % 125 128
        % 126 128
        add_block('built-in/Selector', isel, 'Position', [220.0 110.0 260.0 140.0], 'Elements', elementsStr, 'InputPortWidth', numInputsStr);
        % 128 133
        % 129 133
        % 130 133
        % 131 133
        add_line(hBlock, 'MUX/1', 'ISEL/1');
        add_line(hBlock, 'ISEL/1', 'SFUN/1');
    end
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    if gt(length(outputs), 0.0)
        outputIdx = get(outputs, 'Index');
        if iscell(outputIdx)
            outputIdx = horzcat(outputIdx{:});
        end
        % 144 146
        outputStr = int2str(length(outputIdx));
        % 146 148
        add_block('built-in/Demux', demux, 'Position', [450.0 50.0 455.0 200.0], 'Outputs', outputStr);
        % 148 151
        % 149 151
        add_line(hBlock, 'SFUN/1', 'DEMUX/1');
    end
    % 152 158
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    positionFrom = [50.0 20.0 90.0 40.0];
    for i=1.0:length(inputs)
        tag = nesl_makepstag(inputH(i));
        from = horzcat(fullname, '/', tag);
        add_block('built-in/From', from, 'Position', plus(positionFrom, mtimes(i, [0.0 30.0 0.0 30.0])), 'GotoTag', tag);
        % 162 165
        % 163 165
        add_line(hBlock, horzcat(tag, '/1'), horzcat('MUX/', int2str(i)));
    end % for
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    positionGain = [550.0 20.0 590.0 40.0];
    positionGoto = [610.0 20.0 650.0 40.0];
    for i=1.0:length(outputs)
        tag = nesl_makepstag(outputH(i));
        gainBase = horzcat(tag, '_CONVERSION');
        gain = horzcat(fullname, '/', gainBase);
        goto = horzcat(fullname, '/', tag);
        % 177 179
        eUnit = outputs(i).Unit;
        oUnit = get_param(outputH(i), 'Unit');
        % 180 182
        conversion = '1';
        try
            pm_cunit(oUnit, eUnit);
            conversion = horzcat('pm_cunit(''', oUnit, ''', ''', eUnit, ''')');
        end % try
        % 186 188
        add_block('built-in/Gain', gain, 'Position', plus(positionGain, mtimes(i, [0.0 30.0 0.0 30.0])), 'Gain', conversion);
        % 188 192
        % 189 192
        % 190 192
        add_block('built-in/Goto', goto, 'Position', plus(positionGoto, mtimes(i, [0.0 30.0 0.0 30.0])), 'GotoTag', tag, 'TagVisibility', 'global');
        % 192 197
        % 193 197
        % 194 197
        % 195 197
        add_line(hBlock, horzcat('DEMUX/', int2str(i)), horzcat(gainBase, '/1'));
        add_line(hBlock, horzcat(gainBase, '/1'), horzcat(tag, '/1'));
    end % for
end
function sfun = lGetSFunction(hBlock)
    % 201 203
    persistent SFUN_MAP;
    % 203 205
    if isempty(SFUN_MAP)
        SFUN_MAP = struct;
        % 206 208
        implicitSolvers = {'ode14x';'ode15s';'ode23t';'ode23t_experimental';'ode15s_experimental'};
        % 208 214
        % 209 214
        % 210 214
        % 211 214
        % 212 214
        explicitSolvers = {'ode45';'ode23';'ode113';'ode23tb';'ode23s';'ode1';'ode2';'ode3';'ode4';'ode5'};
        % 214 225
        % 215 225
        % 216 225
        % 217 225
        % 218 225
        % 219 225
        % 220 225
        % 221 225
        % 222 225
        % 223 225
        for i=1.0:length(implicitSolvers)
            SFUN_MAP.(implicitSolvers{i}) = 'ne_sl_sfun_dae';
        end % for
        % 227 229
        for i=1.0:length(explicitSolvers)
            SFUN_MAP.(explicitSolvers{i}) = 'nesl_sfun_internal';
        end % for
    end
    % 232 234
    solver = get_param(bdroot(hBlock), 'Solver');
    % 234 236
    if ~(isfield(SFUN_MAP, solver))
        pm_error('network_engine:nesl_solverinitialization:InvalidSolverChoice', solver);
    end
    % 238 240
    sfun = SFUN_MAP.(solver);
    % 240 242
end
function [handles, valid] = lGetIoHandles(ioInfo)
    % 243 246
    % 244 246
    names = get(ioInfo, 'Descriptor');
    % 246 248
    valid = true;
    try
        handles = get_param(names, 'Handle');
    catch
        handles = [];
        valid = false;
    end % try
    % 254 256
    if iscell(handles)
        handles = horzcat(handles{:});
    end
    % 258 260
end
