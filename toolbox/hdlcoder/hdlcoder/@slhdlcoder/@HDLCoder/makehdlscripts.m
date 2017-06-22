function makehdlscripts(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(this.CodeGenSuccessful)
        error(hdlcodererrormsgid('codegennotsuccessful'), 'HDLCoder must complete successfully prior to runnning Script Generator');
        % 10 11
    end % if
    % 12 14
    % 13 14
    oldDriver = hdlcurrentdriver;
    hdlcurrentdriver(this);
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    this.commitParams;
    % 22 24
    % 23 24
    oldMode = hdlcodegenmode;
    hdlcodegenmode('slcoder');
    % 26 27
    scriptGen = slhdlcoder.ScriptGenerator(this.EntityNameList, this.EntityPathList);
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    scriptGen.writeAllScripts;
    % 33 36
    % 34 36
    % 35 36
    hdlcurrentdriver(oldDriver);
    hdlcodegenmode(oldMode);
end % function
