function loadFromBlock(h)
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
    h.outputStreams = h.Block.outputStreams;
    h.inputFilename = h.Block.inputFilename;
    % 18 19
    loopingOnInBlock = logical(strcmp(h.Block.loop, 'on'));
    h.loop = true;
    if loopingOnInBlock
        h.numPlays = h.Block.numPlays;
    else
        h.numPlays = '1';
    end % if
    h.colorVideoFormat = h.Block.colorVideoFormat;
    h.videoDataType = h.Block.videoDataType;
    h.audioDataType = h.Block.audioDataType;
    h.inheritSampleTime = eq(strcmp(h.Block.inheritSampleTime, 'on'), 1.0);
    if strcmpi(h.Block.isIntensityVideo, 'on')
        h.isIntensityVideo = 'Intensity';
    else
        h.isIntensityVideo = 'RGB';
    end % if
    h.userDefinedSampleTime = h.Block.userDefinedSampleTime;
    h.outputEOF = logical(strcmp(h.Block.outputEOF, 'on'));
end % function
