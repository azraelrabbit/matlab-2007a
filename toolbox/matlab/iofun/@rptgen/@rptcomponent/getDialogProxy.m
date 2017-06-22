function out = getDialogProxy(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(get(rptgen.appdata_rg, 'GenerationStatus'), 'report')
        % 9 10
        out = [];
    else
        out = this;
    end % if
end % function
