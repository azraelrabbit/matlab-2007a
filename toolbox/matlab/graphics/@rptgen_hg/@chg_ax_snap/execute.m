function out = execute(c, d, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if (isempty(c.AxesHandle)) | (~(ishandle(c.AxesHandle)))
        CurrAx = get(rptgen_hg.appdata_hg, 'CurrentAxes');
        if (isempty(CurrAx)) | (~(ishandle(CurrAx)))
            out = [];
            status(c, xlate('Axes not found for snapshot'), 2.0);
            return
        end
    else
        CurrAx = c.AxesHandle;
    end
    % 20 23
    % 21 23
    figH = c.copyAxes(CurrAx);
    % 23 25
    out = c.gr_makeGraphic(d, figH);
    delete(figH);
end
