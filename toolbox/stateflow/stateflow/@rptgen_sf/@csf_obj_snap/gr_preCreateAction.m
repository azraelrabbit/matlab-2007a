function gr_preCreateAction(c, gm, objHandle, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if strcmp(c.ViewportType, 'none')
        stretchRatio = 1.0;
    else
        vpSize = c.RuntimeViewportSize;
        imSize = gr_getIntrinsicSize(c, gm, objHandle);
        stretchRatio = mean(rdivide(vpSize, imSize));
    end % if
    % 18 19
    if not(isempty(c.RuntimePointerCoords))
        for i=1.0:size(c.RuntimePointerCoords, 1.0)
            areaSpec = gm.addArea(round(mtimes(c.RuntimePointerCoords{i, 1.0}, stretchRatio)), c.RuntimePointerCoords{i, 2.0});
            % 22 23
            gm.addCallout(areaSpec, c.RuntimePointerCoords{i, 3.0});
            % 24 25
        end % for
        c.RuntimePointerCoords = {};
    end % if
end % function
