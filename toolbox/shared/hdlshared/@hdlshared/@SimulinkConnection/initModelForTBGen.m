function initModelForTBGen(this, inportNames, outportNames)
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
    this.SignalLogging = this.Model.SignalLogging;
    this.SignalLoggingName = this.Model.SignalLoggingName;
    % 13 14
    inportHandles = this.getInportSrcHandles;
    outportHandles = this.getOutportHandles;
    % 16 17
    if ne(length(inportHandles), length(inportNames)) || ne(length(outportHandles), length(outportNames))
        % 18 19
        error(hdlerrormsgid('simulinkconnection'), 'Mismatch in lengths of port names and handles');
        % 20 21
    end % if
    % 22 23
    for m=1.0:length(outportNames)
        % 24 25
        hOutport = outportNames(m).SLPortHandle;
        % 26 27
        this.OutportTestPoint{m} = get_param(hOutport, 'TestPoint');
        this.OutportDataLogging{m} = get_param(hOutport, 'DataLogging');
        this.OutportDataLoggingNameMode{m} = get_param(hOutport, 'DataLoggingNameMode');
        this.OutportDataLoggingName{m} = get_param(hOutport, 'DataLoggingName');
        % 31 32
    end % for
    % 33 34
    for m=1.0:length(inportNames)
        % 35 36
        hInport = inportNames(m).SLPortHandle;
        % 37 38
        this.InportTestPoint{m} = get_param(hInport, 'TestPoint');
        this.InportDataLogging{m} = get_param(hInport, 'DataLogging');
        this.InportDataLoggingNameMode{m} = get_param(hInport, 'DataLoggingNameMode');
        this.InportDataLoggingName{m} = get_param(hInport, 'DataLoggingName');
        % 42 43
    end % for
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    hcLoggingName = 'hdlcoder_tbdata';
    hcSignalLogging = 'on';
    hcTestPoint = 'on';
    hcDataLogging = 'on';
    hcDataLoggingNameMode = 'Custom';
    % 55 57
    % 56 57
    set_param(this.Model.handle, 'SignalLogging', hcSignalLogging);
    this.Model.SignalLoggingName = hcLoggingName;
    % 59 60
    for m=1.0:length(outportNames)
        % 61 62
        hOutport = outportNames(m).SLPortHandle;
        % 63 64
        set_param(hOutport, 'TestPoint', hcTestPoint);
        set_param(hOutport, 'DataLogging', hcDataLogging);
        set_param(hOutport, 'DataLoggingNameMode', hcDataLoggingNameMode);
        set_param(hOutport, 'DataLoggingname', outportNames(m).loggingPortName);
    end % for
    % 69 70
    for m=1.0:length(inportNames)
        % 71 72
        hInport = inportNames(m).SLPortHandle;
        % 73 74
        set_param(hInport, 'TestPoint', hcTestPoint);
        set_param(hInport, 'DataLogging', hcDataLogging);
        set_param(hInport, 'DataLoggingNameMode', hcDataLoggingNameMode);
        set_param(hInport, 'DataLoggingName', inportNames(m).loggingPortName);
    end % for
end % function
