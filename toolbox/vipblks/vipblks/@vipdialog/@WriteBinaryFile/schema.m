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
    hThisClass = schema.class(package, 'WriteBinaryFile', parent);
    % 13 15
    % 14 15
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 21
    m = schema.method(hThisClass, 'FileSelect');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 26 28
    % 27 28
    if isempty(findtype('VIPVideoFormat'))
        schema.EnumType('VIPVideoFormat', {'Four character codes','Custom'});
    end % if
    % 31 32
    if isempty(findtype('VIPLineOrdering'))
        schema.EnumType('VIPLineOrdering', {'Top line first','Bottom line first'});
        % 34 36
        % 35 36
    end % if
    % 37 38
    if isempty(findtype('VIPBitStreamFormat'))
        schema.EnumType('VIPBitStreamFormat', {'Packed','Planar'});
        % 40 42
        % 41 42
    end % if
    % 43 45
    % 44 45
    if isempty(findtype('VIPNumInputs'))
        schema.EnumType('VIPNumInputs', {'1','2','3','4'});
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
    schema.prop(hThisClass, 'VideoFormat', 'VIPVideoFormat');
    schema.prop(hThisClass, 'FOURCC', 'VIPFOURCC');
    schema.prop(hThisClass, 'BitStreamFormat', 'VIPBitStreamFormat');
    schema.prop(hThisClass, 'NumInputs', 'VIPNumInputs');
    schema.prop(hThisClass, 'LineOrdering', 'VIPLineOrdering');
    schema.prop(hThisClass, 'Component1', 'string');
    schema.prop(hThisClass, 'Component2', 'string');
    schema.prop(hThisClass, 'Component3', 'string');
    schema.prop(hThisClass, 'Component4', 'string');
    schema.prop(hThisClass, 'Bits1', 'string');
    schema.prop(hThisClass, 'Bits2', 'string');
    schema.prop(hThisClass, 'Bits3', 'string');
    schema.prop(hThisClass, 'Bits4', 'string');
    schema.prop(hThisClass, 'ComponentOrder', 'string');
    schema.prop(hThisClass, 'InheritBits', 'bool');
    schema.prop(hThisClass, 'Interlaced', 'bool');
    schema.prop(hThisClass, 'SignedInput', 'bool');
    schema.prop(hThisClass, 'FileEndian', 'VIPFileEndian');
end % function
