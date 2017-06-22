function applySimulinkLayoutInfo(this, mdlFile, hN)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    hdldisp(sprintf('Applying Layout from source model...'), 3.0);
    % 9 11
    targetPathName = mdlFile;
    % 11 15
    % 12 15
    % 13 15
    numInports = hN.numberofInputPorts;
    vInports = hN.InputPorts;
    % 16 18
    for i=1.0:numInports
        hP = vInports(i);
        % 19 21
        if not(isValidPort(hP))
            continue;
        end
        % 23 25
        origBlockPos = get_param(horzcat(hN.Name, '/', hP.Name), 'Position');
        targetSlBlockName = horzcat('', targetPathName, '/', hP.Name, '');
        set_param(targetSlBlockName, 'Position', origBlockPos);
        % 27 29
    end % for
    % 29 31
    vComps = hN.Components;
    numComps = length(vComps);
    % 32 34
    for i=1.0:numComps
        % 34 36
        hC = vComps(i);
        if not(isValidComponent(this, hC))
            continue;
        end
        % 39 41
        origBlockPos = get_param(horzcat(hN.Name, '/', hC.Name), 'Position');
        cUserName = hC.Name;
        targetSlBlockName = horzcat('', targetPathName, '/', cUserName, '');
        set_param(targetSlBlockName, 'Position', origBlockPos);
        % 44 46
    end % for
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    numOutports = hN.numberofOutputPorts;
    vOutports = hN.OutputPorts;
    % 52 54
    for i=1.0:numOutports
        hP = vOutports(i);
        % 55 57
        origBlockPos = get_param(horzcat(hN.Name, '/', hP.Name), 'Position');
        targetSlBlockName = horzcat('', targetPathName, '/', hP.Name, '');
        set_param(targetSlBlockName, 'Position', origBlockPos);
        % 59 61
    end % for
    % 61 64
    % 62 64
end
function valid = isValidPort(hP)
    % 65 68
    % 66 68
    valid = 1.0;
    if not(isempty(hP.getSignal)) && hP.getSignal.Synthetic
        valid = 0.0;
    end
end
function valid = isValidComponent(this, hC)
    % 73 76
    % 74 76
    valid = 1.0;
    % 76 78
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
            else
                if isSyntheticBlock(this, hC.SimulinkHandle)
                    valid = 0.0;
                end
            end
        end
    end
end
