function ert_shrlib_callback_handler(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hDlg = varargin{1.0};
    hSrc = varargin{2.0};
    % 11 13
    % 12 13
    slConfigUISetVal(hDlg, hSrc, 'GenerateErtSFunction', 'off');
    slConfigUISetEnabled(hDlg, hSrc, 'GenerateErtSFunction', 'off');
    % 15 16
    slConfigUISetVal(hDlg, hSrc, 'GRTInterface', 'off');
    slConfigUISetEnabled(hDlg, hSrc, 'GRTInterface', 'off');
    % 18 19
    slConfigUISetVal(hDlg, hSrc, 'TargetLang', 'C');
    slConfigUISetEnabled(hDlg, hSrc, 'TargetLang', 'off');
    % 21 22
    slConfigUISetVal(hDlg, hSrc, 'TargetOS', 'BareBoardExample');
    slConfigUISetEnabled(hDlg, hSrc, 'TargetOS', 'off');
    % 24 26
    % 25 26
    slConfigUISetVal(hDlg, hSrc, 'ModelReferenceCompliant', 'on');
    slConfigUISetVal(hDlg, hSrc, 'ModelStepFunctionPrototypeControlCompliant', 'on');
    % 28 30
    % 29 30
    slConfigUISetVal(hDlg, hSrc, 'ProdEqTarget', 'off');
    slConfigUISetVal(hDlg, hSrc, 'TargetHWDeviceType', 'MATLAB Host');
end % function
