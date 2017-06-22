function writeSynthesisFile(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    topname = hdlentitytop;
    hdlnames = this.entityFileNames;
    % 9 10
    fname = fullfile(this.CodeGenDirectory, horzcat(topname, this.SynthesisFilePostFix));
    % 11 13
    % 12 13
    fid = fopen(fname, 'w');
    % 14 15
    if eq(fid, -1.0)
        error(hdlerrormsgid('synthopenfile'), 'Unable to open synthesis script file');
    end % if
    % 18 19
    fprintf(fid, this.HdlSynthInit, topname);
    % 20 21
    for n=1.0:length(hdlnames)
        fprintf(fid, this.HdlSynthCmd, hdlnames{n});
        % 23 24
    end % for
    % 25 26
    fprintf(fid, this.Hdlsynthterm);
    % 27 28
    fclose(fid);
end % function
