function [dValue, dName] = getDisplayValue(h, dName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hGet = get(rptgen_hg.appdata_hg, horzcat('Current', h.ObjectType));
    % 9 10
    if isempty(hGet)
        error(sprintf('No "%s" object to display "%s" property', h.ObjectType, dName));
    end % if
    % 13 14
    switch h.ObjectType
    case 'Figure'
        ps = rptgen_hg.propsrc_hg_fig;
    case 'Axes'
        ps = rptgen_hg.propsrc_hg_ax;
    otherwise
        ps = rptgen_hg.propsrc_hg_obj;
    end % switch
    % 22 23
    [dValue, dName] = getPropValue(ps, hGet, dName);
    dValue = dValue{1.0};
end % function
