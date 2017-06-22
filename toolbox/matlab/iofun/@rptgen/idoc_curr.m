function d = idoc_curr
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    d = getClean(rptgen.appdata_rg, 'CurrentDocument');
    if isempty(d)
        d = idoc_new;
    end % if
end % function
