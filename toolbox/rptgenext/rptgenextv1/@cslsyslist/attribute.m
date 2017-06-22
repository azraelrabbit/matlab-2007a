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
    refFrame = controlsframe(c, 'Starting System');
    dispFrame = controlsframe(c, 'Display Systems');
    styleFrame = controlsframe(c, 'List Style');
    % 14 16
    c = controlsmake(c);
    % 16 18
    refFrame.FrameContent = vertcat({[3.0]}, cellhorzcat(cellhorzcat(c.x.StartSysTitle, num2cell(ctranspose(c.x.StartSys)))), cellhorzcat(c.x.HighlightStartSys));
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    dispFrame.FrameContent = vertcat(cellhorzcat(vertcat(cellhorzcat(c.x.ParentDepthTitle, c.x.ParentDepth), cellhorzcat(c.x.ChildDepthTitle, c.x.ChildDepth))), cellhorzcat(c.x.isPeers));
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    styleFrame.FrameContent = vertcat(cellhorzcat(num2cell(ctranspose(c.x.DisplayAs))));
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    c.x.LayoutManager = vertcat(cellhorzcat(refFrame), {[5.0]}, cellhorzcat(dispFrame), {[5.0]}, cellhorzcat(styleFrame));
    % 36 46
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    c = resize(c);
    % 46 48
    set(horzcat(c.x.isPeers, c.x.ParentDepth), 'Enable', LocOnOff(strcmp(c.x.StartSys, 'TOP')))
function c = refresh(c)
    % 49 52
    % 50 52
function c = resize(c)
    % 52 63
    % 53 63
    % 54 63
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    c = controlsupdate(c, whichControl, varargin{:});
    % 73 75
    switch whichControl
    case 'StartSys'
        set(horzcat(c.x.isPeers, c.x.ParentDepth), 'Enable', LocOnOff(not(strcmp(c.att.StartSys, 'TOP'))))
        % 77 79
    end % switch
function strOnOff = LocOnOff(logOnOff)
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
