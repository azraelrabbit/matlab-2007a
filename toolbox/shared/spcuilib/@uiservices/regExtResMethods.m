function regExtResMethods(hDerived)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    findclass(findpackage('uiservices'), 'ExtRes');
    m = schema.method(hDerived, 'getResources', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'uiservices.ExtRes'};
    s.OutputTypes = {};
    % 28 31
    % 29 31
    % 30 31
    try
        findclass(findpackage('uimgr'), 'uiinstaller');
        m = schema.method(hDerived, 'createGUI', 'static');
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {};
        s.OutputTypes = {'uimgr.uiinstaller'};
        % 38 39
    end % try
    % 40 43
    % 41 43
    % 42 43
    try
        m = schema.method(hDerived, 'getPropsSchema', 'static');
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'uiservices.ExtCfg'};
        s.OutputTypes = {'mxArray'};
        % 49 50
    end % try
    % 51 54
    % 52 54
    % 53 54
    try
        m = schema.method(hDerived, 'validate', 'static');
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
        s.OutputTypes = {'bool','string'};
        % 60 61
    end % try
end % function
