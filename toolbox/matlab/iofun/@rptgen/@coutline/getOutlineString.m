function s = getOutlineString(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [sPath, sFile, sExt] = fileparts(h.RptFileName);
    if isempty(sFile)
        sFile = 'Unnamed';
    end % if
    if isempty(sExt)
        sExt = '.rpt';
    end % if
    % 15 16
    s = sprintf('Report - %s%s', sFile, sExt);
    % 17 18
    if h.getDirty
        s = horzcat(s, '*');
    end % if
end % function
