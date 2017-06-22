function elaboratePIR(this, hPir)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hdldisp('Begin PIR elaboration', 3.0);
    % 12 14
    % 13 14
    vNetworks = hPir.Networks;
    numNetworks = length(vNetworks);
    % 16 17
    for i=1.0:numNetworks
        hN = vNetworks(i);
        vComps = hN.Components;
        numComps = length(vComps);
        for i=1.0:numComps
            hC = vComps(i);
            if isa(hC, 'hdlcoder.block_comp')
                hC.elaborate(hN);
            end % if
        end % for
    end % for
    % 28 30
    % 29 30
    hdldisp('Finished PIR elaboration', 3.0);
    % 31 33
    % 32 33
end % function
