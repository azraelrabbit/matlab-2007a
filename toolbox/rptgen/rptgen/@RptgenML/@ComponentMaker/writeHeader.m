function writeHeader(h, fid)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if h.isWriteHeader
        currDate = datevec(now);
        fwrite(fid, sprintf('\n\n%%   Copyright 1999-%0.4i The MathWorks, Inc.\n%%   $Revision: 1.1.6.3 $  $Date: 2004/11/26 01:41:35 $\n\n', currDate(1.0)));
        % 10 13
        % 11 13
        % 12 13
    end % if
    fprintf(fid, '\n%% Method for Report Generator component class "%s.%s"\n\n%%--------1---------2---------3---------4---------5---------6---------7---------8\n\n', h.PkgName, h.ClassName);
end % function
