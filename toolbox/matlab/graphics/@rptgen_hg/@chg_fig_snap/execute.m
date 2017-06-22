function out = execute(c, d, varargin)
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
    if (isempty(c.FigureHandle)) | (~(ishandle(c.FigureHandle)))
        adh = rptgen_hg.appdata_hg;
        figH = adh.CurrentFigure;
        if (isempty(figH)) | (~(ishandle(figH)))
            out = [];
            status(c, xlate('Figure not found for snapshot'), 2.0);
            return
        end
    else
        figH = c.FigureHandle;
    end
    % 22 24
    out = c.gr_makeGraphic(d, figH);
end
