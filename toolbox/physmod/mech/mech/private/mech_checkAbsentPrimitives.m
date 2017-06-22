function Dout = mech_checkAbsentPrimitives(blk, D)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    Dout = [];
    serializer = MECH.PMSerializer;
    portConnectivity = get_param(blk, 'PortConnectivity');
    if not(isempty(portConnectivity.DstBlock))
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        blockWithPrimitives = portConnectivity.DstBlock;
        blockWithPrimitives = pmNeighbors(blk, 1.0, blockWithPrimitives, portConnectivity.DstPort);
        % 36 38
        if isempty(blockWithPrimitives)
            return
        end
        blockHistory = blockWithPrimitives;
        while strcmp(get_param(blockWithPrimitives, 'ClassName'), 'BranchingBar')
            portConnectivity = get_param(blockWithPrimitives, 'PortConnectivity');
            thisBlock = blockWithPrimitives;
            blockWithPrimitives = [];
            for j=1.0:length(portConnectivity)
                if eq(portConnectivity(j).Type(1.0), 'L')
                    blockWithPrimitives = portConnectivity(j).DstBlock;
                    break
                end
            end % for
            if isempty(blockWithPrimitives)
                % 52 54
                return
            end
            blockWithPrimitives = pmNeighbors(thisBlock, 1.0, blockWithPrimitives, portConnectivity(j).DstPort);
            if isempty(blockWithPrimitives)
                return
            else
                if any(eq(blockHistory, blockWithPrimitives))
                    return
                end
            end
            blockHistory = horzcat(blockHistory, blockWithPrimitives);
        end % while
        % 65 67
        objectParameters = get_param(blockWithPrimitives, 'ObjectParameters');
        if not(any(strcmp(fields(objectParameters), 'PrimitiveProps')))
            return
        end
        primitives = serializer.deserializePrimitive(get_param(blockWithPrimitives, 'PrimitiveProps'));
        whichPrimitives = get(primitives, 'Name');
        % 72 75
        % 73 75
        primitiveList = {'P1','P2','P3','R1','R2','R3','S'};
        for primitiveNum=1.0:length(primitiveList)
            if not(any(strcmp(whichPrimitives, primitiveList{primitiveNum})))
                D(primitiveNum).IsSet = 'false';
            end
        end % for
        % 80 82
        Dout = D;
    end
end
