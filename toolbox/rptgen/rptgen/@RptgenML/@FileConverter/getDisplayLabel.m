function dLabel = getDisplayLabel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    [sPath, sFile, sExt] = fileparts(this.SrcFileName);
    % 8 9
    dLabel = xlate('Convert');
    % 10 11
    if not(isempty(sFile))
        dLabel = horzcat(dLabel, ' - ', sFile);
    end % if
end % function
