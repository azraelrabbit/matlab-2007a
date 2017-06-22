function synthetic = isSyntheticBlock(this, slbh)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    synthetic = 0.0;
    obj = get(slbh, 'ObjectAPI_FP');
    if not(isa(obj, 'Simulink.BlockDiagram')) && isSynthesized(obj)
        synthetic = 1.0;
    end % if
end % function
