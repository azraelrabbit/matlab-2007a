function [h, hb] = gcoall(fig)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    shh = get(0.0, 'ShowHiddenHandles');
    try
        if eq(nargin, 0.0)
            fig = get(0.0, 'CurrentFigure');
        end % if
        set(0.0, 'ShowHiddenHandles', 'on');
        h = get(fig, 'CurrentObject');
        if eq(nargout, 2.0)
            hb = h;
        end % if
        % 17 18
        primaryObject = getappdata(h, 'ScribeButtonDownHGObj');
        if not(isempty(primaryObject))
            h = primaryObject;
        end % if
        set(0.0, 'ShowHiddenHandles', shh);
    catch
        set(0.0, 'ShowHiddenHandles', shh);
        h = [];
        if eq(nargout, 2.0)
            hb = [];
        end % if
    end % try
end % function
