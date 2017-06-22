function update(infoObj, eventData)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    srcObj = eventData.Source.dataSource;
    dataObj = srcObj.dataSource;
    % 8 12
    % 9 12
    % 10 12
    infoObj.sourceType = dataObj.type;
    infoObj.sourceLocation = dataObj.sourceName;
    infoObj.imageSize = sprintf('%d H x %d W', dataObj.frameRows, dataObj.frameCols);
    s = dataObj.colorSpace;
    switch lower(s)
    case 'rgb'
        s = 'RGB';
    case 'intensity'
        s = 'Intensity';
    otherwise
    end % switch
    infoObj.colorSpace = s;
    infoObj.frameRate = sprintf('%g fps', dataObj.frameRate);
    infoObj.dataType = dataObj.dataType;
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    infoObj.playbackInfo = VideoInfo(srcObj.playbackControls);
end % function
