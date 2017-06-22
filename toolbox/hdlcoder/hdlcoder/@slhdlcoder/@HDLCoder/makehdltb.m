function makehdltb(this)
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
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    this.commitParams;
    % 27 30
    % 28 30
    checkDUTName(this);
    % 30 33
    % 31 33
    redoMakehdlIfNeeded(this);
    % 33 36
    % 34 36
    disp(' ');
    hdldisp(sprintf('Begin TestBench Generation'));
    % 37 40
    % 38 40
    oldMode = hdlcodegenmode;
    hdlcodegenmode('slcoder');
    % 41 43
    try
        % 43 51
        % 44 51
        % 45 51
        % 46 51
        % 47 51
        % 48 51
        % 49 51
        this.connectToModel;
        this.closeConnection;
        % 52 55
        % 53 55
        this.hdltbMakeCodegendir;
        % 55 58
        % 56 58
        hdlTBGen = slhdlcoder.TestBenchGenerator(this.ModelConnection);
        % 58 60
        hdlTBGen.makehdltb;
        % 60 66
        % 61 66
        % 62 66
        % 63 66
        % 64 66
        this.VHDLTBPackageRequired = hdlTBGen.VHDLTBPackageRequired;
        % 66 69
        % 67 69
        this.generateTBScripts;
        % 69 71
        hdldisp('HDL TestBench Generation Complete.', 1.0);
        disp(' ');
        disp(' ');
    catch
        savederr = lasterror;
        fclose('all');
        % 76 78
        hdlcurrentdriver(oldDriver);
        hdlcodegenmode(oldMode);
        rethrow(savederr);
    end % try
    % 81 84
    % 82 84
    hdlcurrentdriver(oldDriver);
    hdlcodegenmode(oldMode);
    % 85 89
    % 86 89
    % 87 89
    lasterror(cur_lasterror);
end % function
function redoMakehdlIfNeeded(this)
    % 91 95
    % 92 95
    % 93 95
    if not(isCodeGenSuccessful(this))
        modelonly_prop = 'codegenerationoutput';
        modelonly_setting = 'DisplayGeneratedModelOnly';
        if strcmpi(this.getParameter(modelonly_prop), modelonly_setting)
            % 98 101
            % 99 101
            error(hdlcodererrormsgid('nohdlcodegenfortb'), horzcat('Cannot proceed with Testbench generation since it requires successful HDL Code generation.\n', 'HDL Code cannot be successfully generated because the property ', modelonly_prop, ' is ', 'set to ', modelonly_setting, '.'));
            % 101 105
            % 102 105
            % 103 105
        end % if
        this.makehdl;
        if not(isCodeGenSuccessful(this))
            % 107 109
            error(hdlcodererrormsgid('unsuccessfulcodegen'), 'Cannot proceed with Testbench generation - unable to successfully generate HDL code.');
            % 109 111
        end % if
    end % if
    % 112 114
    if isempty(this.BackEnd)
        error(hdlcodererrormsgid('nogeneratedmodel'), 'Internal Error: invalid coder object');
        % 115 117
    end % if
    % 117 119
    infilename = this.BackEnd.InModelFile;
    outfilename = this.BackEnd.OutModelFile;
    inp_open = find_system('type', 'block_diagram', 'name', infilename);
    gm_open = find_system('type', 'block_diagram', 'name', outfilename);
    % 122 124
    if isempty(inp_open)
        error(hdlcodererrormsgid('noinputmodel'), horzcat('Unable to open the input model ', infilename, ' for HDL code generation.'));
        % 125 127
    end % if
    % 127 129
    if isempty(gm_open)
        warning(hdlcodererrormsgid('nogeneratemodel'), horzcat('Unable to find the generated model ', outfilename, ' for HDL Testbench generation. Re-running HDL Code Generation.'));
        % 130 134
        % 131 134
        % 132 134
        this.makehdl;
        % 134 137
        % 135 137
        gm_open = find_system('type', 'block_diagram', 'name', outfilename);
        if isempty(gm_open)
            error(hdlcodererrormsgid('nogeneratemodel'), horzcat('Internal Error: Unable to find the generated model ', outfilename, ' for HDL Testbench generation'));
            % 139 141
        end % if
        % 141 143
    end % if
end % function
function checkDUTName(this)
    % 145 149
    % 146 149
    % 147 149
    modelName = this.ModelConnection.ModelName;
    dutName = this.getStartNodeName;
    % 150 152
    if strcmp(dutName, modelName)
        % 152 154
        errMsg = 'Cannot Generate test bench code for the entire model.\nPlease specify simulatable subsystem in your model';
        % 154 158
        % 155 158
        % 156 158
        error(hdlcodererrormsgid('dutnotfound'), sprintf('%s', errMsg));
    end % if
end % function
