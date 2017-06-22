function gr_makeViewport(this, gm, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    iSize = this.gr_getIntrinsicSize(gm, varargin{:});
    % 14 17
    % 15 17
    if isSVG(gm)
        gm.setContentWidth(iSize(1.0));
        gm.setContentHeight(iSize(2.0));
    end
    % 20 22
    if strcmp(this.ViewportType, 'none')
        % 22 26
        % 23 26
        % 24 26
        return
    end
    % 27 30
    % 28 30
    maxViewport = this.ViewportSize;
    if strcmp(this.ViewportUnits, 'inches')
        maxViewport = mtimes(maxViewport, get(0.0, 'screenpixelsperinch'));
    else
        if strcmp(this.ViewportUnits, 'centimeters')
            maxViewport = mrdivide(mtimes(maxViewport, get(0.0, 'screenpixelsperinch')), 2.54);
        end
    end
    if lt(min(iSize), 0.0)
        if strcmp(this.ViewportType, 'fixed')
            % 39 42
            % 40 42
            this.RuntimeViewportSize = maxViewport;
            gm.setWidth(this.RuntimeViewportSize(1.0));
            gm.setHeight(this.RuntimeViewportSize(2.0));
        else
            zoomFactor = max(this.ViewportZoom, .01);
            gm.setHeight(sprintf('%g%%', zoomFactor));
            gm.setWidth(sprintf('%g%%', zoomFactor));
        end
    else
        if strcmp(this.ViewportType, 'fixed')
            % 51 53
            oversizeFactor = max(rdivide(iSize, maxViewport));
        else
            iSize = mtimes(mrdivide(max(this.ViewportZoom, .01), 100.0), iSize);
            % 55 57
            oversizeFactor = max(1.0, max(rdivide(iSize, maxViewport)));
        end
        this.RuntimeViewportSize = round(mrdivide(iSize, oversizeFactor));
        gm.setWidth(this.RuntimeViewportSize(1.0));
        gm.setHeight(this.RuntimeViewportSize(2.0));
    end
    % 62 65
    % 63 65
    if isSVG(gm)
        gm.setContentWidth(gm.getWidth);
        gm.setContentHeight(gm.getHeight);
    end
end
function tf = isSVG(gm)
    % 70 73
    % 71 73
    [gPath, gFile, gExt] = fileparts(char(gm.getFile));
    if strcmpi(gExt, '.svg') || strcmpi(gExt, '.svgz')
        tf = true;
    else
        tf = false;
    end
end
