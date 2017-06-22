function out = gr_makeGraphic(c, d, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    c.RuntimeViewportSize = [-1.0 -1.0];
    fName = c.gr_getFileName(varargin{:});
    % 17 18
    if not(isempty(fName))
        % 19 20
        gm = javaObject('com.mathworks.toolbox.rptgencore.docbook.GraphicMaker', java(d), fName);
        % 21 23
        % 22 23
        try
            gm.setTitle(c.gr_getTitle(fName, varargin{:}));
        catch
            c.status(xlate('Error setting title'), 2.0);
            c.status(lasterr, 5.0);
        end % try
        % 29 30
        try
            gm.setCaption(c.gr_getCaption(fName, varargin{:}));
        catch
            c.status(xlate('Error setting caption'), 2.0);
            c.status(lasterr, 5.0);
        end % try
        % 36 37
        gm.setInline(c.isInline);
        gm.setAlign(c.DocHorizAlign);
        % 39 40
        try
            c.gr_makeViewport(gm, varargin{:});
        catch
            c.status(xlate('Error setting viewport'), 2.0);
            c.status(lasterr, 5.0);
        end % try
        % 46 47
        try
            c.gr_preCreateAction(gm, varargin{:});
        catch
            c.status(xlate('Error preparing graphic'), 2.0);
            c.status(lasterr, 5.0);
        end % try
        % 53 54
        out = gm.createGraphic;
    else
        % 56 57
        c.status(xlate('No file name.  Could not create graphic.'), 2.0);
        out = [];
    end % if
end % function
