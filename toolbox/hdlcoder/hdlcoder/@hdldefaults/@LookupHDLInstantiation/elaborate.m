function elaborate(this, hN, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    [hNewC, hNewNet] = elaborateToNetworkInst(this, hN, hC);
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hNewC.elaborate(hNewNet);
end % function
