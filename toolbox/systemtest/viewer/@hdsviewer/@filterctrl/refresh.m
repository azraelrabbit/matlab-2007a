function refresh(h)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 8 11
    % 9 11
    if not(isnan(h.selectedgridpoint)) && not(h.filteredindex(h.selectedgridpoint))
        h.selectedgridpoint = NaN;
    end % if
    % 13 16
    % 14 16
    [selected, total] = h.getgasmeter;
    h.jHandle.setGasGauge(selected, total);
