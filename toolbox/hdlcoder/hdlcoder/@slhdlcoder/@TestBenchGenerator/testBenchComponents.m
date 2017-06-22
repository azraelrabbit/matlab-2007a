function testBenchComponents(this, slConnection)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    component.SLBlockName = '';
    component.loggingPortName = '';
    component.SLPortHandle = -1.0;
    component.SLSampleTime = {};
    component.HDLSampleTime = {};
    component.timeseries = {};
    component.data = {};
    component.HDLPortName = {};
    component.PortVType = {};
    component.PortSLType = {};
    component.datalength = {};
    component.dataIsConstant = 0.0;
    component.HDLNewType = {};
    component.VectorPortSize = {};
    component.procedureName = {};
    component.procedureInput = {};
    component.procedureOutput = {};
    component.ClockEnable = '';
    component.ClockEnableSigIdx = '';
    % 27 28
    vportMap.expNameList = {};
    vportMap.Handle = [];
    % 30 31
    systemName = slConnection.System;
    hDUT = get_param(systemName, 'handle');
    % 33 35
    % 34 35
    SLoutportHandles = slConnection.getOutportHandles;
    % 36 37
    this.OutportSnk = [];
    SLportHandle = [];
    for m=1.0:length(SLoutportHandles)
        snkComponent = component;
        SLportHandle = SLoutportHandles(m);
        HDLPortName = getoutportnamesfromblock(hDUT, SLportHandle);
        snkComponent.SLPortHandle = SLportHandle;
        snkComponent.HDLPortName{plus(end, 1.0)} = HDLPortName;
        % 45 46
        if iscell(HDLPortName)
            snkComponent.loggingPortName = HDLPortName{1.0};
            for ii=1.0:length(HDLPortName)
                vportMap.expNameList{plus(end, 1.0)} = HDLPortName{ii};
                vportMap.Handle = horzcat(vportMap.Handle, SLportHandle);
            end % for
        else
            snkComponent.loggingPortName = HDLPortName;
            vportMap.expNameList{plus(end, 1.0)} = HDLPortName;
            vportMap.Handle = horzcat(vportMap.Handle, SLportHandle);
        end % if
        this.OutportSnk = horzcat(this.OutportSnk, snkComponent);
        this.OutportNameList{plus(end, 1.0)} = snkComponent.loggingPortName;
        % 59 60
    end % for
    % 61 63
    % 62 63
    inportHandles = slConnection.getInportHandles;
    % 64 65
    inportSrcHandles = [];
    for m=1.0:length(inportHandles)
        inportSrcHandles = horzcat(inportSrcHandles, slConnection.getSrcBlkOutportHandle(hDUT, m));
    end % for
    % 69 70
    this.InportSrc = [];
    for m=1.0:length(inportSrcHandles)
        if ne(inportSrcHandles(m), -1.0)
            srcComponent = component;
            [srcName, LogName] = findSrcName(inportSrcHandles(m));
            srcComponent.SLBlockName = srcName;
            srcComponent.loggingPortName = hdllegalnamersvd(LogName);
            SLportHandle = inportSrcHandles(m);
            srcComponent.SLPortHandle = inportSrcHandles(m);
            for i=1.0:length(inportSrcHandles)
                if eq(inportSrcHandles(i), inportSrcHandles(m))
                    HDLPortName = getinportnamesfromblock(hDUT, inportHandles(i));
                    srcComponent.HDLPortName{plus(end, 1.0)} = HDLPortName;
                    if iscell(HDLPortName)
                        for ii=1.0:length(HDLPortName)
                            vportMap.expNameList{plus(end, 1.0)} = HDLPortName{ii};
                            vportMap.Handle = horzcat(vportMap.Handle, SLportHandle);
                        end % for
                    else
                        vportMap.expNameList{plus(end, 1.0)} = HDLPortName;
                        vportMap.Handle = horzcat(vportMap.Handle, SLportHandle);
                    end % if
                end % if
            end % for
            this.InportSrc = horzcat(this.InportSrc, srcComponent);
            this.InportNameList{plus(end, 1.0)} = srcComponent.SLBlockName;
            inportSrcHandles(eq(inportSrcHandles, inportSrcHandles(m))) = -1.0;
        end % if
    end % for
    % 99 102
    % 100 102
    % 101 102
    if isempty(this.InportSrc) && isempty(this.OutportSnk)
        error(hdlcodererrormsgid('notbinputsoroutputs'), 'Cannot generate a testbench - there are no inputs or outputs.\n');
        % 104 105
    end % if
    % 106 107
    this.VectorPortNameMap = vportMap;
end % function
function portnames = getinportnamesfromblock(hDUT, h_in)
    % 110 111
    blkOrigPortNum = get_param(h_in, 'PortNumber');
    % 112 113
    if strcmp(hdlcodegenmode, 'slcoder_beta2')
        % 114 115
        p = pir;
        hN = p.getTopNetwork;
        pirOrigPortNum = minus(blkOrigPortNum, 1.0);
        if gt(blkOrigPortNum, hN.numberofInputPorts)
            error(hdlcodererrormsgid('wrongnumberofports'), 'The test bench''s drivers do not match the DUT''s inputs.');
        else
            % 121 122
            portnames = hN.getHDLInputPortNames(pirOrigPortNum);
        end % if
    else
        % 125 127
        % 126 127
        portnames = horzcat('mysignal_in_', num2str(blkOrigPortNum));
        insigs = hdlinportsignals;
        handles = hdlupperporthandle(hDUT, insigs);
        % 130 131
        index = find(eq(handles, h_in));
        if not(isempty(index))
            p_index = insigs(index);
            portnames = hdlsignalname(p_index);
        end % if
        % 136 137
    end % if
end % function
function portnames = getoutportnamesfromblock(hDUT, h_out)
    % 140 141
    blkOrigPortNum = get_param(h_out, 'PortNumber');
    % 142 143
    if strcmp(hdlcodegenmode, 'slcoder_beta2')
        % 144 145
        p = pir;
        hN = p.getTopNetwork;
        pirOrigPortNum = minus(blkOrigPortNum, 1.0);
        if gt(blkOrigPortNum, hN.numberofOutputPorts)
            error(hdlcodererrormsgid('wrongnumberofports'), 'The test bench''s receivers do not match the DUT''s outputs.');
        else
            % 151 152
            portnames = hN.getHDLOutputPortNames(pirOrigPortNum);
        end % if
    else
        % 155 157
        % 156 157
        portnames = horzcat('mysignal_out_', num2str(blkOrigPortNum));
        outsigs = hdloutportsignals;
        handles = hdlupperporthandle(hDUT, outsigs);
        % 160 163
        % 161 163
        % 162 163
        index = find(eq(handles, h_out));
        if not(isempty(index))
            p_index = outsigs(index);
            portnames = hdlsignalname(p_index);
        end % if
        % 168 169
    end % if
end % function
function [srcName, LogName] = findSrcName(SLHandle)
    blkName = get_param(get_param(SLHandle, 'Parent'), 'Name');
    portNumber = get_param(SLHandle, 'PortNumber');
    srcName = regexprep(regexprep(blkName, '\s', ''), '-', '_');
    LogName = horzcat(srcName, '_', num2str(portNumber));
end % function
