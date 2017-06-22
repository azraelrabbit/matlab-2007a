function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
function c = start(c)
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    titleFrame = controlsframe(c, 'Title Options');
    mainFrame = controlsframe(c, 'Paragraph Text');
    % 14 16
    c = controlsmake(c);
    % 16 18
    titleFrame.FrameContent = vertcat(cellhorzcat(c.x.TitleType(1.0)), cellhorzcat(c.x.TitleType(2.0)), cellhorzcat(cellhorzcat(c.x.TitleType(3.0), c.x.ParaTitle)));
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    mainFrame.FrameContent = cellhorzcat(c.x.ParaText);
    % 24 27
    % 25 27
    c.x.LayoutManager = vertcat(cellhorzcat(titleFrame), {[5.0]}, cellhorzcat(mainFrame));
    % 27 31
    % 28 31
    % 29 31
    c = refresh(c);
    c = resize(c);
function c = refresh(c)
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    numChild = numsubcomps(c);
    % 40 42
    errMsg = '';
    switch c.att.TitleType
    case 'specify'
        titleEnable = 'on';
        minSubcomps = 0.0;
        titleString = '';
    case 'subcomp'
        titleEnable = 'off';
        minSubcomps = 1.0;
        titleString = '  Paragraph title will be drawn from first child';
        if lt(numChild, 1.0)
            errMsg = 'Warning - no first child component';
        end % if
    otherwise
        titleEnable = 'off';
        minSubcomps = 0.0;
        titleString = '';
    end % switch
    statbar(c, errMsg, 1.0);
    % 60 62
    set(c.x.ParaTitle, 'enable', titleEnable);
    % 62 64
    if gt(numChild, minSubcomps)
        paraString = vertcat({'PARAGRAPH has subcomponents - '}, {'  Paragraph text will be drawn from children'}, {''}, cellhorzcat(titleString));
        % 65 71
        % 66 71
        % 67 71
        % 68 71
        % 69 71
        paraEnable = 'off';
    else
        paraString = c.att.ParaText;
        paraEnable = 'on';
    end % if
    set(c.x.ParaText, 'String', paraString, 'Enable', paraEnable);
    % 76 78
function c = resize(c)
    % 78 86
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 87 96
    % 88 96
    % 89 96
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    c = controlsupdate(c, whichControl, varargin{:});
    % 96 98
    c = refresh(c);
function strOnOff = onoff(logOnOff)
    % 99 103
    % 100 103
    % 101 103
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
