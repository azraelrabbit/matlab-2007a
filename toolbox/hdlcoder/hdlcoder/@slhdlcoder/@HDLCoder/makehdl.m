function makehdl(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(builtin('license', 'checkout', 'Simulink_HDL_Coder')) || not(hdlcoderui.isslhdlcinstalled)
        % 8 11
        % 9 11
        error(hdlcodererrormsgid('nolicenseavailable'), 'Unable to check out a license for the Simulink HDL Coder.');
        % 11 13
    end % if
    % 13 17
    % 14 17
    % 15 17
    cur_lasterror = lasterror;
    % 17 20
    % 18 20
    oldDriver = hdlcurrentdriver;
    hdlcurrentdriver(this);
    % 21 24
    % 22 24
    oldMode = hdlcodegenmode;
    hdlcodegenmode('slcoder');
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    this.commitParams;
    % 31 35
    % 32 35
    % 33 35
    current_system = get_param(0.0, 'CurrentSystem');
    % 35 37
    try
        % 37 40
        % 38 40
        this.connectToModel;
        slConnection = this.ModelConnection;
        % 41 44
        % 42 44
        this.initState;
        % 44 48
        % 45 48
        % 46 48
        this.ConfigManager.displayUserConfigMsgs;
        % 48 50
        if this.getParameter('checkhdl')
            [p, slfrontend] = runPirFrontEnd(this, slConnection, 1.0);
            this.checkhdl(slConnection, slfrontend);
        else
            [p, slfrontend] = runPirFrontEnd(this, slConnection);
        end % if
        % 55 57
        dumpBaseName = hdllegalname(p.getTopNetwork().Name);
        debugDumpXML(this, dumpBaseName, '.postPirFrontEnd.xml');
        % 58 61
        % 59 61
        slfrontend.elaboratePIR(p);
        debugDumpXML(this, dumpBaseName, '.postElaborate.xml');
        % 62 65
        % 63 65
        this.generateModel;
        % 65 67
        if strcmpi(this.getParameter('codegenerationoutput'), 'DisplayGeneratedModelOnly')
            % 67 70
            % 68 70
            success = false;
            this.cleanup(oldDriver, oldMode, success);
            % 71 75
            % 72 75
            % 73 75
            lasterror(cur_lasterror);
            % 75 77
            return;
        end % if
        % 78 81
        % 79 81
        this.hdlMakeCodegendir;
        % 81 85
        % 82 85
        % 83 85
        goldenModelName = slfrontend.SimulinkConnection.ModelName;
        set_param(0.0, 'CurrentSystem', goldenModelName);
        hdlcurrentdriver(goldenModelName);
        % 87 89
        topNtwk = p.getTopNetwork;
        this.setCurrentClkBundle(topNtwk);
        p.generateClocks;
        p.invokeBackEnd;
        this.setVhdlPackageName;
        this.updateEntityInfo;
        % 94 96
        debugDumpXML(this, dumpBaseName, '.postEmission.xml');
        % 96 99
        % 97 99
        testBenchName = horzcat(hdlentitytop, this.getParameter('tb_postfix'));
        this.updateParams('TestBenchName', testBenchName);
        this.commitParams;
    catch
        % 102 105
        % 103 105
        savederr = lasterror;
        fclose('all');
        this.cleanup(oldDriver, oldMode, false);
        set_param(0.0, 'CurrentSystem', current_system);
        rethrow(savederr);
        % 109 111
    end % try
    % 111 114
    % 112 114
    this.CodeGenSuccessful = true;
    this.generateCoderScripts;
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    hdldisp(sprintf('HDL Code Generation Complete.\n'), 1.0);
    % 120 123
    % 121 123
    success = true;
    this.cleanup(oldDriver, oldMode, success);
    % 124 128
    % 125 128
    % 126 128
    lasterror(cur_lasterror);
    % 128 130
end % function
function debugDumpXML(this, dumpBaseName, suffix)
    % 131 134
    % 132 134
    if this.getParameter('debug')
        outputDir = this.getParameter('codegendir');
        % 135 137
        this.hdlMakeCodegendir;
        fullPath = fullfile(outputDir, horzcat(dumpBaseName, suffix));
        hdldisp(sprintf('Dumping XML into <a href="matlab:edit %s">%s</a>', fullPath, fullPath), 1.0);
        % 139 141
        this.PirInstance.dumpXML(fullPath);
    end % if
end % function
