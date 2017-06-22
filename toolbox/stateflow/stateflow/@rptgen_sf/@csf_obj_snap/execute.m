function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    out = [];
    % 10 11
    adSF = rptgen_sf.appdata_sf;
    id = adSF.CurrentObject;
    if isempty(id) || not(ishandle(id))
        c.status('No current object', 2.0);
        return;
    end % if
    % 17 19
    % 18 19
    if not(adSF.getTypeInfo(id, 'isGraphical'))
        c.status(sprintf('Object is not graphical'), 4.0);
        return;
    end % if
    % 23 25
    % 24 25
    if not(rptgen_ud.verifyChildCount(id, c.picMinChildren))
        c.status(xlate('Object has fewer than minimum number of children'), 4.0);
        return;
    end % if
    % 29 31
    % 30 31
    if c.AvoidRepeatSnapshot && not(isempty(adSF.LegiblePictureObjects)) && any(eq(adSF.LegiblePictureObjects, id))
        % 32 34
        % 33 34
        c.status('Object has already been displayed in another picture', 4.0);
        return;
        % 36 40
        % 37 40
        % 38 40
        % 39 40
    end % if
    % 41 42
    out = gr_makeGraphic(c, d, id);
end % function
