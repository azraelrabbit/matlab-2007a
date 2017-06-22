function s = getOutlineString(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    adSL = rptgen_sl.appdata_sl;
    ct = adSL.getContextType(this, false);
    % 11 12
    if isempty(ct) || strcmpi(ct, 'none')
        s = this.getName;
    else
        s = horzcat(ct, ' ', this.getName);
    end % if
end % function
