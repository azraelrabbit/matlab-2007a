function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end % function
function c = start(c)
    % 9 12
    % 10 12
    loopFrame = controlsframe(c, 'Report On ');
    sortFrame = controlsframe(c, 'Sort Systems ');
    % 13 15
    c = controlsmake(c);
    % 15 17
    slCD = getslcdata(c);
    loopInfo = loopsystem(c.zslmethods);
    % 18 20
    c.x.LoopData = horzcat(loopInfo.contextCode, vertcat(cellhorzcat(slCD.SystemLarge), cellhorzcat(slCD.ModelLarge), cellhorzcat(slCD.SignalLarge), cellhorzcat(slCD.BlockLarge), cellhorzcat(slCD.ModelLarge)), loopInfo.contextName);
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    c.x.LoopImage = uicontrol(c.x.all, 'style', 'togglebutton', 'Enable', 'inactive', 'Value', 1.0, 'Position', [-100.0 -100.0 1.0 1.0]);
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    loopFrame.FrameContent = vertcat(cellhorzcat(c.x.LoopType(1.0)), cellhorzcat(c.x.LoopType(2.0)), cellhorzcat(cellhorzcat('indent', c.x.ObjectList)));
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    sortFrame.FrameContent = num2cell(ctranspose(c.x.SortBy));
    % 37 39
    c.x.LayoutManager = vertcat(cellhorzcat(loopFrame), {[5.0]}, cellhorzcat(sortFrame));
    % 39 43
    % 40 43
    % 41 43
    UpdateFrame(c);
    EnableControls(c);
    % 44 46
    c = resize(c);
end % function
function c = refresh(c)
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    UpdateFrame(c);
end % function
function c = resize(c)
    % 55 58
    % 56 58
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 60 63
    % 61 63
    c = controlsupdate(c, whichControl, varargin{:});
    EnableControls(c);
end % function
function EnableControls(c)
    % 66 76
    % 67 76
    % 68 76
    % 69 76
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    set(horzcat(c.x.ObjectList), 'enable', onoff(strcmp(c.att.LoopType, '$list')));
end % function
function UpdateFrame(c)
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    lType = getparentloop(c);
    ud = c.x.LoopData;
    % 85 87
    typeIndex = find(strcmp(ud(:, 1.0), lType));
    if lt(length(typeIndex), 1.0)
        typeIndex = size(ud, 1.0);
    else
        typeIndex = typeIndex(1.0);
    end % if
    % 92 94
    set(c.x.LoopImage, 'CData', ud{typeIndex, 2.0});
    set(c.x.LoopType(1.0), 'String', sprintf('Auto - %s', ud{typeIndex, 3.0}));
end % function
function strOnOff = onoff(logOnOff)
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
end % function
