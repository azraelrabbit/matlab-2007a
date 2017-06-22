function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pkg = findpackage('SSC');
    c = schema.class(pkg, 'RtmModelRegistry');
    % 8 9
    p = schema.prop(c, 'modelInfo', 'mxArray');
    % 10 11
    m = schema.method(c, 'registerModel');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle'};
    % 15 17
    % 16 17
    s.OutputTypes = {};
    % 18 19
    m = schema.method(c, 'isModelRegistered');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle'};
    % 23 25
    % 24 25
    s.OutputTypes = {'bool'};
    % 26 28
    % 27 28
    m = schema.method(c, 'storeBlockData');
    s = m.signature;
    s.Varargin = 'on';
    s.InputTypes = {'handle','handle','mxArray','handle'};
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    s.OutputTypes = {};
    % 37 39
    % 38 39
    m = schema.method(c, 'getBlockData');
    s = m.signature;
    s.Varargin = 'on';
    s.InputTypes = {'handle','handle','handle'};
    % 43 46
    % 44 46
    % 45 46
    s.OutputTypes = {'mxArray','mxArray','handle'};
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    m = schema.method(c, 'getModelBlockEntries');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle'};
    % 57 59
    % 58 59
    s.OutputTypes = {'mxArray','mxArray'};
    % 60 63
    % 61 63
    % 62 63
    m = schema.method(c, 'createModelEntry');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle'};
    % 67 69
    % 68 69
    s.OutputTypes = {'mxArray'};
    % 70 73
    % 71 73
    % 72 73
    m = schema.method(c, 'getModelData');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle'};
    % 77 79
    % 78 79
    s.OutputTypes = {'mxArray'};
    % 80 83
    % 81 83
    % 82 83
    m = schema.method(c, 'setExaminingModel');
    s = m.signature;
    s.Varargin = 'off';
    s.InputTypes = {'handle','handle','bool'};
    % 87 90
    % 88 90
    % 89 90
    s.OutputTypes = {};
end % function
