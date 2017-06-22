function sltipalert(varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    error(nargchk(2.0, 5.0, nargin))
    % 18 20
    if not(usejava('mwt'))
        error('Java is not currently enabled on this platform');
    end % if
    % 22 24
    Action = lower(varargin{1.0});
    % 24 26
    if eq(nargin, 5.0)
        strDlgDesc = varargin{2.0};
        strTitle = varargin{3.0};
        strPrefsKey = varargin{4.0};
        prefsKeyStatus = varargin{5.0};
    else
        if eq(nargin, 2.0)
            strPrefsKey = varargin{2.0};
        else
            if eq(nargin, 3.0)
                error('Invalid input arguments')
            else
                return;
            end % if
        end % if
    end % if
    switch Action
    case 'create'
        error(nargchk(5.0, 5.0, nargin));
        if prefsKeyStatus
            i_slTipAlertCreate(strDlgDesc, strTitle, strPrefsKey);
        else
            return;
        end % if
    case 'never'
        % 50 52
        error(nargchk(2.0, 2.0, nargin));
        com.mathworks.services.Prefs.setBooleanPref(strPrefsKey, 0.0);
    case 'show'
        % 54 56
        error(nargchk(2.0, 2.0, nargin));
        com.mathworks.services.Prefs.setBooleanPref(strPrefsKey, 1.0);
    end % switch
function i_slTipAlertCreate(strDlgDesc, strTitle, strPrefsKey)
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    FigPos = get(0.0, 'DefaultFigurePosition');
    % 64 66
    if ispc
        FigWidth = 250.0;
        dontShowAgainCheckBoxPos = [10.0 40.0 160.0 11.25];
        ButtonOnePos = [139.0 7.0 48.0 16.0];
        ButtonTwoPos = [194.0 7.0 48.0 16.0];
    else
        FigWidth = 300.0;
        dontShowAgainCheckBoxPos = [10.0 30.0 180.0 20.0];
        ButtonOnePos = [190.0 7.0 48.0 16.0];
        ButtonTwoPos = [242.0 7.0 48.0 16.0];
    end % if
    % 76 78
    FigHeight = 110.0;
    FigPos(3.0:4.0) = horzcat(FigWidth, FigHeight);
    AlertFig = dialog('Visible', 'off', 'Name', strTitle, 'Pointer', 'arrow', 'Units', 'points', 'Position', FigPos, 'UserData', strPrefsKey, 'IntegerHandle', 'off', 'Resize', 'on', 'WindowStyle', 'normal', 'HandleVisibility', 'callback', 'DeleteFcn', cellhorzcat(@i_slTipAlertSetPresfs), 'Tag', 'FigureTitle');
    % 80 95
    % 81 95
    % 82 95
    % 83 95
    % 84 95
    % 85 95
    % 86 95
    % 87 95
    % 88 95
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    BtnFontSize = get(0.0, 'FactoryUIControlFontSize');
    BtnFontName = get(0.0, 'FactoryUIControlFontName');
    helpButtonString = 'Help';
    ButtonTag = 'Help';
    % 98 101
    % 99 101
    BtnHandle(1.0) = uicontrol(AlertFig, 'Style', 'pushbutton', 'Units', 'points', 'Position', ButtonOnePos, 'CallBack', cellhorzcat(@i_slTipAlertHelp), 'String', helpButtonString, 'HorizontalAlignment', 'center', 'FontUnits', 'points', 'FontSize', BtnFontSize, 'FontName', BtnFontName, 'Tag', ButtonTag);
    % 101 114
    % 102 114
    % 103 114
    % 104 114
    % 105 114
    % 106 114
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    CloseButtonString = 'Close';
    ButtonTag = 'Close';
    BtnHandle(2.0) = uicontrol(AlertFig, 'Style', 'pushbutton', 'Units', 'points', 'Position', ButtonTwoPos, 'CallBack', 'delete(get(0,''CurrentFigure''))', 'String', CloseButtonString, 'HorizontalAlignment', 'center', 'FontUnits', 'points', 'FontSize', BtnFontSize, 'FontName', BtnFontName, 'Tag', ButtonTag);
    % 116 129
    % 117 129
    % 118 129
    % 119 129
    % 120 129
    % 121 129
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    msgPosition = [36.0 53.0 183.0 51.0];
    MsgHandle = uicontrol(AlertFig, 'Style', 'text', 'Units', 'points', 'Position', msgPosition, 'String', {' '}, 'Tag', 'strDlgDesc', 'HorizontalAlignment', 'left', 'FontUnits', 'points', 'FontWeight', 'bold', 'FontSize', BtnFontSize, 'FontName', BtnFontName);
    % 130 143
    % 131 143
    % 132 143
    % 133 143
    % 134 143
    % 135 143
    % 136 143
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    if not(iscell(strDlgDesc))
        strDlgDesc = cellstr(strDlgDesc);
    end % if
    [WrapString, NewMsgTxtPos] = textwrap(MsgHandle, strDlgDesc, 65.0);
    delete(MsgHandle);
    AxesHandle = axes('Parent', AlertFig, 'Position', [0.0 0.0 1.0 1.0], 'Visible', 'off');
    MsgHandle = text('Parent', AxesHandle, 'Units', 'points', 'FontUnits', 'points', 'FontSize', BtnFontSize, 'FontName', BtnFontName, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'HandleVisibility', 'callback', 'Position', [10.0 70.0 0.0], 'String', WrapString, 'Tag', 'strDlgDesc');
    % 149 163
    % 150 163
    % 151 163
    % 152 163
    % 153 163
    % 154 163
    % 155 163
    % 156 163
    % 157 163
    % 158 163
    % 159 163
    % 160 163
    % 161 163
    dontShowAgainStr = 'Do not show this message again';
    dontShowAgainCheckBox = uicontrol(AlertFig, 'Style', 'checkbox', 'Units', 'points', 'Position', dontShowAgainCheckBoxPos, 'String', dontShowAgainStr, 'Tag', 'DontShowAgain', 'HorizontalAlignment', 'left', 'FontUnits', 'points', 'FontWeight', 'bold', 'FontSize', BtnFontSize, 'FontName', BtnFontName);
    % 164 177
    % 165 177
    % 166 177
    % 167 177
    % 168 177
    % 169 177
    % 170 177
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    ScreenUnits = get(0.0, 'Units');
    set(0.0, 'Units', 'points');
    ScreenSize = get(0.0, 'ScreenSize');
    set(0.0, 'Units', ScreenUnits);
    % 180 182
    FigPos(1.0) = mrdivide(minus(ScreenSize(3.0), FigWidth), 2.0);
    FigPos(2.0) = mrdivide(minus(ScreenSize(4.0), FigHeight), 2.0);
    % 183 185
    set(AlertFig, 'Position', FigPos);
    set(AlertFig, 'Visible', 'on');
    drawnow;
function i_slTipAlertSetPresfs(HandleAlertFig, ed)
    % 188 193
    % 189 193
    % 190 193
    % 191 193
    handles = guihandles(HandleAlertFig);
    % 193 195
    strPrefsKey = get(handles.FigureTitle, 'UserData');
    if get(handles.DontShowAgain, 'Value')
        com.mathworks.services.Prefs.setBooleanPref(strPrefsKey, 0.0)
    else
        com.mathworks.services.Prefs.setBooleanPref(strPrefsKey, 1.0)
    end % if
function ad = i_slTipAlertHelp(obj, evd)
    % 201 205
    % 202 205
    % 203 205
    helpview(fullfile(docroot, 'mapfiles', 'simulink.map'), 'autoconnect')
