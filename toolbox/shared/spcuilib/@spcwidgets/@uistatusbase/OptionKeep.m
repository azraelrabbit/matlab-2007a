function OptionKeep(h, idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    CheckOptionIndex(h, idx);
    % 8 10
    % 9 10
    cache = h.OptionCache;
    % 11 13
    % 12 13
    h.OptionWidths = h.OptionWidths(idx);
    % 14 16
    % 15 16
    h.OptionRestore(cache, idx);
end % function
