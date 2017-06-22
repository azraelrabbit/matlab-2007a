function [success, err] = check_cmap(colormapObj, cmap_val)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    success = true;
    err = '';
    % 8 10
    if lt(nargin, 2.0)
        % 10 13
        % 11 13
        cmap_val = colormapObj.cmap;
    end
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    if colormapObj.isIntensity && not(isempty(cmap_val))
        success = eq(size(cmap_val, 2.0), 3.0);
        if not(success)
            err = 'Dimensions of colormap matrix must be Nx3.';
            return
        end
        success = isreal(cmap_val) && not(issparse(cmap_val)) && isnumeric(cmap_val);
        if not(success)
            err = 'Colormap must contain real numeric values.';
            return
        end
        % 29 31
        success = ~(any(lt(cmap_val(:), 0.0)) || any(gt(cmap_val(:), 1.0)));
        if not(success)
            err = 'All colormap intensities must be between 0 and 1.';
            return
        end
    end
end
