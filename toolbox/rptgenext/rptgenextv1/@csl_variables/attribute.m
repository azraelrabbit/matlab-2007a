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
    contextFrame = controlsframe(c, 'Include Variables');
    optFrame = controlsframe(c, 'Table Columns');
    renderFrame = controlsframe(c, 'Table Display');
    % 14 16
    slCD = getslcdata(c);
    c.x.LoopImage = uicontrol(c.x.all, 'style', 'togglebutton', 'Enable', 'inactive', 'Value', 1.0, 'Cdata', slCD.ModelLarge);
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    c.x.LoopEcho = uicontrol(c.x.all, 'Style', 'text', 'String', 'Workspace variables from reported blocks in current model', 'HorizontalAlignment', 'left');
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    c = controlsmake(c);
    % 27 29
    contextFrame.FrameContent = cellhorzcat(c.x.LoopImage, 5.0, vertcat(cellhorzcat(c.x.LoopEcho), cellhorzcat(c.x.isWorkspaceIO)));
    % 29 32
    % 30 32
    checkPanel = vertcat(cellhorzcat(c.x.isShowParentBlock), cellhorzcat(c.x.isShowCallingString), cellhorzcat(c.x.isShowVariableSize), cellhorzcat(c.x.isShowVariableMemory), cellhorzcat(c.x.isShowVariableClass), cellhorzcat(c.x.isShowVariableValue), cellhorzcat(c.x.isShowTunableProps));
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    verNum = version;
    if eq(verNum(1.0), '5')
        optFrame.FrameContent = checkPanel;
        % 43 45
        set(vertcat(horzcat(c.x.ParameterPropsTitle), horzcat(c.x.ParameterProps)), 'position', [-1000.0 -1000.0 5.0 5.0]);
    else
        optFrame.FrameContent = vertcat(cellhorzcat(checkPanel, vertcat(cellhorzcat(c.x.ParameterPropsTitle), cellhorzcat(c.x.ParameterProps))));
        % 47 50
        % 48 50
    end % if
    % 50 52
    set(c.x.ParameterPropsTitle, 'HorizontalAlignment', 'left');
    % 52 54
    renderFrame.FrameContent = vertcat(cellhorzcat(c.x.TableTitleTitle, c.x.TableTitle), cellhorzcat(5.0, c.x.isBorder));
    % 54 57
    % 55 57
    c.x.LayoutManager = vertcat(cellhorzcat(contextFrame), {[5.0]}, cellhorzcat(optFrame), {[5.0]}, cellhorzcat(renderFrame));
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    c = resize(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 79 82
    % 80 82
    c = controlsupdate(c, whichControl, varargin{:});
end % function
function strOnOff = LocOnOff(logOnOff)
    % 84 88
    % 85 88
    % 86 88
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
end % function
