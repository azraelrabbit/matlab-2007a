function mech_initGround(level, blk, machineId)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent action;
    if isempty(action)
        action = struct('ground', @local_initGround, 'engine', @local_initEngine);
        % 10 12
    end
    % 12 14
    if mech_compiled(blk)
        return
    end
    % 16 18
    level = lower(level);
    if ~(isfield(action, level))
        error('physmod:mech:mech_initGround:InvalidAction', 'Invalid action passed to %s', mfilename);
        % 20 22
    end
    % 22 24
    blk = get_param(blk, 'Handle');
    data = local_GetMachineData(blk, machineId);
    feval(getfield(action, level), blk, data);
end
function local_initGround(gnd, data)
    % 28 32
    % 29 32
    % 30 32
    moved = false;
    prevname = get_param(gnd, 'UserData');
    gndfullname = getfullname(gnd);
    % 34 36
    engineSystem = find_system(gnd, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', MECH_ENGINE_NAME);
    % 36 40
    % 37 40
    % 38 40
    if strcmp(get_param(gnd, 'UserDataPersistent'), 'off')
        set_param(gnd, 'UserDataPersistent', 'on');
    end
    % 42 44
    moved = ~((isempty(prevname)) | (strcmp(prevname, gndfullname)));
    set_param(gnd, 'UserData', gndfullname);
    % 45 47
    if ~(moved)
        if ~(isempty(engineSystem))
            delete_block(engineSystem(1.0));
        end
        if any(data.MachineId)
            load_system('pm_engine');
            add_block('pm_engine/MECHANICAL_ENGINE', horzcat(gndfullname, '/', MECH_ENGINE_NAME), 'MachineId', 'MachineId');
            % 53 55
        end
    end
    % 56 58
    envport = find_system(gnd, 'LookUnderMasks', 'all', 'SearchDepth', 1.0, 'FollowLinks', 'on', 'Name', ENV_PORT_NAME);
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    if strcmp(get_param(gnd, 'ShowEnvPort'), 'on')
        if isempty(envport)
            add_block('built-in/PMIOPort', horzcat(getfullname(gnd), '/', ENV_PORT_NAME), 'Side', 'Left', 'Position', [15.0 45.0 35.0 65.0]);
            % 66 69
            % 67 69
        end
    else
        if ~(isempty(envport))
            delete_block(envport);
        end
    end
end
function local_initEngine(engine, data)
    % 76 80
    % 77 80
    % 78 80
    if any(data.MachineId)
        searchBlk = find_system(engine, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', 'FINISHED_BLOCK');
        % 81 85
        % 82 85
        % 83 85
        if isempty(searchBlk)
            local_SetMachineId(engine, data.MachineId);
            engineSysName = getfullname(engine);
            sensorSys = get_param(horzcat(engineSysName, '/', 'sensors'), 'Handle');
            actuatorSys = get_param(horzcat(engineSysName, '/', 'actuators'), 'Handle');
            % 89 94
            % 90 94
            % 91 94
            % 92 94
            [sensorWidths, sensorTags, outputsW] = local_TrimWidths(data.SensorWidths, data.SensorTags);
            [actuatorWidths, actuatorTags, inputsW] = local_TrimWidths(data.ActuatorWidths, data.ActuatorTags);
            % 95 100
            % 96 100
            % 97 100
            % 98 100
            local_ConfigureIO(sensorSys, ctranspose(sensorWidths));
            local_ConfigureIO(actuatorSys, actuatorWidths);
            % 101 106
            % 102 106
            % 103 106
            % 104 106
            local_WireGotos(sensorSys, sensorTags);
            local_WireFroms(actuatorSys, actuatorTags);
            % 107 112
            % 108 112
            % 109 112
            % 110 112
            [fromTags, gotoTags] = local_SetupFromTo(engine, outputsW, inputsW);
            % 112 117
            % 113 117
            % 114 117
            % 115 117
            local_WireFroms(sensorSys, fromTags);
            local_WireGotos(actuatorSys, gotoTags);
            % 118 123
            % 119 123
            % 120 123
            % 121 123
            local_SetupGravity(engine, data);
            % 123 128
            % 124 128
            % 125 128
            % 126 128
            cGcs = get_param(0.0, 'CurrentSystem');
            set_param(0.0, 'CurrentSystem', engine);
            mech_finishWiring(getfullname(get_param(engine, 'Parent')), horzcat(inputsW(1.0), outputsW(1.0)), horzcat(inputsW(2.0), outputsW(2.0)), horzcat(inputsW(3.0), outputsW(3.0)), data.EventFeedback, data.HasState, data.OutputConstraintErrors, GRAVITY_SRC, GRAVITY_CONVERSION);
            % 130 138
            % 131 138
            % 132 138
            % 133 138
            % 134 138
            % 135 138
            % 136 138
            set_param(0.0, 'CurrentSystem', cGcs);
            add_block('built-in/Subsystem', horzcat(engineSysName, '/FINISHED_BLOCK'));
        end
    end
end
function data = local_GetMachineData(gnd, machineId)
    % 143 148
    % 144 148
    % 145 148
    % 146 148
    if any(machineId)
        data = feature('SimMechanicsMachineData', machineId);
        if (isempty(data)) | (data.Error)
            machineId = [0.0 0.0];
        end
    end
    data.MachineId = machineId;
end
function local_SetMachineId(engine, id)
    % 156 160
    % 157 160
    % 158 160
    sys = getfullname(engine);
    S_FunctionName = 'mech_engine';
    % 161 166
    % 162 166
    % 163 166
    % 164 166
    mechStr = 'MachineId';
    for i=1.0:3.0
        i_str = num2str(i);
        sfunBlk = horzcat(sys, '/Block#', i_str);
        sfunBlk = get_param(sfunBlk, 'Handle');
        params = horzcat(i_str, ',', mechStr);
        set_param(sfunBlk, 'FunctionName', S_FunctionName, 'Parameters', params);
    end % for
end
function [widths, tags, blkWidths] = local_TrimWidths(widths, tags)
    % 175 180
    % 176 180
    % 177 180
    % 178 180
    if isempty(widths)
        tags = {};
        blkWidths = [0.0 0.0 0.0];
    else
        [n, m] = size(widths);
        if eq(m, 1.0)
            blkWidths = widths;
        else
            blkWidths = sum(ctranspose(widths));
        end
        % 189 191
        ioWidths = sum(widths);
        % 191 193
        widths(find(eq(blkWidths, 0.0)), :) = [];
        zeroIO = find(eq(ioWidths, 0.0));
        widths(:, zeroIO) = [];
        tags(zeroIO) = [];
    end
end
function local_ConfigureIO(sys, widths, muxInputs)
    % 199 203
    % 200 203
    % 201 203
    sys = getfullname(sys);
    if isempty(widths)
        % 204 208
        % 205 208
        % 206 208
        set_param(horzcat(sys, '/', 'Selector'), 'Elements', '1', 'InputPortWidth', '1');
        % 208 212
        % 209 212
        % 210 212
        set_param(horzcat(sys, '/', 'Demux'), 'Outputs', '1');
        % 212 215
        % 213 215
        set_param(horzcat(sys, '/', 'Mux'), 'Inputs', '1');
    else
        % 216 218
        [n, m] = size(widths);
        % 218 222
        % 219 222
        % 220 222
        [p, w] = local_Permute(widths);
        % 222 227
        % 223 227
        % 224 227
        % 225 227
        sys = getfullname(sys);
        set_param(horzcat(sys, '/', 'Selector'), 'Elements', mat2str(p), 'InputPortWidth', num2str(sum(w)));
        % 228 235
        % 229 235
        % 230 235
        % 231 235
        % 232 235
        % 233 235
        if eq(length(w), 1.0)
            % 235 241
            % 236 241
            % 237 241
            % 238 241
            % 239 241
            w_str = horzcat('[', num2str(w), ']');
        else
            w_str = mat2str(w);
        end
        set_param(horzcat(sys, '/', 'Demux'), 'Outputs', w_str);
        % 245 251
        % 246 251
        % 247 251
        % 248 251
        % 249 251
        set_param(horzcat(sys, '/', 'Mux'), 'Inputs', num2str(m));
    end
end
function [p, w] = local_Permute(x)
    % 254 259
    % 255 259
    % 256 259
    % 257 259
    [n, m] = size(x);
    % 259 264
    % 260 264
    % 261 264
    % 262 264
    top = zeros(1.0, m);
    bottom = sum(x, 1.0);
    w = sum(x, 2.0);
    % 266 271
    % 267 271
    % 268 271
    % 269 271
    p = zeros(1.0, sum(bottom));
    idx = 0.0;
    for i=1.0:n
        % 273 277
        % 274 277
        % 275 277
        cnt = 0.0;
        for j=1.0:m
            % 278 282
            % 279 282
            % 280 282
            cnt = plus(cnt, top(j));
            % 282 288
            % 283 288
            % 284 288
            % 285 288
            % 286 288
            idx1 = plus(idx, x(i, j));
            p(plus(idx, 1.0):idx1) = plus(cnt, 1.0):plus(cnt, x(i, j));
            idx = idx1;
            % 290 295
            % 291 295
            % 292 295
            % 293 295
            cnt = plus(cnt, bottom(j));
        end % for
        % 296 301
        % 297 301
        % 298 301
        % 299 301
        top = plus(top, x(i, :));
        bottom = minus(bottom, x(i, :));
    end % for
end
function local_WireFroms(sys, tags)
    % 305 309
    % 306 309
    % 307 309
    cGcs = get_param(0.0, 'CurrentSystem');
    set_param(0.0, 'CurrentSystem', sys);
    sys = getfullname(sys);
    mux = horzcat(sys, '/', 'Mux');
    % 312 314
    for i=1.0:length(tags)
        add_block('built-in/From', horzcat(sys, '/', tags{i}), 'GotoTag', tags{i});
        % 315 317
        add_line(sys, horzcat(tags{i}, '/1'), horzcat('Mux', '/', num2str(i)));
        % 317 320
        % 318 320
    end % for
    set_param(0.0, 'CurrentSystem', cGcs);
end
function local_WireGotos(sys, tags)
    % 323 327
    % 324 327
    % 325 327
    cGcs = get_param(0.0, 'CurrentSystem');
    set_param(0.0, 'CurrentSystem', sys);
    % 328 330
    sys = getfullname(sys);
    % 330 332
    for i=1.0:length(tags)
        add_block('built-in/Goto', horzcat(sys, '/', tags{i}), 'GotoTag', tags{i}, 'TagVisibility', 'global');
        % 333 336
        % 334 336
        add_line(sys, horzcat('Demux', '/', num2str(i)), horzcat(tags{i}, '/1'));
        % 336 339
        % 337 339
    end % for
    set_param(0.0, 'CurrentSystem', cGcs);
end
function [fromTags, gotoTags] = local_SetupFromTo(engineSys, outputsW, inputsW)
    % 342 346
    % 343 346
    % 344 346
    fromTags = {};
    engineSys = getfullname(engineSys);
    cGcs = get_param(0.0, 'CurrentSystem');
    set_param(0.0, 'CurrentSystem', engineSys);
    for i=1.0:2.0
        if outputsW(i)
            sys = get_param(horzcat(engineSys, '/', 'FromBlock', num2str(i)), 'Handle');
            tag = local_GenTag(sys);
            set_param(sys, 'GotoTag', tag, 'TagVisibility', 'global');
            % 354 357
            % 355 357
            fromTags{plus(end, 1.0)} = tag;
        end
    end % for
    % 359 361
    gotoTags = {};
    for i=1.0:3.0
        if inputsW(i)
            sys = get_param(horzcat(engineSys, '/', 'ToBlock', num2str(i)), 'Handle');
            tag = local_GenTag(sys);
            set_param(sys, 'GotoTag', tag);
            % 366 368
            gotoTags{plus(end, 1.0)} = tag;
        end
    end % for
    % 370 372
    set_param(0.0, 'CurrentSystem', cGcs);
end
function local_SetupGravity(engine, data)
    % 374 377
    % 375 377
    tag = data.GravityTag;
    srcblkname = horzcat(getfullname(engine), '/', GRAVITY_SRC);
    convblkname = horzcat(getfullname(engine), '/', GRAVITY_CONVERSION);
    if isempty(tag)
        gstr = mat2str(data.GravityValue);
        add_block('built-in/Constant', srcblkname, 'Value', gstr);
    else
        add_block('built-in/From', srcblkname, 'GotoTag', tag);
    end
    % 385 389
    % 386 389
    % 387 389
    cstr = num2str(uminus(data.GravityConversion));
    add_block('built-in/Gain', convblkname, 'Gain', cstr);
end
function tag = local_GenTag(blk)
    % 392 396
    % 393 396
    % 394 396
    tag = feature('SimMechanicsTagManager', blk);
end
function str = MECH_ENGINE_NAME
    % 398 402
    % 399 402
    % 400 402
    str = '_mech_engine';
end
function str = ENV_PORT_NAME
    % 404 407
    % 405 407
    str = '_env_port';
end
function str = GRAVITY_SRC
    % 409 412
    % 410 412
    str = '_gravity_source';
end
function str = GRAVITY_CONVERSION
    % 414 416
    str = '_gravity_conversion';
end
