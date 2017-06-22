function writeSimDoFile(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if this.GenerateTBCompileDoFile
        topname = this.TestBenchName;
    else
        topname = hdlentitytop;
    end % if
    % 12 13
    fname = fullfile(this.CodeGenDirectory, horzcat(topname, this.SimDoFilePostFix));
    % 14 16
    % 15 16
    fid = fopen(fname, 'w');
    % 17 18
    if eq(fid, -1.0)
        error(hdlcodererrormsgid('simopenfile'), 'Unable to open sim script file');
    end % if
    % 21 22
    fprintf(fid, this.HdlSimInit);
    % 23 24
    fprintf(fid, this.HdlSimCmd, topname);
    % 25 26
    tbname = this.TestBenchName;
    % 27 28
    epl = hdlentityportnames;
    % 29 30
    inst_prefix = hdlgetparameter('instance_prefix');
    enl = this.EntityNameList;
    for n=1.0:length(epl)
        % 33 34
        fprintf(fid, this.HdlSimViewWaveCmd, horzcat('/', tbname, '/', inst_prefix, char(enl{end}), '/', epl{n}));
        % 35 40
        % 36 40
        % 37 40
        % 38 40
        % 39 40
        idx = hdlsignalfindname(epl{n});
        if hdlgetparameter('tbrefsignals') && hdlisoutportsignal(idx) && not(isSyntheticSignal(idx)) && not(idx.isClockEnable)
            fprintf(fid, this.HdlSimViewWaveCmd, horzcat('/', tbname, '/', epl{n}, hdlgetparameter('testbenchreferencepostfix')));
            % 43 46
            % 44 46
            % 45 46
        end % if
        % 47 48
    end % for
    % 49 50
    fprintf(fid, this.HdlSimTerm);
    % 51 52
    fclose(fid);
end % function
function synthetic = isSyntheticSignal(signal)
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    synthetic = strcmp(hdlsignalname(signal), hdlgetparameter('clockenableoutputname'));
end % function
