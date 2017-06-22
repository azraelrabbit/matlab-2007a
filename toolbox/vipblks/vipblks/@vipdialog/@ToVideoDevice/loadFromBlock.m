function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.inputType = h.Block.inputType;
    h.imagePorts = h.Block.imagePorts;
    h.fullScreen = strcmpi(h.Block.fullScreen, 'on');
    h.OutputDevice = h.Block.OutputDevice;
    h.videoWindowX = h.Block.videoWindowX;
    h.videoWindowY = h.Block.videoWindowY;
    h.videoWindowWidth = h.Block.videoWindowWidth;
    h.videoWindowHeight = h.Block.videoWindowHeight;
    h.saveWindowSize = strcmpi(h.Block.saveWindowSize, 'on');
end % function
