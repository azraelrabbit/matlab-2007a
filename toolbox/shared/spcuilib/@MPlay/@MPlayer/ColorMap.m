function ColorMap(mplayObj, eventStruct)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    local_GetDataConversion(mplayObj);
    % 10 14
    % 11 14
    % 12 14
    local_SetupColormapScaling(mplayObj);
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    UpdateImageForColormap(mplayObj.datasourceObj);
function local_GetDataConversion(mplayObj)
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    dataSrc = mplayObj.datasourceObj.dataSource;
    switch dataSrc.dataType
    case 'double'
        if is_RGB(dataSrc) || not(mplayObj.colorMapObj.userRange)
            % 33 35
            convFunc = @convertTwoLevelToUint8;
            toDtypeName = 'uint8';
        else
            % 37 39
            convFunc = [];
            toDtypeName = 'double';
        end % if
    case 'single'
        if is_RGB(dataSrc) || not(mplayObj.colorMapObj.userRange)
            % 43 45
            convFunc = @convertTwoLevelToUint8;
            toDtypeName = 'uint8';
        else
            % 47 49
            convFunc = [];
            toDtypeName = 'double';
        end % if
    case 'int8'
        convFunc = @convertDataFromInt8;
        toDtypeName = 'uint8';
    case 'uint8'
        convFunc = [];
        toDtypeName = 'uint8';
    case 'int16'
        convFunc = @convertDataFromInt16;
        toDtypeName = 'uint8';
    case 'uint16'
        convFunc = [];
        toDtypeName = 'uint16';
    case 'int32'
        convFunc = @convertDataFromInt32;
        toDtypeName = 'uint8';
    case 'uint32'
        convFunc = @convertDataFromUint32;
        toDtypeName = 'uint8';
    case {'logical','boolean'}
        if is_RGB(dataSrc)
            % 71 74
            % 72 74
            convFunc = @convertTwoLevelToUint8;
            toDtypeName = 'uint8';
        else
            % 76 81
            % 77 81
            % 78 81
            % 79 81
            convFunc = [];
            toDtypeName = 'uint8';
        end % if
    otherwise
        % 84 87
        % 85 87
        if is_RGB(dataSrc) || not(mplayObj.colorMapObj.userRange)
            % 87 89
            convFunc = @convertAsDoubleToUint8;
            toDtypeName = 'uint8';
        else
            % 91 93
            convFunc = @convertToDouble;
            toDtypeName = 'double';
        end % if
    end % switch
    % 96 100
    % 97 100
    % 98 100
    mplayObj.conversionFcn = convFunc;
    mplayObj.videoInfoObj.dataTypeDst = toDtypeName;
function convertedData = convertAsDoubleToUint8(inputData)
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    convertedData = uint8(mtimes(double(inputData), 255.0));
function convertedData = convertToDouble(inputData)
    % 109 112
    % 110 112
    convertedData = double(inputData);
function convertedData = convertTwoLevelToUint8(inputData)
    % 113 123
    % 114 123
    % 115 123
    % 116 123
    % 117 123
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    convertedData = uint8(mtimes(inputData, 255.0));
function convertedData = convertDataFromInt8(inputData)
    % 124 127
    % 125 127
    convertedData = uint8(plus(int16(inputData), 128.0));
function convertedData = convertDataFromInt16(inputData)
    % 128 131
    % 129 131
    convertedData = uint8(mrdivide(plus(single(inputData), 32768.0), 257.0));
function convertedData = convertDataFromInt32(inputData)
    % 132 135
    % 133 135
    doubleData = mrdivide(plus(double(inputData), 2147483648.0), 4294967295.0);
    convertedData = im2uint8(doubleData);
function convertedData = convertDataFromUint32(inputData)
    % 137 140
    % 138 140
    doubleData = mrdivide(double(inputData), 4294967295.0);
    convertedData = im2uint8(doubleData);
function local_SetupColormapScaling(mplayObj)
    % 142 152
    % 143 152
    % 144 152
    % 145 152
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    dataSrc = mplayObj.datasourceObj.dataSource;
    if not(is_RGB(dataSrc))
        if mplayObj.colorMapObj.userRange
            % 154 156
            clim = horzcat(mplayObj.colorMapObj.userRangeMin, mplayObj.colorMapObj.userRangeMax);
            % 156 158
            if not(isempty(mplayObj.conversionFcn))
                clim = mplayObj.conversionFcn(clim);
            end % if
            % 160 162
            if le(clim(2.0), clim(1.0))
                clim(2.0) = plus(clim(1.0), 1.0);
            end % if
            cdm = 'scaled';
        else
            % 166 168
            [clim, cdm] = getScaledDataRange(dataSrc.dataType);
        end % if
        % 169 171
        set(mplayObj.widgetsObj.himage, 'CDataMapping', cdm);
        set(mplayObj.widgetsObj.haxis, 'CLim', clim);
    end % if
function [rng, cdm] = getScaledDataRange(dataType)
    % 174 178
    % 175 178
    % 176 178
    switch dataType
    case {'logical','boolean'}
        rng = [0.0 1.0];
        cdm = 'scaled';
    case {'double','single'}
        rng = [0.0 255.0];
        cdm = 'direct';
    case 'uint16'
        rng = [0.0 65535.0];
        cdm = 'scaled';
    case 'uint8'
        rng = [0.0 255.0];
        cdm = 'direct';
    case {'int8','int16','int32','uint32'}
        rng = [0.0 255.0];
        cdm = 'scaled';
    otherwise
        % 194 197
        % 195 197
        rng = [0.0 255.0];
        cdm = 'direct';
    end % switch
