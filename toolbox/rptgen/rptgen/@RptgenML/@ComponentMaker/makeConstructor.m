function makeConstructor(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fid = h.openFile(horzcat(h.ClassName, '.m'));
    % 8 9
    fwrite(fid, sprintf('function c=%s(varargin)\n%%%s Report Generator component constructor\n', h.ClassName, upper(h.ClassName)));
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    h.writeHeader(fid);
    % 15 16
    fprintf(fid, '% ***************************************************** \n');
    fprintf(fid, '% * This constructor file will change in a future     * \n');
    fprintf(fid, '% * version of MATLAB.  Modifying this file could     * \n');
    fprintf(fid, '% * prevent automatic conversion of this class        * \n');
    fprintf(fid, '% * in the future.                                    * \n');
    fprintf(fid, '% ***************************************************** \n\n');
    % 22 24
    % 23 24
    fwrite(fid, sprintf('%%@CONSTRUCTOR\nc = feval(mfilename(''class''));\nc.init(varargin{:});\n'));
    % 25 28
    % 26 28
    % 27 28
    fclose(fid);
    % 29 30
    if h.isWriteHeader
        % 31 32
        h.viewFile(horzcat(h.ClassName, '.m'));
    else
        try
            pcode(fullfile(h.ClassDir, horzcat(h.ClassName, '.m')), '-inplace');
        catch
            warning('rptgen:ComponentMaker:PcodeFailure', lasterr);
        end % try
        delete(fullfile(h.ClassDir, horzcat(h.ClassName, '.m')));
    end % if
end % function
