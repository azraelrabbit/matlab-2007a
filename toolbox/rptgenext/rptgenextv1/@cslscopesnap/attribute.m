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
    loopFrame = controlsframe(c, 'Take Snapshots of ');
    optFrame = controlsframe(c, 'Snapshot Options ');
    % 13 15
    c = controlsmake(c);
    % 15 17
    cString = horzcat(num2str(c.att.PaperSize(1.0)), 'x', num2str(c.att.PaperSize(2.0)));
    % 17 19
    set(c.x.PaperSize, 'String', cString);
    % 19 22
    % 20 22
    slCD = getslcdata(c);
    % 22 24
    loopInfo = searchblocktype(c.zslmethods, sprintf('XY graphs & scope'));
    liUD = horzcat(loopInfo.contextCode, vertcat(cellhorzcat(slCD.SystemLarge), cellhorzcat(slCD.ModelLarge), cellhorzcat(slCD.SignalLarge), cellhorzcat(slCD.BlockLarge), cellhorzcat(slCD.ModelLarge)), loopInfo.contextName);
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    c.x.LoopImage = uicontrol(c.x.all, 'style', 'togglebutton', 'Enable', 'inactive', 'Value', 1.0, 'UserData', liUD);
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    c.x.LoopEcho = uicontrol(c.x.all, 'Style', 'text', 'HorizontalAlignment', 'left');
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    loopFrame.FrameContent = cellhorzcat(c.x.LoopImage, 3.0, vertcat(cellhorzcat(c.x.LoopEcho), {[inf,1.0]}, cellhorzcat(num2cell(ctranspose(c.x.isForceOpen)))));
    % 42 45
    % 43 45
    optFrame.FrameContent = vertcat(cellhorzcat(vertcat(cellhorzcat(c.x.ImageFormatTitle, c.x.ImageFormat), {[3.0],[3.0]}, cellhorzcat(c.x.PaperSizeTitle, cellhorzcat(c.x.PaperSize, c.x.PaperUnits)), {[3.0],[3.0]}, cellhorzcat(c.x.PaperOrientationTitle, num2cell(ctranspose(c.x.PaperOrientation))), {[3.0],[3.0]}, cellhorzcat(c.x.CaptionTypeTitle, vertcat(cellhorzcat(c.x.CaptionType(1.0)), cellhorzcat(c.x.CaptionType(2.0)))))), {[3.0]}, cellhorzcat(c.x.isInvertHardcopy), cellhorzcat(c.x.AutoscaleScope));
    % 45 61
    % 46 61
    % 47 61
    % 48 61
    % 49 61
    % 50 61
    % 51 61
    % 52 61
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    c.x.LayoutManager = vertcat(cellhorzcat(loopFrame), {[5.0]}, cellhorzcat(optFrame));
    % 61 65
    % 62 65
    % 63 65
    UpdateFrame(c);
    % 65 67
    c = resize(c);
function c = refresh(c)
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    UpdateFrame(c);
function c = resize(c)
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 81 85
    % 82 85
    % 83 85
    switch whichControl
    case 'PaperSize'
        [c.att.PaperSize, errMsg] = rptgenutil('str2numNxN', c.x.PaperSize, c.att.PaperSize);
        % 87 89
        statbar(c, errMsg, not(isempty(errMsg)));
    case 'PaperUnits'
        oldUnits = c.att.PaperUnits;
        c = controlsupdate(c, whichControl, varargin{:});
        newUnits = c.att.PaperUnits;
        c.att.PaperSize = rptgenutil('SizeUnitTransform', c.att.PaperSize, oldUnits, newUnits, c.x.PaperSize);
    otherwise
        % 95 99
        % 96 99
        % 97 99
        % 98 100
        c = controlsupdate(c, whichControl, varargin{:});
    end % switch
function UpdateFrame(c)
    % 102 106
    % 103 106
    % 104 106
    lType = getparentloop(c);
    ud = get(c.x.LoopImage, 'UserData');
    % 107 109
    typeIndex = find(strcmp(ud(:, 1.0), lType));
    if lt(length(typeIndex), 1.0)
        typeIndex = 1.0;
    else
        typeIndex = typeIndex(1.0);
    end % if
    % 114 116
    descString = ud{typeIndex, 3.0};
    % 116 118
    set(c.x.LoopImage, 'CData', ud{typeIndex, 2.0});
    set(c.x.LoopEcho, 'String', descString);
    % 119 121
    statbar(c, sprintf('Take snapshots of - %s', descString), strncmpi(descString, xlate('Warning'), 7.0));
