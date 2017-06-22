function [hNewC, hNewNet] = elaborateToNetworkInst(this, hN, hC)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    hDriver = hdlcurrentdriver;
    hPir = hDriver.PirInstance;
    % 19 20
    hNewNet = hPir.addNetwork;
    hNewNet.FullPath = horzcat(hN.Name, '/', hC.Name);
    hNewNet.Name = horzcat(hN.Name, '/', hC.Name);
    % 23 24
    for ii=1.0:length(hC.InputPorts)
        hNewNet.addInputPort(hC.InputPorts(ii).Name);
    end % for
    % 27 28
    for ii=1.0:length(hC.OutputPorts)
        hNewNet.addOutputPort(hC.OutputPorts(ii).Name);
    end % for
    % 31 32
    block = hdlgetblocklibpath(hC.SimulinkHandle);
    if isempty(block)
        warning(hdlcodererrormsgid('tagnotfound'), sprintf('Could not find tag for the block %s', hC.Name));
        % 35 36
    end % if
    % 37 39
    % 38 39
    hNewC = hNewNet.addComponent('block_comp', length(hC.InputPorts), length(hC.OutputPorts), block);
    % 40 42
    % 41 42
    hNewC.Name = hC.Name;
    hNewC.SimulinkHandle = hC.SimulinkHandle;
    % 44 45
    hNewC.setImplementation(hDriver.ConfigManager.getDefaultImplementation(block));
    % 46 47
    for ii=1.0:length(hC.InputPorts)
        insig = hC.InputPorts(ii).getSignal;
        hsig = hNewNet.addSignal;
        hsig.Name = insig.Name;
        hsig.Type = insig.Type;
        hsig.VType(insig.VType);
        hsig.Imag(insig.Imag);
        hsig.SimulinkHandle = insig.SimulinkHandle;
        hsig.SimulinkRate = insig.SimulinkRate;
        hsig.addDriver(hNewNet, minus(ii, 1.0));
        hsig.addReceiver(hNewC, minus(ii, 1.0));
    end % for
    % 59 60
    for ii=1.0:length(hC.OutputPorts)
        outsig = hC.OutputPorts(ii).getSignal;
        hsig = hNewNet.addSignal;
        hsig.Name = outsig.Name;
        hsig.Type = outsig.Type;
        hsig.VType(outsig.VType);
        hsig.Imag(outsig.Imag);
        hsig.SimulinkHandle = outsig.SimulinkHandle;
        hsig.SimulinkRate = outsig.SimulinkRate;
        hsig.addDriver(hNewC, minus(ii, 1.0));
        hsig.addReceiver(hNewNet, minus(ii, 1.0));
    end % for
    % 72 73
    hNetworkComp = hN.addComponent('ntwk_instance_comp', hNewNet);
    hNetworkComp.Name = hC.Name;
    hNetworkComp.SimulinkHandle = hC.SimulinkHandle;
    % 76 77
    hN.replaceComponent(hC, hNetworkComp);
end % function
