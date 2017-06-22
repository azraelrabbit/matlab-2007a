function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.inType = h.Block.inType;
    h.imagePorts = h.Block.imagePorts;
    h.shape = h.Block.shape;
    h.size = h.Block.size;
    h.fill = strcmpi(h.Block.fill, 'on');
    h.display = h.Block.display;
    h.intensity = h.Block.intensity;
    h.color = h.Block.color;
    h.opacity = h.Block.opacity;
    h.viewport = h.Block.viewport;
    h.antialiasing = strcmpi(h.Block.antialiasing, 'on');
end % function
