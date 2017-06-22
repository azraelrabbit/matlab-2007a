function iTitle = gr_getTitle(c, fName, id, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    switch c.TitleType
    case 'none'
        iTitle = '';
    case 'objname'
        psSF = rptgen_sf.propsrc_sf;
        iTitle = getObjectName(psSF, id);
    case 'fullsfname'
        psSF = rptgen_sf.propsrc_sf;
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        iTitle = getSFPath(psSF, id, d);
    case 'fullslsfname'
        psSF = rptgen_sf.propsrc_sf;
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        iTitle = getSLSFPath(psSF, id, d);
    case 'manual'
        iTitle = rptgen.parseExpressionText(c.Title);
    end % switch
end % function
