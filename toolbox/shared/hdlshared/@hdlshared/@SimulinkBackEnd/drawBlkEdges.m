function drawBlkEdges(this, mdlFile, hN)
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
    hdldisp(sprintf('Drawing block edges...'), 3.0);
    % 12 15
    % 13 15
    slAutoRoute = strcmpi(this.AutoRoute, 'yes');
    % 15 17
    pathName = mdlFile;
    % 17 19
    vSignals = hN.Signals;
    numSignals = length(vSignals);
    % 20 23
    % 21 23
    isbeta2 = 0.0;
    % 23 25
    for i=1.0:numSignals
        % 25 27
        hS = vSignals(i);
        hSName = hS.Name;
        if hS.Synthetic
            continue;
        end
        % 31 33
        numDrivers = hS.numberofDrivers;
        vDrvPorts = hS.getDrivers;
        % 34 36
        numRecvrs = hS.numberofReceivers;
        vRcvPorts = hS.getReceivers;
        % 37 39
        for j=1.0:numDrivers
            % 39 41
            hDrvP = vDrvPorts(j);
            % 41 43
            hDrvPOwner = hDrvP.Owner;
            % 43 45
            if not(isaValidBlock(this, hDrvPOwner))
                continue;
            end
            % 47 49
            if isa(hDrvPOwner, 'hdlcoder.network')
                % 49 51
                drvPortName = hDrvP.Name;
                drvPortIdx = 1.0;
            else
                drvPortName = hDrvPOwner.Name;
                drvPortIdx = plus(hDrvP.PortIndex, 1.0);
            end
            % 56 58
            for k=1.0:numRecvrs
                % 58 60
                hRcvP = vRcvPorts(k);
                % 60 62
                hRcvPOwner = hRcvP.Owner;
                % 62 64
                if isa(hRcvPOwner, 'hdlcoder.buffer_comp')
                    hRcvP = hRcvPOwner.getOutputPortSignal(0.0).getReceivers;
                    hRcvPOwner = hRcvP.Owner;
                end
                if isa(hRcvPOwner, 'hdlcoder.typechange_comp')
                    tcReceivers = hRcvP.Owner.getOutputPortSignal(0.0).getReceivers;
                    for m=1.0:length(tcReceivers)
                        hRcvPOwner = tcReceivers(m).Owner;
                        if isa(hRcvPOwner, 'hdlcoder.typechange_comp')
                            hrcvp = hRcvPOwner.getOutputPortSignal(0.0).getReceivers;
                            hRcvPOwner = hrcvp.Owner;
                        else
                            hrcvp = tcReceivers(m);
                        end
                        addLine(pathName, hRcvPOwner, hrcvp, drvPortName, drvPortIdx, isbeta2, slAutoRoute);
                        % 78 80
                    end % for
                    continue;
                end
                % 82 84
                addLine(pathName, hRcvPOwner, hRcvP, drvPortName, drvPortIdx, isbeta2, slAutoRoute);
                % 84 86
            end % for
            % 86 88
        end % for
        % 88 90
    end % for
    % 90 92
end
function addLine(pathName, hRcvPOwner, hRcvP, drvPortName, drvPortIdx, isbeta2, slAutoRoute)
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    if isa(hRcvPOwner, 'hdlcoder.network')
        % 98 100
        rcvPortName = hRcvP.Name;
        rcvPortIdx = 1.0;
    else
        rcvPortName = hRcvPOwner.Name;
        rcvPortIdx = plus(hRcvP.PortIndex, 1.0);
        if isa(hRcvPOwner, 'hdlcoder.ntwk_instance_comp') && isbeta2
            rcvPortIdx = minus(rcvPortIdx, 3.0);
            if lt(rcvPortIdx, 1.0)
                rcvPortIdx = 1.0;
            end
        end
    end
    % 111 113
    srcPort = horzcat(drvPortName, '/', num2str(drvPortIdx));
    dstPort = horzcat(rcvPortName, '/', num2str(rcvPortIdx));
    % 114 116
    if slAutoRoute
        add_line(pathName, srcPort, dstPort, 'autorouting', 'on');
    else
        add_line(pathName, srcPort, dstPort);
    end
    % 120 122
end
function valid = isaValidBlock(this, hC)
    % 123 127
    % 124 127
    % 125 127
    valid = 1.0;
    if isa(hC, 'hdlcoder.buffer_comp') || isa(hC, 'hdlcoder.typechange_comp')
        % 128 130
        valid = 0.0;
    else
        if gt(hC.SimulinkHandle, 0.0)
            if isSyntheticBlock(this, hC.SimulinkHandle)
                valid = 0.0;
            end
        end
    end
end
