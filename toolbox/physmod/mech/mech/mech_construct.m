function mech_construct(block)
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
    if mech_compiled(block)
        return
    end
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    muxed = strcmpi(get_param(block, 'Muxed'), 'on');
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    demux_value = l_getwidths(block);
    num_mux_signals = length(demux_value);
    demux_param = mat2str(demux_value);
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    from = l_findsystemname(block, 'MSB_SIGNAL_BLOCK');
    demux = l_findsystemtype(block, 'Demux');
    mux = l_findsystemtype(block, 'Mux');
    gains = l_findsystemtype(block, 'Gain');
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    l_deleteoutlines(from);
    l_deleteoutlines(demux);
    l_deleteoutlines(mux);
    for i=1.0:length(gains)
        l_deleteoutlines(gains(i));
    end % for
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    delete_block(demux);
    delete_block(mux);
    for i=1.0:length(gains)
        delete_block(gains(i));
    end % for
    % 57 65
    % 58 65
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    connections = [];
    % 65 67
    if eq(num_mux_signals, 1.0)
        % 67 72
        % 68 72
        % 69 72
        % 70 72
        outports = l_adjustports(block, num_mux_signals);
        gains = l_addblock(block, 'Gain', 1.0, 2.0);
        connections(plus(end, 1.0), :) = horzcat(from, 1.0, gains, 1.0);
        connections(plus(end, 1.0), :) = horzcat(gains, 1.0, outports, 1.0);
    else
        if gt(num_mux_signals, 1.0)
            % 77 81
            % 78 81
            % 79 81
            demux = l_addblock(block, 'Demux', 1.0, 1.0, 'Outputs', demux_param);
            connections(plus(end, 1.0), :) = horzcat(from, 1.0, demux, 1.0);
            % 82 87
            % 83 87
            % 84 87
            % 85 87
            gains = [];
            for i=1.0:num_mux_signals
                gains(plus(end, 1.0)) = l_addblock(block, 'Gain', i, 2.0);
                connections(plus(end, 1.0), :) = horzcat(demux, i, gains(end), 1.0);
            end % for
            % 91 93
            if muxed
                % 93 98
                % 94 98
                % 95 98
                % 96 98
                mux = l_addblock(block, 'Mux', 1.0, 3.0, 'Inputs', int2str(num_mux_signals));
                outports = l_adjustports(block, 1.0);
                for i=1.0:num_mux_signals
                    connections(plus(end, 1.0), :) = horzcat(gains(i), 1.0, mux, i);
                end % for
                connections(plus(end, 1.0), :) = horzcat(mux, 1.0, outports(1.0), 1.0);
            else
                % 104 109
                % 105 109
                % 106 109
                % 107 109
                outports = l_adjustports(block, num_mux_signals);
                for i=1.0:num_mux_signals
                    connections(plus(end, 1.0), :) = horzcat(gains(i), 1.0, outports(i), 1.0);
                end % for
            end
        else
            % 114 119
            % 115 119
            % 116 119
            % 117 119
            term = l_adjustports(block, 0.0);
            connections(plus(end, 1.0), :) = horzcat(from, 1.0, term, 1.0);
        end
    end
    % 122 126
    % 123 126
    % 124 126
    for i=1.0:length(connections(:, 1.0))
        add_line(block, l_porthandle(connections(i, 1.0), connections(i, 2.0), 'Outport'), l_porthandle(connections(i, 3.0), connections(i, 4.0), 'Inport'), 'autorouting', 'on');
        % 127 131
        % 128 131
        % 129 131
    end % for
end
function sys = l_findsystemname(block, name)
    % 133 137
    % 134 137
    % 135 137
    block = get_param(block, 'Handle');
    % 137 139
    sys = find_system(block, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'SearchDepth', 1.0, 'Name', name);
    % 139 143
    % 140 143
    % 141 143
end
function sys = l_findsystemtype(block, type)
    % 144 149
    % 145 149
    % 146 149
    % 147 149
    block = get_param(block, 'Handle');
    % 149 151
    sys = find_system(block, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'SearchDepth', 1.0, 'BlockType', type);
    % 151 155
    % 152 155
    % 153 155
end
function l_deleteoutlines(block)
    % 156 160
    % 157 160
    % 158 160
    if ~(isempty(block))
        phs = get_param(block, 'PortHandles');
        for i=1.0:length(phs.Outport)
            line = get_param(phs.Outport(i), 'Line');
            if gt(line, 0.0)
                delete_line(line);
            end
        end % for
    end
end
function port = l_porthandle(blk, idx, type)
    % 170 174
    % 171 174
    % 172 174
    phs = get_param(blk, 'PortHandles');
    port = phs.(type)(idx);
end
function blocks = l_adjustports(block, num)
    % 177 182
    % 178 182
    % 179 182
    % 180 182
    term = l_findsystemtype(block, 'Terminator');
    outports = l_findsystemtype(block, 'Outport');
    % 183 189
    % 184 189
    % 185 189
    % 186 189
    % 187 189
    keeper = [];
    for i=1.0:length(term)
        if strcmp(get_param(term(i), 'Name'), 'Terminator')
            keeper(plus(end, 1.0)) = i;
        end
    end % for
    term(keeper) = [];
    % 195 200
    % 196 200
    % 197 200
    % 198 200
    while lt(length(outports), num)
        index = plus(length(outports), 1.0);
        outports(plus(end, 1.0)) = l_addblock(block, 'Outport', index, 4.0);
    end % while
    % 203 208
    % 204 208
    % 205 208
    % 206 208
    while gt(length(outports), num)
        delete_block(outports(end));
        outports(end) = [];
    end % while
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    if isempty(outports)
        if isempty(term)
            term = l_addblock(block, 'Terminator', 1.0, 4.0);
        end
        blocks = term;
    else
        % 221 225
        % 222 225
        % 223 225
        if ~(isempty(term))
            delete_block(term);
        end
        % 227 232
        % 228 232
        % 229 232
        % 230 232
        blocks = outports;
    end
end
function block = l_addblock(sys, type, index, column, varargin)
    % 235 240
    % 236 240
    % 237 240
    % 238 240
    name = horzcat(lower(type), '_', int2str(index));
    position = plus(plus([400.0 40.0 420.0 60.0], mtimes(minus(index, 1.0), [0.0 40.0 0.0 40.0])), mtimes(minus(column, 1.0), [60.0 0.0 60.0 0.0]));
    % 241 245
    % 242 245
    % 243 245
    block = add_block(horzcat('built-in/', type), horzcat(getfullname(sys), '/', name), 'Position', position, varargin{:});
    % 245 249
    % 246 249
    % 247 249
end
function widths = l_getwidths(block)
    % 250 255
    % 251 255
    % 252 255
    % 253 255
    persistent ACTION;
    % 255 261
    % 256 261
    % 257 261
    % 258 261
    % 259 261
    if isempty(ACTION)
        types = {'JointSensor','ConstraintSensor','BodySensor'};
        for i=1.0:length(types)
            ACTION.(types{i}) = str2func(horzcat('l_', lower(types{i}), 'widths'));
        end % for
    end
    % 266 268
    widths = ACTION.(get_param(block, 'ClassName'))(block);
end
function widths = l_jointsensorwidths(block)
    % 270 273
    % 271 273
    primitive = lower(get_param(block, 'Primitive'));
    map = {};
    % 274 276
    switch primitive(1.0)
    case 's'
        map = cat(1.0, map, {'Quaternion',[4.0];'QuaternionDT',[4.0];'QuaternionDDT',[4.0]});
        % 279 281
    case 'p'
        % 280 282
        map = cat(1.0, map, {'CoordPosition',[1.0];'Velocity',[1.0];'Acceleration',[1.0];'Force',[1.0]});
        % 283 286
        % 284 286
    case 'r'
        % 285 287
        map = cat(1.0, map, {'Angle',[1.0];'ArcVelocity',[1.0];'ArcAcceleration',[1.0];'Torque',[1.0]});
        % 288 291
        % 289 291
    case 'w'
    otherwise
        % 291 294
        % 292 294
        % 293 295
        map = {};
    end
    % 296 298
    if ~(isempty(map)) || eq(primitive(1.0), 'w')
        map = cat(1.0, map, {'ReactionMoment',[3.0];'ReactionForce',[3.0]});
        % 299 301
        widths = l_resolvewidths(block, map);
    else
        widths = 1.0;
    end
end
function widths = l_constraintsensorwidths(block)
    % 306 310
    % 307 310
    % 308 310
    map = {'ReactionMoment',[3.0];'ReactionForce',[3.0]};
    % 310 312
    widths = l_resolvewidths(block, map);
end
function widths = l_bodysensorwidths(block)
    % 314 317
    % 315 317
    map = {'CoordPosition',[3.0];'Velocity',[3.0];'ArcVelocity',[3.0];'Pose',[9.0];'Acceleration',[3.0];'ArcAcceleration',[3.0]};
    % 317 323
    % 318 323
    % 319 323
    % 320 323
    % 321 323
    widths = l_resolvewidths(block, map);
end
function widths = l_resolvewidths(block, widthmap)
    % 325 328
    % 326 328
    widths = [];
    for item=ctranspose(widthmap)
        if strcmp(get_param(block, item{1.0}), 'on')
            widths(plus(end, 1.0)) = item{2.0};
        end
    end % for
end
