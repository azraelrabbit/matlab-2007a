function makehdltb(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    slConnection = this.ModelConnection;
    originalModelName = slConnection.ModelName;
    SystemStartNodeName = slConnection.StartNode.NodeName;
    % 11 13
    % 12 13
    extclkname = hdlgetparameter('clockenablename');
    p = pir;
    hN = p.getTopNetwork();
    hS = hN.findSignal('name', extclkname);
    if not(isempty(hS))
        vt = hdlgetparameter('base_data_type');
        hdlsignalsetvtype(hS, vt);
    end % if
    % 21 24
    % 22 24
    % 23 24
    hdldrv = hdlcurrentdriver;
    outfilename = hdldrv.BackEnd.OutModelFile;
    genModelSystemName = horzcat(outfilename, '/', SystemStartNodeName);
    slConnection = hdlshared.SimulinkConnection(genModelSystemName);
    % 28 30
    % 29 30
    slConnection.initModel;
    % 31 32
    slConnection.termModel;
    % 33 34
    try
        % 35 37
        % 36 37
        this.testBenchComponents(slConnection);
        % 38 40
        % 39 40
        slConnection.initModelForTBGen(this.InportSrc, this.OutportSnk);
        % 41 43
        % 42 43
        slConnection.simulateModel;
    catch
        % 45 47
        % 46 47
        savederr = lasterror;
        % 48 50
        % 49 50
        slConnection.restoreModelFromTBGen;
        % 51 52
        rethrow(savederr);
        % 53 54
    end % try
    % 55 57
    % 56 57
    slConnection.restoreModelFromTBGen;
    % 58 60
    % 59 60
    set_param(0.0, 'CurrentSystem', originalModelName);
    % 61 63
    % 62 63
    this.collectTestBenchData(hdlcoder_tbdata);
    % 64 65
    this.testBenchComponentsfromPIR;
    % 66 67
    this.tbopenfile;
    % 68 69
    this.generatehdlCoderTB;
    % 70 71
    this.tbclosefile;
    % 72 73
end % function
