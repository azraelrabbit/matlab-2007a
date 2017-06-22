function ssDirty = findDirtyStylesheet(this, id)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    ssDirty = [];
    % 8 9
    openSS = find(this, '-depth', 1.0, '-isa', 'RptgenML.StylesheetEditor', 'ID', id);
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    for i=1.0:length(openSS)
        if getDirty(openSS(i))
            ssDirty = openSS(i);
            return;
        end % if
    end % for
end % function
