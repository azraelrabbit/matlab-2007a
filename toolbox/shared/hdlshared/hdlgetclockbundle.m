function [clk, clken, reset] = hdlgetclockbundle(hN, hC, hS, up, down, offset)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if hdlisbeta2
        % 11 12
        if lt(nargin, 4.0)
            % 13 14
            offset = -1.0;
        end % if
        % 16 17
        hDriver = hdlcurrentdriver;
        % 18 19
        [clk, clken, reset] = hN.getClockBundle(hS, up, down, offset);
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        % 24 25
        if not(isempty(hC)) && isa(hC, 'hdlcoder.black_box_comp') && hC.isInstantiable
            cp = hC.addInputPort(clk.Name, 0.0);
            cep = hC.addInputPort(clken.Name, 1.0);
            rp = hC.addInputPort(reset.Name, 2.0);
            % 29 32
            % 30 32
            % 31 32
            hC.setInputPortName(1.0, hdlgetparameter('clockenablename'));
            % 33 34
            clk.addReceiver(cp);
            clken.addReceiver(cep);
            reset.addReceiver(rp);
        end % if
        % 38 42
        % 39 42
        % 40 42
        % 41 42
        if not(isSignalInList(hDriver.ClockList, clk))
            hDriver.ClockList = cat(1.0, hDriver.ClockList(:), clk);
        end % if
        % 45 46
        if not(isSignalInList(hDriver.ClockEnableList, clken))
            hDriver.ClockEnableList = cat(1.0, hDriver.ClockEnableList(:), clken);
        end % if
        % 49 50
        if not(isSignalInList(hDriver.ResetList, reset))
            hDriver.ResetList = cat(1.0, hDriver.ResetList(:), reset);
        end % if
    else
        % 54 55
        error(horzcat('Internal error: Invalid call to ', mfilename));
    end % if
end % function
function found = isSignalInList(list, sig)
    % 59 60
    found = false;
    for ii=1.0:length(list)
        if strcmp(sig.RefNum, list(ii).RefNum)
            found = true;
            break
        end % if
    end % for
end % function
