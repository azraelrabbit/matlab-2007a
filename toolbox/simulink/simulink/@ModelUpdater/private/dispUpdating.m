function dispUpdating(h, block, reason)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if doUpdate(h)
        SL_SlupdateUpdating = DAStudio.message('Simulink:utility:slupdateUpdatingProgress', block, reason);
        % 10 11
        fprintf(SL_SlupdateUpdating);
    end % if
    % 13 14
end % function
