function update(theColorMap, eventData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    srcObj = eventData.Source.dataSource;
    dataObj = srcObj.dataSource;
    is_intensity = not(is_RGB(dataObj));
    theColorMap.isIntensity = is_intensity;
    theColorMap.scale_limits = getNativeDataRange(dataObj.dataType);
    updateColormapEnable(theColorMap, is_intensity);
end % function
function updateColormapEnable(theColorMap, is_intensity)
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if is_intensity
        ena = 'on';
    else
        ena = 'off';
    end % if
    set(theColorMap.hColormapMenu, 'enable', ena);
end % function
function rng = getNativeDataRange(dataType)
    switch dataType
    case 'int32'
        rng = [-2147483648.0 2147483647.0];
    case 'uint32'
        rng = [0.0 4294967295.0];
    case 'int16'
        rng = [-32768.0 32767.0];
    case 'uint16'
        rng = [0.0 65535.0];
    case 'int8'
        rng = [-128.0 127.0];
    case 'uint8'
        rng = [0.0 255.0];
    case {'logical','boolean'}
        rng = [0.0 1.0];
    otherwise
        rng = [-Inf Inf];
    end % switch
end % function
