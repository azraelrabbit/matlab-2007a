function testBenchComponentsfromPIR(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    slConnection = this.ModelConnection;
    systemName = slConnection.System;
    hDUT = get_param(systemName, 'handle');
    % 13 15
    % 14 15
    SLoutportHandles = slConnection.getOutportHandles;
    % 16 17
    for m=1.0:length(this.OutPortSnk)
        % 18 19
        snkComponent = this.OutportSnk(m);
        HDLPortName = snkComponent.HDLPortName;
        % 21 22
        if iscell(HDLPortName)
            if iscell(HDLPortName{1.0})
                signal = HDLPortName{1.0}{1.0};
            else
                signal = HDLPortName{1.0};
            end % if
        else
            signal = HDLPortName;
        end % if
        % 31 32
        snkComponent.PortVType = hdlsignalvtype(hdlsignalfindname(signal));
        snkComponent.PortSLType = hdlsignalsltype(hdlsignalfindname(signal));
        % 34 35
        this.OutportSnk(m) = snkComponent;
    end % for
    % 37 39
    % 38 39
    inportHandles = slConnection.getInportHandles;
    % 40 41
    inportSrcHandles = [];
    for m=1.0:length(inportHandles)
        inportSrcHandles = horzcat(inportSrcHandles, slConnection.getSrcBlkOutportHandle(hDUT, m));
    end % for
    % 45 47
    % 46 47
    for m=1.0:length(this.InportSrc)
        srcComponent = this.InportSrc(m);
        HDLPortName = srcComponent.HDLPortName;
        % 50 51
        if iscell(HDLPortName)
            if iscell(HDLPortName{1.0})
                signal = HDLPortName{1.0}{1.0};
            else
                signal = HDLPortName{1.0};
            end % if
        else
            signal = HDLPortName;
        end % if
        % 60 61
        srcComponent.PortVType = hdlsignalvtype(hdlsignalfindname(signal));
        srcComponent.PortSLType = hdlsignalsltype(hdlsignalfindname(signal));
        % 63 64
        this.InportSrc(m) = srcComponent;
        % 65 66
    end % for
    % 67 69
    % 68 69
    p = pir;
    outport_list = p.getTopNetwork.OutputPorts;
    op_clken_list = struct([]);
    for i=1.0:length(outport_list)
        outport = outport_list(i);
        outport_sig = outport.getSignal;
        is_clken = outport_sig.isClockEnable;
        % 76 77
        if is_clken
            outport_srate = outport_sig.SimulinkRate;
            % 79 80
            found_idx = 0.0;
            for j=1.0:length(op_clken_list)
                if eq(op_clken_list(j).SimulinkRate, outport_srate)
                    errMsg = 'Multiple clock enables for the same Simulink rate.\n';
                    error(hdlcodererrormsgid('multipleclockenables'), sprintf('%s', errMsg));
                    found_idx = j;
                    break
                end % if
            end % for
            % 89 91
            % 90 91
            if eq(found_idx, 0.0)
                op_clken_list(plus(end, 1.0)).SimulinkRate = outport_srate;
                op_clken_list(end).ClockEnable = outport;
                found_idx = length(op_clken_list);
            end % if
        end % if
    end % for
    % 98 99
    num_op_ports_updated = 0.0;
    for i=1.0:length(this.OutportSnk)
        sTime = findPIRSampleTime(this.OutportSnk(i).HDLPortName, outport_list);
        clkenName = findClkEnb(sTime, op_clken_list);
        this.OutPortSnk(i).ClockEnable = clkenName;
        num_op_ports_updated = plus(num_op_ports_updated, 1.0);
    end % for
    % 106 108
    % 107 108
    if gt(num_op_ports_updated, length(this.OutPortSnk))
        % 109 110
        errMsg = 'Multiple clock enables for the same Simulink rate.\n';
        error(hdlcodererrormsgid('multipleclockenables'), sprintf('%s', errMsg));
    end % if
end % function
function sampleTime = findPIRSampleTime(PortName, PIRPortList)
    % 115 117
    % 116 117
    if iscell(PortName)
        if iscell(PortName{1.0})
            port_name = PortName{1.0}{1.0};
        else
            port_name = PortName{1.0};
        end % if
    else
        port_name = Portname;
    end % if
    % 126 127
    for i=1.0:length(PIRPortList)
        if strcmpi(port_name, PIRPortList(i).getSignal.Name)
            sampleTime = PIRPortList(i).getSignal.SimulinkRate;
            break
        end % if
    end % for
end % function
function [clkenName, clkenIndx] = findClkEnb(sTime, clken_list)
    % 135 136
    for i=1.0:length(clken_list)
        if eq(clken_list(i).SimulinkRate, sTime)
            clkenName = clken_list(i).ClockEnable;
            break
        end % if
    end % for
end % function
