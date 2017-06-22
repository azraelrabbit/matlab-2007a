function snapshot = createBlockSnapshot(this, hBlock)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    snapshot.values = hBlock.MaskValues;
    snapshot.enables = hBlock.MaskEnables;
end % function
