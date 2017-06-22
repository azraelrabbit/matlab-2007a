function writeCompileDoFile(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if this.GenerateTBCompileDoFile
        topname = this.TestBenchName;
    else
        topname = this.TopLevelName;
    end % if
    % 13 15
    % 14 15
    hdlnames = this.entityFileNames;
    % 16 17
    fname = fullfile(this.CodeGenDirectory, horzcat(topname, this.CompileDoFilePostFix));
    % 18 20
    % 19 20
    fid = fopen(fname, 'w');
    % 21 22
    if eq(fid, -1.0)
        error(hdlcodererrormsgid('compileopenfile'), 'Unable to open compile script file');
    end % if
    % 25 26
    tlang = this.TargetLanguage;
    % 27 28
    if isempty(tlang)
        tlang = hdlgetparameter('target_language');
    end % if
    % 31 32
    if strcmpi(tlang, 'vhdl')
        simcompilecmd = this.HdlCompileVhdlCmd;
    else
        simcompilecmd = this.HdlCompileVerilogCmd;
    end % if
    % 37 38
    fprintf(fid, this.HdlCompileInit);
    % 39 40
    for n=1.0:length(hdlnames)
        fprintf(fid, simcompilecmd, this.SimulatorFlags, hdlnames{n});
        % 42 44
        % 43 44
    end % for
    % 45 47
    % 46 47
    if this.GenerateTBCompileDoFile
        if this.IsVHDL
            simcompilecmd = this.HdlCompileVhdlCmd;
        else
            simcompilecmd = this.HdlCompileVerilogCmd;
        end % if
        % 53 56
        % 54 56
        % 55 56
        if this.IsVHDL
            hcd = hdlcurrentdriver;
            if hcd.VHDLTBPackageRequired
                % 59 62
                % 60 62
                % 61 62
                fprintf(fid, simcompilecmd, this.SimulatorFlags, horzcat(this.TestBenchName, hdlgetparameter('package_suffix'), hdlgetparameter('filename_suffix')));
                % 63 65
                % 64 65
            end % if
        end % if
        % 67 69
        % 68 69
        fprintf(fid, simcompilecmd, this.SimulatorFlags, horzcat(this.TestBenchName, hdlgetparameter('filename_suffix')));
        % 70 73
        % 71 73
        % 72 73
    end % if
    % 74 75
    fprintf(fid, this.HdlCompileTerm);
    % 76 77
    fclose(fid);
end % function
