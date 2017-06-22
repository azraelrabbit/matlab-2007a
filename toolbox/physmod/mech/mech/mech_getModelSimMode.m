function simMode = mech_getModelSimMode(blk)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    blk = get_param(blk, 'Handle');
    simMode = get_param(bdroot(blk), 'SimulationMode');
end % function
