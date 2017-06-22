function added = mech_add_env_block_impl(sys)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ~(strcmp(get_param(sys, 'Type'), 'block_diagram') && strcmp(get_param(sys, 'BlockDiagramType'), 'model'))
        % 8 10
        l_error_invalid_system;
    end
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    lib = load_system(mechlib);
    env = find_system(lib, 'LookUnderMasks', 'all', 'ClassName', 'Environment');
    if iscell(env)
        env = env{1.0};
    end
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    erect = Simulink.rect(get_param(env, 'Position'));
    sz = horzcat(erect.width, erect.height);
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    machines = l_get_machines(sys);
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    nmach = length(machines);
    ground = zeros(nmach, 1.0);
    position = zeros(nmach, 4.0);
    orientation = {};
    for i=1.0:length(machines)
        [ground(i), position(i, :), orientation{i}] = l_pick_best_ground(machines{i}, sz);
    end % for
    % 45 47
    added = zeros(nmach, 1.0);
    for i=1.0:length(machines)
        added(i) = l_add_block(env, ground(i), position(i, :), orientation{i});
    end % for
end
function machines = l_get_machines(sys)
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    grounds = find_system(sys, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'ClassName', 'Ground');
    % 57 65
    % 58 65
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    for i=1.0:length(grounds)
        grounds(i) = l_check_ground(grounds(i));
    end % for
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    machines = {};
    while ~(isempty(grounds))
        ground = grounds(1.0);
        phs = get_param(ground, 'PortHandles');
        % 76 80
        % 77 80
        % 78 80
        if ne(get_param(phs.RConn, 'Line'), -1.0)
            blocks = mech_get_blocks(ground);
            if isempty(blocks.Environment) && ~(isempty(blocks.Ground))
                gnds = blocks.Ground;
                machines{plus(end, 1.0)} = gnds;
            end
        else
            blocks.Ground = ground;
        end
        grounds = setdiff(grounds, blocks.Ground);
    end % while
end
function [ground, position, orientation] = l_pick_best_ground(grounds, sz)
    % 92 101
    % 93 101
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    grounds = l_available_grounds(grounds);
    if isempty(grounds)
        l_error_invalid_grounds;
    end
    % 104 110
    % 105 110
    % 106 110
    % 107 110
    % 108 110
    candidates = [];
    orientations = {};
    positions = [];
    depths = [];
    rects = [];
    coverages = [];
    for i=1.0:length(grounds)
        depth = l_get_depth(grounds(i));
        [r, o, c, p] = l_available_rects(grounds(i), sz);
        for j=1.0:length(r)
            candidates(plus(end, 1.0)) = grounds(i);
            depths(plus(end, 1.0)) = depth;
            orientations{plus(end, 1.0)} = o{j};
            positions(plus(end, 1.0)) = p(j);
            coverages(plus(end, 1.0)) = c(j);
            if eq(length(rects), 0.0)
                rects = r(j).copy;
            else
                rects(plus(end, 1.0)) = r(j).copy;
            end
        end % for
    end % for
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    scores = horzcat(ctranspose(coverages), ctranspose(depths), ctranspose(positions));
    maxes = max(scores, 1.0);
    mins = min(scores, 1.0);
    den = minus(maxes, mins);
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    for i=1.0:length(scores(1.0, :))
        if ne(den(i), 0.0)
            scores(:, i) = mrdivide(minus(scores(:, i), mins(i)), den(i));
        else
            scores(:, i) = zeros(length(scores(:, 1.0)), 1.0);
        end
    end % for
    % 150 157
    % 151 157
    % 152 157
    % 153 157
    % 154 157
    % 155 157
    weight = [.5 ;  .3333333333333333 ;  .16666666666666666];
    scores = mtimes(scores, weight);
    [dummy, idx] = sort(scores);
    % 159 164
    % 160 164
    % 161 164
    % 162 164
    ground = candidates(idx(1.0));
    position = rects(idx(1.0)).double;
    orientation = orientations{idx(1.0)};
end
function depth = l_get_depth(block)
    % 168 171
    % 169 171
    depth = 0.0;
    while ~(strcmp(get_param(block, 'Type'), 'block_diagram'))
        block = l_get_parent(block);
        depth = plus(depth, 1.0);
    end % while
end
function grounds = l_available_grounds(grounds)
    % 177 181
    % 178 181
    % 179 181
    locked = zeros(length(grounds), 1.0);
    for i=1.0:length(grounds)
        locked(i) = mech_is_locked(grounds(i));
    end % for
    grounds = grounds(~(locked));
end
function [rects, orientations, coverage, position] = l_available_rects(blk, sz)
    % 187 197
    % 188 197
    % 189 197
    % 190 197
    % 191 197
    % 192 197
    % 193 197
    % 194 197
    % 195 197
    rect = Simulink.rect(get_param(blk, 'Position'));
    orient = get_param(blk, 'Orientation');
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    [rects, orientations] = l_get_oriented_rects(rect, sz, orient);
    position = 1.0:length(rects);
    % 204 209
    % 205 209
    % 206 209
    % 207 209
    remove = [];
    for i=1.0:length(rects)
        if any(lt(rects(i).double, 0.0))
            remove(plus(end, 1.0)) = i;
        end
    end % for
    % 214 220
    % 215 220
    % 216 220
    % 217 220
    % 218 220
    rects(remove) = [];
    orientations(remove) = [];
    position(remove) = [];
    % 222 224
    parent = get_param(get_param(blk, 'Parent'), 'Handle');
    others = find_system(parent, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'SearchDepth', 1.0);
    % 225 230
    % 226 230
    % 227 230
    % 228 230
    others(eq(others, parent)) = [];
    poses = get_param(others, 'Position');
    if ~(iscell(poses))
        poses = cellhorzcat(poses);
    end
    % 234 236
    orects = repmat(Simulink.rect, length(poses), 1.0);
    for i=1.0:length(poses)
        orects(i) = Simulink.rect(poses{i});
    end % for
    % 239 244
    % 240 244
    % 241 244
    % 242 244
    coverage = zeros(length(rects), 1.0);
    for i=1.0:length(rects)
        maximum = 0.0;
        for j=1.0:length(orects)
            intersect = mtimes(orects(j), rects(i));
            area = mtimes(intersect.height, intersect.width);
            if gt(area, maximum)
                maximum = area;
            end
        end % for
        coverage(i) = maximum;
    end % for
end
function [rects, orientations] = l_get_oriented_rects(rect, sz, orientation)
    % 257 261
    % 258 261
    % 259 261
    idx = [];
    rects = l_get_rects(rect, sz);
    orients = {'right','left','up','down'};
    % 263 269
    % 264 269
    % 265 269
    % 266 269
    % 267 269
    switch orientation
    case 'right'
        idx = [7.0 8.0 6.0 1.0 5.0];
        or = [1.0 4.0 3.0 2.0 2.0];
    case 'left'
        idx = [3.0 2.0 4.0 1.0 5.0];
        or = [2.0 4.0 3.0 1.0 1.0];
    case 'up'
        idx = [5.0 6.0 4.0 7.0 3.0];
        or = [3.0 1.0 2.0 4.0 4.0];
    case 'down'
        idx = [1.0 8.0 2.0 7.0 3.0];
        or = [4.0 1.0 2.0 3.0 3.0];
    end
    % 282 284
    rects = rects(idx);
    orientations = orients(or);
end
function rects = l_get_rects(rect, sz)
    % 287 296
    % 288 296
    % 289 296
    % 290 296
    % 291 296
    % 292 296
    % 293 296
    % 294 296
    hinset = round(mrdivide(minus(rect.width, sz(1.0)), 2.0));
    vinset = round(mrdivide(minus(rect.height, sz(2.0)), 2.0));
    % 297 299
    base = rect;
    base.inset(hinset, vinset);
    % 300 302
    hmov = plus(round(mrdivide(plus(rect.width, base.width), 2.0)), 30.0);
    vmov = plus(round(mrdivide(plus(rect.height, base.height), 2.0)), 30.0);
    % 303 305
    rects = repmat(Simulink.rect, 8.0, 1.0);
    for i=1.0:8.0
        rects(i) = base.copy;
    end % for
    % 308 310
    rects(1.0).offset(0.0, uminus(vmov));
    rects(2.0).offset(hmov, uminus(vmov));
    rects(3.0).offset(hmov, 0.0);
    rects(4.0).offset(hmov, vmov);
    rects(5.0).offset(0.0, vmov);
    rects(6.0).offset(uminus(hmov), vmov);
    rects(7.0).offset(uminus(hmov), 0.0);
    rects(8.0).offset(uminus(hmov), uminus(vmov));
end
function parent = l_get_parent(block)
    % 319 322
    % 320 322
    parent = get_param(get_param(block, 'Parent'), 'Handle');
end
function blk = l_add_block(src, gnd, position, orientation)
    % 324 330
    % 325 330
    % 326 330
    % 327 330
    % 328 330
    parent = l_get_parent(gnd);
    others = find_system(parent, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'SearchDepth', 1.0);
    others(eq(others, parent)) = [];
    names = get_param(others, 'Name');
    % 333 335
    base = get_param(src, 'Name');
    name = base;
    i = 0.0;
    while any(strcmp(name, names))
        i = plus(i, 1.0);
        name = horzcat(base, num2str(i));
    end % while
    % 341 348
    % 342 348
    % 343 348
    % 344 348
    % 345 348
    % 346 348
    if strcmp(get_param(gnd, 'ShowEnvPort'), 'on')
        phs1 = get_param(gnd, 'PortHandles');
        line = get_param(phs1.LConn, 'Line');
        if ne(line, -1.0)
            delete_line(line);
        end
    else
        set_param(gnd, 'ShowEnvPort', 'on');
        phs1 = get_param(gnd, 'PortHandles');
    end
    % 357 362
    % 358 362
    % 359 362
    % 360 362
    blk = add_block(getfullname(src), horzcat(getfullname(parent), '/', name), 'Position', position, 'Orientation', orientation, 'ShowName', 'off');
    % 362 366
    % 363 366
    % 364 366
    phs2 = get_param(blk, 'PortHandles');
    % 366 371
    % 367 371
    % 368 371
    % 369 371
    add_line(parent, phs1.LConn, phs2.RConn, 'autorouting', 'on');
end
function ground = l_check_ground(ground)
    % 373 376
    % 374 376
    phs = get_param(ground, 'PortHandles');
    if strcmp(get_param(ground, 'ShowEnvPort'), 'off') && ~(isempty(phs.LConn))
        % 377 379
        important = l_get_important(ground);
        for i=1.0:length(important)
            values.(important{i}) = get_param(ground, important{i});
        end % for
        % 382 384
        orient = {'up','down','left','right'};
        opposite = {'down','up','right','left'};
        values.Orientation = opposite{find(strcmp(orient, values.Orientation))};
        % 386 388
        name = getfullname(ground);
        delete_block(ground);
        % 389 391
        pairs = {};
        for i=1.0:length(important)
            pairs{plus(end, 1.0)} = important{i};
            pairs{plus(end, 1.0)} = values.(important{i});
        end % for
        ground = add_block(horzcat(mechlib, '/Bodies/Ground'), name, pairs{:});
    end
end
function important = l_get_important(ground)
    % 399 403
    % 400 403
    % 401 403
    persistent IMPORTANT;
    % 403 405
    if isempty(IMPORTANT)
        IMPORTANT = {'Position';'Orientation';'ForegroundColor';'BackgroundColor';'DropShadow';'NamePlacement';'ShowName'};
        % 406 413
        % 407 413
        % 408 413
        % 409 413
        % 410 413
        % 411 413
        mn = get_param(ground, 'MaskNames');
        IMPORTANT = cellhorzcat(IMPORTANT{:}, mn{:});
    end
    % 415 417
    important = IMPORTANT;
end
function l_error(id, msg)
    % 419 422
    % 420 422
    error(horzcat('physmod:mech:mech_addenvblock:', id), msg);
end
function l_error_invalid_system
    % 424 426
    l_error('InvalidSystem', 'Object passed to mech_addenvblock must be a Simulink model.');
end
function l_error_invalid_grounds
    % 428 431
    % 429 431
    l_error('InvalidGrounds', 'All Ground blocks requiring Machine Environment blocks in the passed model appear to be in library-linked subsystems. Manually add a Machine Environment block to one of the Ground blocks in the referenced libraries.');
    % 431 434
    % 432 434
end
