function applyDotLayoutInfo(this, mdlFile, hN)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hdldisp(sprintf('Applying Dot Layout...'), 3.0);
    % 8 10
    pathName = mdlFile;
    % 10 14
    % 11 14
    % 12 14
    ntwkRefNum = hN.RefNum;
    % 14 16
    numInports = hN.numberofInputPorts;
    vInports = hN.InputPorts;
    % 17 19
    for i=1.0:numInports
        hP = vInports(i);
        % 20 22
        if not(isempty(hP.getSignal)) && hP.getSignal.Synthetic
            continue;
        end
        % 24 26
        nodeName = horzcat(ntwkRefNum, '_', 'ip', num2str(minus(i, 1.0)));
        [l, t, r, b] = getSLDimensions(this, nodeName);
        blockPos = horzcat(l, t, r, b);
        % 28 30
        slBlockName = horzcat('', pathName, '/', hP.Name, '');
        % 30 32
        set_param(slBlockName, 'Position', blockPos);
        set_param(slBlockName, 'Orientation', 'right');
        % 33 35
    end % for
    % 35 37
    vComps = hN.Components;
    numComps = length(vComps);
    % 38 40
    for i=1.0:numComps
        % 40 42
        hC = vComps(i);
        % 42 44
        if not(isValidComponent(this, hC))
            continue;
        end
        % 46 48
        nodeName = horzcat(ntwkRefNum, '_', hC.RefNum);
        % 48 50
        [l, t, r, b] = getSLDimensions(this, nodeName);
        blockPos = horzcat(l, t, r, b);
        % 51 53
        cUserName = hC.Name;
        % 53 55
        slBlockName = horzcat('', pathName, '/', cUserName, '');
        % 55 57
        set_param(slBlockName, 'Position', blockPos);
        set_param(slBlockName, 'Orientation', 'right');
        % 58 60
    end % for
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    numOutports = hN.numberofOutputPorts;
    vOutports = hN.OutputPorts;
    % 66 68
    for i=1.0:numOutports
        hP = vOutports(i);
        % 69 71
        nodeName = horzcat(ntwkRefNum, '_', 'op', num2str(minus(i, 1.0)));
        [l, t, r, b] = getSLDimensions(this, nodeName);
        blockPos = horzcat(l, t, r, b);
        % 73 75
        slBlockName = horzcat('', pathName, '/', hP.Name, '');
        % 75 77
        set_param(slBlockName, 'Position', blockPos);
        set_param(slBlockName, 'Orientation', 'right');
        % 78 80
    end % for
    % 80 83
    % 81 83
end
function valid = isValidComponent(this, hC)
    % 84 88
    % 85 88
    % 86 88
    valid = 1.0;
    % 88 90
    if strcmp(this.hPir.getTimingControllerName, hC.Name)
        valid = 0.0;
        return
    else
        if isa(hC, 'hdlcoder.buffer_comp') || isa(hC, 'hdlcoder.typechange_comp')
            valid = 0.0;
        else
            if isa(hC, 'hdlcoder.const_comp')
                if isempty(hC.getOutputPortSignal(0.0).getReceivers)
                    valid = 0.0;
                end
            end
        end
    end
end
function [l, t, r, b] = getSLDimensions(this, pirNodeName)
    % 105 108
    % 106 108
    loc = strcmp(fixNameForDot(this, pirNodeName), this.pirLayoutInfo.nodeId);
    % 108 110
    if any(loc)
        if ne(sum(loc), 1.0)
            error(hdlerrormsgid('simulinkbackend'), 'Graph node Name conflict: multiple nodes found for %s', pirNodeName);
        else
            % 113 116
            % 114 116
            l = this.pirLayoutInfo.left(loc);
            t = this.pirLayoutInfo.top(loc);
            r = this.pirLayoutInfo.right(loc);
            b = this.pirLayoutInfo.bottom(loc);
            % 119 121
        end
    else
        error(hdlerrormsgid('simulinkbackend'), 'Graph node entry not found for %s', pirNodeName);
    end
    % 124 126
end
