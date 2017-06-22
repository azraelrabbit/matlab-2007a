function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlcode = hdlcodeinit;
    % 8 10
    % 9 10
    fixverilogtypes(hC);
    % 11 12
    [clk, nstates, outputsignals, outputoffsets] = this.designTimingController(hC);
    % 13 14
    if lt(nstates, 2.0)
        % 15 17
        % 16 17
        hdlbody = [];
        for i=1.0:length(outputsignals)
            hdlbody = horzcat(hdlbody, hdlsignalassignment(getSystemClockEnable(hC), outputsignals(i), [], []));
        end % for
    else
        % 22 24
        % 23 24
        [cntvtype, cntsltype] = hdlgettypesfromsizes(ceil(log2(nstates)), 0.0, 0.0);
        [idxname, counter_out] = hdlnewsignal('counter_out', 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
        % 26 27
        hdlregsignal(counter_out);
        % 28 30
        % 29 30
        ProcessName = 'Counter';
        % 31 33
        % 32 33
        oldclken = hdlgetcurrentclockenable;
        sysclken = getSystemClockEnable(hC);
        hdladdclockenablesignal(sysclken);
        hdlsetcurrentclockenable(sysclken);
        % 37 38
        [hdlbody, hdlsignals] = hdlcounter(counter_out, nstates, ProcessName, 1.0, 0.0, outputoffsets);
        % 39 41
        % 40 41
        for i=1.0:length(outputsignals)
            hdlbody = horzcat(hdlbody, hdlsignalassignment(hdlsignals(i), outputsignals(i), [], []));
        end % for
        % 44 46
        % 45 46
        hdlsetcurrentclockenable(oldclken);
        % 47 48
    end % if
    % 49 50
    updateTimingControllerInfo(hC.Name, clk, outputoffsets);
    % 51 52
    hdlcode.arch_body_blocks = hdlbody;
end % function
function updateTimingControllerInfo(name, clk, outputoffsets)
    % 55 57
    % 56 57
    tcinfo.topname = name;
    tcinfo.requestedclkfreq = clk;
    tcinfo.offsets = outputoffsets;
    tcinfo.latency = 0.0;
    % 61 63
    % 62 63
    currentDriver = hdlcurrentdriver;
    currentDriver.setTimingControllerInfo(tcinfo);
end % function
function sig = getSystemClockEnable(hC)
    % 67 69
    % 68 69
    sig = hC.InputPorts(3.0).getSignal;
end % function
function fixverilogtypes(hC)
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    if hdlgetparameter('isverilog')
        insignals = hdlinportsignals;
        for ii=1.0:length(insignals)
            hS = insignals(ii);
            vt = hdlgetparameter('base_data_type');
            hdlsignalsetvtype(hS, vt);
        end % for
        outsignals = hdloutportsignals;
        for ii=1.0:length(outsignals)
            hS = outsignals(ii);
            vt = hdlgetparameter('base_data_type');
            hdlsignalsetvtype(hS, vt);
        end % for
    end % if
end % function
