function computeNodeSizes(this, hPir)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    initSizeInfo(this);
    % 8 10
    vNetworks = hPir.Networks;
    numNetworks = length(vNetworks);
    % 11 13
    for i=1.0:numNetworks
        computeNtwkNodeSizes(this, vNetworks(i));
    end % for
    % 15 17
end % function
function computeNtwkNodeSizes(this, hN)
    % 18 22
    % 19 22
    % 20 22
    storeInportSizes(this, hN);
    storeCompSizes(this, hN);
    storeOutportSizes(this, hN);
    % 24 26
end % function
function storeInportSizes(this, hN)
    % 27 31
    % 28 31
    % 29 31
    ntwkRefNum = hN.RefNum;
    numInports = hN.numberofInputPorts;
    for i=1.0:numInports
        pirNodeId = horzcat(ntwkRefNum, '_', 'ip', num2str(minus(i, 1.0)));
        [width, height] = getPortDimensions(this);
        storeNodeSizes(this, pirNodeId, width, height);
    end % for
end % function
function storeOutportSizes(this, hN)
    % 39 43
    % 40 43
    % 41 43
    ntwkRefNum = hN.RefNum;
    numOutports = hN.numberofOutputPorts;
    for i=1.0:numOutports
        pirNodeId = horzcat(ntwkRefNum, '_', 'op', num2str(minus(i, 1.0)));
        [width, height] = getPortDimensions(this);
        storeNodeSizes(this, pirNodeId, width, height);
    end % for
end % function
function storeCompSizes(this, hN)
    % 51 55
    % 52 55
    % 53 55
    vComps = hN.Components;
    numComps = length(vComps);
    % 56 58
    for i=1.0:numComps
        % 58 60
        hC = vComps(i);
        pirNodeId = horzcat(hN.RefNum, '_', hC.RefNum);
        % 61 63
        if isSubNetwork(hC)
            [width, height] = getSubsystemSize(this, hC);
        else
            [width, height] = getBlockSize(this, hC);
        end % if
        % 67 69
        storeNodeSizes(this, pirNodeId, width, height);
    end % for
    % 70 72
end % function
function isntwk = isSubNetwork(hC)
    % 73 76
    % 74 76
    isntwk = isa(hC, 'hdlcoder.ntwk_instance_comp');
end % function
function [width, height] = getPortDimensions(this)
    % 78 86
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    width = this.PortWidth;
    height = this.PortHeight;
    % 87 89
end % function
function [width, height] = getSubsystemSize(this, hNtwkInstC)
    % 90 94
    % 91 94
    % 92 94
    SubsystemWidth = this.SubsystemWidth;
    SubsystemHeight = this.SubsystemHeight;
    % 95 97
    numInports = hNtwkInstC.numberofInputPorts;
    numOutports = hNtwkInstC.numberofOutputPorts;
    maxNumPorts = max(numInports, numOutports);
    % 99 102
    % 100 102
    width = SubsystemWidth;
    % 102 105
    % 103 105
    height = mtimes(maxNumPorts, SubsystemHeight);
    % 105 107
end % function
function [width, height] = getBlockSize(this, hC)
    % 108 112
    % 109 112
    % 110 112
    blkWidth = this.BlockWidth;
    blkHeight = this.BlockHeight;
    % 113 115
    numInports = hC.numberofInputPorts;
    numOutports = hC.numberofOutputPorts;
    maxNumPorts = max(numInports, numOutports);
    % 117 120
    % 118 120
    width = blkWidth;
    % 120 123
    % 121 123
    if gt(maxNumPorts, 1.0)
        % 123 126
        % 124 126
        height = mtimes(mtimes(maxNumPorts, .6), blkHeight);
    else
        height = blkHeight;
    end % if
    % 129 131
end % function
function storeNodeSizes(this, pirNodeId, width, height)
    % 132 144
    % 133 144
    % 134 144
    % 135 144
    % 136 144
    % 137 144
    % 138 144
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    width = mtimes(width, this.BlockSizeScale);
    height = mtimes(height, this.BlockSizeScale);
    % 145 147
    if isempty(this.pirLayoutInfo.nodeId)
        % 147 149
        this.pirLayoutInfo.nodeId{1.0} = pirNodeId;
        this.pirLayoutInfo.width = width;
        this.pirLayoutInfo.height = height;
    else
        % 152 154
        loc = strcmpi(pirNodeId, this.pirLayoutInfo.nodeId);
        % 154 156
        if any(loc)
            error(hdlerrormsgid('simulinkbackend'), 'duplicate component exists in the list! %s', pirNodeName)
        else
            this.pirLayoutInfo.nodeId{plus(end, 1.0)} = pirNodeId;
            this.pirLayoutInfo.width = horzcat(this.pirLayoutInfo.width, width);
            this.pirLayoutInfo.height = horzcat(this.pirLayoutInfo.height, height);
        end % if
    end % if
    % 163 165
end % function
function initSizeInfo(this)
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    this.pirLayoutInfo.nodeId = [];
    % 171 173
    this.pirLayoutInfo.width = [];
    this.pirLayoutInfo.height = [];
    % 174 176
end % function
