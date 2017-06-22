function dispSkipping(h, block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    name = cleanBlockName(h, block);
    SL_SlupdateSkipping = DAStudio.message('Simulink:utility:slupdateSkipping', name);
    fprintf(SL_SlupdateSkipping);
    % 11 12
end % function
