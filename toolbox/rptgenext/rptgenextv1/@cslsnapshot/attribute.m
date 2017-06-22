function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
function c = start(c)
    % 8 12
    % 9 12
    % 10 12
    paperFrame = controlsframe(c, 'Snapshot Options');
    % 12 14
    c = controlsmake(c);
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    iString = get(c.x.format, 'String');
    iUserData = get(c.x.format, 'UserData');
    imgInfo = getimgformat(c, 'AUTOSL');
    autoIndex = find(strcmp(iUserData, 'AUTOSL'));
    iString{autoIndex} = sprintf('Automatic (%s)', imgInfo.name);
    set(c.x.format, 'String', iString);
    % 29 32
    % 30 32
    cString = horzcat(num2str(c.att.PaperExtent(1.0)), 'x', num2str(c.att.PaperExtent(2.0)));
    % 32 34
    set(c.x.PaperExtent, 'String', cString);
    % 34 36
    enableControls(c);
    % 36 38
    paperFrame.FrameContent = vertcat(cellhorzcat(c.x.formatTitle, c.x.format), {[5.0],[5.0]}, cellhorzcat(c.x.PaperOrientationTitle, num2cell(ctranspose(c.x.PaperOrientation))), cellhorzcat(c.x.PaperExtentModeTitle, cellhorzcat(c.x.PaperExtentMode, c.x.PaperExtent, c.x.PaperUnits)), {[5.0],[5.0]}, cellhorzcat(c.x.TitleTypeTitle, vertcat(cellhorzcat(c.x.TitleType(1.0)), cellhorzcat(c.x.TitleType(2.0)), cellhorzcat(c.x.TitleType(3.0)), cellhorzcat(cellhorzcat(c.x.TitleType(4.0), c.x.TitleString)))), {[2.0],[2.0]}, cellhorzcat(c.x.CaptionTypeTitle, vertcat(cellhorzcat(c.x.CaptionType(1.0)), cellhorzcat(c.x.CaptionType(2.0)), cellhorzcat(cellhorzcat(c.x.CaptionType(3.0), c.x.CaptionString)))));
    % 38 58
    % 39 58
    % 40 58
    % 41 58
    % 42 58
    % 43 58
    % 44 58
    % 45 58
    % 46 58
    % 47 58
    % 48 58
    % 49 58
    % 50 58
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    c.x.LayoutManager = vertcat({[5.0]}, cellhorzcat(cellhorzcat(c.x.isPrintFrame, num2cell(c.x.PrintFrameName))), {[10.0]}, cellhorzcat(paperFrame));
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    c = resize(c);
function c = refresh(c)
    % 64 66
function c = resize(c)
    % 66 74
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 75 79
    % 76 79
    % 77 79
    switch whichControl
    case 'PaperUnits'
        oldUnits = c.att.PaperUnits;
        c = controlsupdate(c, whichControl, varargin{:});
        newUnits = c.att.PaperUnits;
        c.att.PaperExtent = rptgenutil('SizeUnitTransform', c.att.PaperExtent, oldUnits, newUnits, c.x.PaperExtent);
        % 85 89
        % 86 89
        % 87 89
    case 'PaperExtent'
        % 88 90
        [c.att.PaperExtent, errMsg] = rptgenutil('str2numNxN', c.x.PaperExtent, c.att.PaperExtent);
    case {'format','PaperExtentMode','CaptionType','TitleType','isPrintFrame'}
        % 91 93
        c = controlsupdate(c, whichControl, varargin{:});
        enableControls(c);
    otherwise
        c = controlsupdate(c, whichControl, varargin{:});
    end % switch
function enableControls(c)
    % 98 102
    % 99 102
    % 100 102
    set(c.x.PaperOrientation, 'Enable', onoff(not(strcmp(c.att.format, 'png-capture'))));
    % 102 105
    % 103 105
    set(c.x.PrintFrameName, 'Enable', onoff(c.att.isPrintFrame));
    % 105 107
    set(c.x.PaperExtentMode, 'Enable', onoff(not(c.att.isPrintFrame)));
    % 107 110
    % 108 110
    set(c.x.CaptionString, 'Enable', onoff(strcmp(c.att.CaptionType, '$manual')));
    % 110 113
    % 111 113
    set(c.x.TitleString, 'Enable', onoff(strcmp(c.att.TitleType, 'manual')));
    % 113 116
    % 114 116
    set(horzcat(c.x.PaperExtent, c.x.PaperUnits), 'enable', onoff(strcmp(c.att.PaperExtentMode, 'manual')));
    % 116 121
    % 117 121
    % 118 121
    % 119 121
    warnStr = checkframeformat(c);
    statbar(c, warnStr);
function strOnOff = onoff(logOnOff)
    % 123 127
    % 124 127
    % 125 127
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
