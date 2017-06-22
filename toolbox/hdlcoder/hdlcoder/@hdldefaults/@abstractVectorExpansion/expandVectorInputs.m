function ins = expandVectorInputs(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    ninputs = hC.numberofInputPorts;
    % 7 9
    vectlens = zeros(1.0, ninputs);
    for ii=1.0:ninputs
        inp = hC.InputPorts(ii).getSignal;
        vectlens(ii) = max(hdlsignalvector(inp));
    end % for
    maxvect = max(vectlens);
    % 14 16
    if not(all(eq(vectlens(ne(vectlens, 0.0)), maxvect)))
        error(hdlcodererrormsgid('unsupported'), 'Blocks with mixed length vector inputs are  not supported in %s', mfilename);
        % 17 20
        % 18 20
    end % if
    % 20 22
    if eq(ninputs, 1.0)
        ins = hC.InputPorts(1.0).getSignal;
    else
        if all(eq(vectlens, 0.0))
            ins = [];
            for ii=1.0:ninputs
                ins = cat(1.0, ins, hC.InputPorts(ii).getSignal);
            end % for
        else
            ins = [];
            for ii=1.0:ninputs
                if ne(vectlens(ii), 0.0)
                    ins = cat(1.0, ins, hdlexpandvectorsignal(hC.InputPorts(ii).getSignal));
                else
                    tmp = [];
                    for jj=1.0:maxvect
                        tmp = cat(2.0, tmp, hC.InputPorts(ii).getSignal);
                    end % for
                    ins = cat(1.0, ins, tmp);
                end % if
            end % for
        end % if
    end % if
end % function
