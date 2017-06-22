function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mode = h.Block.(horzcat(h.Prefix, 'Mode'));
    if strcmp(mode, 'User-defined')
        h.Mode = 'Binary point scaling';
    else
        h.Mode = mode;
    end
    h.WordLength = h.Block.(horzcat(h.Prefix, 'WordLength'));
    h.FracLength = h.Block.(horzcat(h.Prefix, 'FracLength'));
end
