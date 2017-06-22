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
    dispFrame = controlsframe(c, 'Display Options');
    % 24 26
    c = controlsmake(c);
    set(c.x.SourceTitle, 'HorizontalAlignment', 'left');
    % 27 29
    c.x.ColumnsTitle = uicontrol(c.x.all, 'Style', 'text', 'String', 'Columns in table ', 'HorizontalAlignment', 'left');
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    dispFrame.FrameContent = vertcat(cellhorzcat(c.x.TitleTypeTitle, c.x.TitleType(1.0)), cellhorzcat(5.0, cellhorzcat(c.x.TitleType(2.0), c.x.TableTitle)), {[5.0],[5.0]}, cellhorzcat(c.x.ColumnsTitle, vertcat(cellhorzcat(c.x.isSize), cellhorzcat(c.x.isBytes), cellhorzcat(c.x.isClass), cellhorzcat(c.x.isValue))));
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    c.x.LayoutManager = vertcat(cellhorzcat(c.x.SourceTitle), cellhorzcat(vertcat(cellhorzcat('indent', c.x.Source(1.0)), cellhorzcat([], cellhorzcat(c.x.Source(2.0), num2cell(c.x.Filename))))), {[10.0,10.0]}, cellhorzcat(dispFrame));
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    c = resize(c);
    set(c.x.Filename, 'enable', onoff(strcmp(c.att.Source, 'MATFILE')));
    % 50 52
    set(horzcat(c.x.TableTitle), 'enable', onoff(strcmp(c.att.TitleType, 'manual')));
    % 52 54
    LocAutoText(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 58 68
    % 59 68
    % 60 68
    % 61 68
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 70 78
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    c = controlsupdate(c, whichControl, varargin{:});
    switch whichControl
    case 'Source'
        set(c.x.Filename, 'enable', onoff(strcmp(c.att.Source, 'MATFILE')));
        % 81 83
        LocAutoText(c);
    case 'Filename'
        LocAutoText(c);
    case 'TitleType'
        set(horzcat(c.x.TableTitle), 'enable', onoff(strcmp(c.att.TitleType, 'manual')));
        % 87 89
    end % switch
end % function
function strOnOff = onoff(logOnOff)
    % 91 95
    % 92 95
    % 93 95
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
end % function
function LocAutoText(c)
    % 101 104
    % 102 104
    if strcmp(c.att.Source, 'MATFILE')
        autoName = sprintf('File %s', parsevartext(c, c.att.Filename));
    else
        autoName = 'MATLAB Workspace';
    end % if
    % 108 110
    autoTitle = sprintf('Variables from %s', autoName);
    % 110 112
    set(c.x.TitleType(1.0), 'String', sprintf('Automatic (%s)', autoTitle));
end % function
