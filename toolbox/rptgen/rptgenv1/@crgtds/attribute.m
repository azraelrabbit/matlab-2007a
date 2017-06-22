function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end % function
function c = start(c)
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    timeFrame = controlsframe(c, 'Time Stamp Properties');
    dateFrame = controlsframe(c, 'Date Stamp Properties');
    previewFrame = controlsframe(c, 'Stamp Preview');
    % 26 28
    c = controlsmake(c);
    % 28 30
    c.x.previewText = uicontrol(c.x.all, 'Style', 'text', 'String', '', 'BackgroundColor', [1.0 1.0 1.0], 'Fontsize', 14.0);
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    timeFrame.FrameContent = vertcat(cellhorzcat(c.x.istime), cellhorzcat(cellhorzcat(c.x.timesepTitle, c.x.timesep, c.x.timeformatTitle, c.x.timeformat)), cellhorzcat(c.x.timesec));
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    dateFrame.FrameContent = vertcat(cellhorzcat(c.x.isdate), cellhorzcat(vertcat(cellhorzcat(c.x.dateorderTitle, c.x.dateorder, c.x.datemonthTitle, c.x.datemonth), cellhorzcat(c.x.datesepTitle, c.x.datesep, c.x.dateyearTitle, c.x.dateyear))));
    % 41 45
    % 42 45
    % 43 45
    previewFrame.FrameContent = cellhorzcat(c.x.previewText);
    % 45 47
    c.x.LayoutManager = vertcat(cellhorzcat(cellhorzcat(c.x.isprefix, c.x.prefixstring)), {[5.0]}, cellhorzcat(timeFrame), {[5.0]}, cellhorzcat(dateFrame), {[5.0]}, cellhorzcat(previewFrame));
    % 47 59
    % 48 59
    % 49 59
    % 50 59
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    LocRedraw(c);
    % 59 61
    c = resize(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 65 75
    % 66 75
    % 67 75
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 77 85
    % 78 85
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    c = controlsupdate(c, whichControl, varargin{:});
    % 85 87
    LocRedraw(c);
end % function
function LocRedraw(c)
    % 89 92
    % 90 92
    set(c.x.prefixstring, 'enable', LocOnOff(c.att.isprefix));
    % 92 94
    set(horzcat(c.x.dateorder, c.x.datesep, c.x.datemonth, c.x.dateyear), 'enable', LocOnOff(c.att.isdate));
    % 94 96
    set(horzcat(c.x.timeformat, c.x.timesep, c.x.timesec), 'enable', LocOnOff(c.att.istime));
    % 96 99
    % 97 99
    set(c.x.previewText, 'String', execute(c));
end % function
function strOnOff = LocOnOff(logOnOff)
    % 101 104
    % 102 104
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
end % function
