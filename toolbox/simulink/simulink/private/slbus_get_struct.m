function busInfo = slbus_get_struct(model, blks, term)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    busInfo = [];
    bh = [];
    % 24 26
    ok = eq(nargin, 2.0) || eq(nargin, 3.0);
    if not(ok)
        error('get_bus: invalid number of input arguments');
    end
    % 29 31
    if eq(nargin, 2.0)
        term = true;
    end
    % 33 35
    if ischar(blks)
        % 35 37
        blkHandles = get_param(blks, 'handle');
    else
        if iscell(blks)
            for idx=1.0:length(blks)
                blkHandles(idx) = get_param(blks{idx}, 'handle');
            end % for
        else
            if ishandle(blks)
                blkHandles = blks;
            else
                msgId = horzcat(msgIdPref_l, 'InvalidInput');
                msg = 'The second argument is invalid. The second argument must be a block full path, a cell array containing block full paths, or a vector of block handles.';
                % 48 50
                error(msgId, msg);
            end
        end
    end
    % 53 55
    [isOk, blk] = check_for_block_type_l(model, blkHandles);
    if not(isOk)
        blkName = getfullname(blk);
        msgId = horzcat(msgIdPref_l, 'UnsupportedBlock');
        msg = sprintf('Invalid block ''%s''. Bus objects can only be generated for Subsystem Inport blocks, Outport blocks and Bus Creator blocks', blkName);
        % 59 62
        % 60 62
        error(msgId, msg);
    end
    % 63 66
    % 64 66
    ports = [];
    for idx=1.0:length(blkHandles)
        bType = get_param(blkHandles(idx), 'BlockType');
        bpHandles = get_param(blkHandles(idx), 'porthandles');
        % 69 71
        if strcmpi(bType, 'Inport')
            ph = bpHandles.Outport;
        else
            if strcmpi(bType, 'Outport')
                ph = bpHandles.Inport;
            else
                if strcmpi(bType, 'BusCreator')
                    ph = bpHandles.Outport;
                end
            end
        end
        set_param(ph, 'CacheCompiledBusStruct', 'on');
        ports(plus(end, 1.0)) = ph;
    end % for
    cmd = horzcat(model, '([],[],[],''compileForSizes'')');
    evalc(cmd);
    for idx=1.0:length(blkHandles)
        busInfo(idx).block = blkHandles(idx);
        busInfo(idx).bus = get_param(ports(idx), 'CompiledBusStruct');
    end % for
    if term
        cmd = horzcat(model, '([],[],[],''term'')');
        evalc(cmd);
    end
end
function [isOk, blk] = check_for_block_type_l(model, blks)
    % 96 105
    % 97 105
    % 98 105
    % 99 105
    % 100 105
    % 101 105
    % 102 105
    % 103 105
    isOk = true;
    blk = '';
    % 106 108
    for idx=1.0:length(blks)
        blk = blks(idx);
        blkType = get_param(blk, 'BlockType');
        % 110 112
        if strcmpi(blkType, 'Inport')
            parent = get_param(blk, 'parent');
            if strcmp(parent, model)
                isOk = false;
                return
            end
        else
            if ~(strcmpi(blkType, 'Outport') || strcmpi(blkType, 'BusCreator'))
                isOk = false;
                return
            end
        end
    end % for
end
function msgIdPref = msgIdPref_l
    % 126 129
    % 127 129
    msgIdPref = 'Simulink:slbus_get_struct:';
end
