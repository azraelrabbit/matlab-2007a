function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    gt = c.UddType;
    if strcmp(gt, 'auto')
        adUD = rptgen_ud.appdata_ud;
        gt = adUD.getContextType(c, logical(1));
    end
    % 13 15
    s = sprintf('%s Property - %s', gt, c.PropertyName);
end
