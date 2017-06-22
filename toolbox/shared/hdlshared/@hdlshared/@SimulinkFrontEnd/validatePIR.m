function checks = validatePIR(this, hPir)
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
    checks = struct('path', {}, 'type', {}, 'message', {}, 'level', {});
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    vNetworks = hPir.Networks;
    numNetworks = length(vNetworks);
    % 18 19
    for ii=1.0:numNetworks
        hN = vNetworks(ii);
        vComps = hN.Components;
        numComps = length(vComps);
        for jj=1.0:numComps
            hC = vComps(jj);
            if isa(hC, 'hdlcoder.block_comp')
                v = hC.validate();
                for kk=1.0:length(v)
                    if v(kk).Status
                        checks(plus(end, 1.0)).path = getfullname(hC.SimulinkHandle);
                        checks(end).type = 'block';
                        checks(end).message = v(kk).Message;
                        if eq(v(kk).Status, 1.0)
                            checks(end).level = 'Error';
                        else
                            checks(end).level = 'Warning';
                        end % if
                    end % if
                end % for
            end % if
        end % for
    end % for
    % 42 43
end % function
