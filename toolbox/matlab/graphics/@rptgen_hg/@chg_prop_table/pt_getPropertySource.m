function ps = pt_getPropertySource(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    switch c.ObjectType
    case 'Figure'
        ps = rptgen_hg.propsrc_hg_fig;
    case 'Axes'
        ps = rptgen_hg.propsrc_hg_ax;
    otherwise
        ps = rptgen_hg.propsrc_hg_obj;
    end % switch
end % function
