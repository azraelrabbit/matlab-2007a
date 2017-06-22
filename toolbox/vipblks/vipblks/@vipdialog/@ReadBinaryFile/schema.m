function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentpackage = findpackage('dspdialog');
    parent = findclass(parentpackage, 'DSPDDG');
    % 10 11
    package = findpackage('vipdialog');
    hThisClass = schema.class(package, 'ReadBinaryFile', parent);
    % 13 16
    % 14 16
    % 15 16
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 21 22
    m = schema.method(hThisClass, 'FileSelect');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 27 29
    % 28 29
    if isempty(findtype('VIPVideoFormat'))
        schema.EnumType('VIPVideoFormat', {'Four character codes','Custom'});
    end % if
    % 32 33
    if isempty(findtype('VIPLineOrdering'))
        schema.EnumType('VIPLineOrdering', {'Top line first','Bottom line first'});
        % 35 37
        % 36 37
    end % if
    % 38 39
    if isempty(findtype('VIPBitStreamFormat'))
        schema.EnumType('VIPBitStreamFormat', {'Packed','Planar'});
        % 41 43
        % 42 43
    end % if
    % 44 45
    if isempty(findtype('VIPNumOutputs'))
        schema.EnumType('VIPNumOutputs', {'1','2','3','4'});
        % 47 52
        % 48 52
        % 49 52
        % 50 52
        % 51 52
    end % if
    % 53 54
    if isempty(findtype('VIPFileEndian'))
        schema.EnumType('VIPFileEndian', {'Little endian','Big endian'});
        % 56 59
        % 57 59
        % 58 59
    end % if
    % 60 61
    if isempty(findtype('VIPFOURCC'))
        schema.EnumType('VIPFOURCC', {'AYUV','CLJR','cyuv','GREY','I420','IF09','IMC1','IMC2','IMC3','IMC4','IUYV','IY41','IYU1','IYU2','IYUV','NV12','NV21','UYNV','UYVY','V210','Y411','Y41P','Y41T','Y422','Y42T','Y8','Y800','YUNV','YUY2','YUYV','YV12','YV16','YVU9','YVYU'});
        % 63 98
        % 64 98
        % 65 98
        % 66 98
        % 67 98
        % 68 98
        % 69 98
        % 70 98
        % 71 98
        % 72 98
        % 73 98
        % 74 98
        % 75 98
        % 76 98
        % 77 98
        % 78 98
        % 79 98
        % 80 98
        % 81 98
        % 82 98
        % 83 98
        % 84 98
        % 85 98
        % 86 98
        % 87 98
        % 88 98
        % 89 98
        % 90 98
        % 91 98
        % 92 98
        % 93 98
        % 94 98
        % 95 98
        % 96 98
        % 97 98
    end % if
    % 99 101
    % 100 101
    schema.prop(hThisClass, 'FileName', 'string');
    schema.prop(hThisClass, 'loopOrNot', 'bool');
    schema.prop(hThisClass, 'numLoops', 'string');
    schema.prop(hThisClass, 'Ts', 'string');
    schema.prop(hThisClass, 'VideoFormat', 'VIPVideoFormat');
    schema.prop(hThisClass, 'FOURCC', 'VIPFOURCC');
    schema.prop(hThisClass, 'BitStreamFormat', 'VIPBitStreamFormat');
    schema.prop(hThisClass, 'NumOutputs', 'VIPNumOutputs');
    schema.prop(hThisClass, 'LineOrdering', 'VIPLineOrdering');
    schema.prop(hThisClass, 'Component1', 'string');
    schema.prop(hThisClass, 'Component2', 'string');
    schema.prop(hThisClass, 'Component3', 'string');
    schema.prop(hThisClass, 'Component4', 'string');
    schema.prop(hThisClass, 'Bits1', 'string');
    schema.prop(hThisClass, 'Bits2', 'string');
    schema.prop(hThisClass, 'Bits3', 'string');
    schema.prop(hThisClass, 'Bits4', 'string');
    schema.prop(hThisClass, 'Rows1', 'string');
    schema.prop(hThisClass, 'Rows2', 'string');
    schema.prop(hThisClass, 'Rows3', 'string');
    schema.prop(hThisClass, 'Rows4', 'string');
    schema.prop(hThisClass, 'Cols1', 'string');
    schema.prop(hThisClass, 'Cols2', 'string');
    schema.prop(hThisClass, 'Cols3', 'string');
    schema.prop(hThisClass, 'Cols4', 'string');
    schema.prop(hThisClass, 'YRows', 'string');
    schema.prop(hThisClass, 'YCols', 'string');
    schema.prop(hThisClass, 'ComponentOrder', 'string');
    schema.prop(hThisClass, 'Interlaced', 'bool');
    schema.prop(hThisClass, 'SignedOutput', 'bool');
    schema.prop(hThisClass, 'FileEndian', 'VIPFileEndian');
    schema.prop(hThisClass, 'OutputEOF', 'bool');
end % function
