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
    blocksFrame = controlsframe(c, 'Count Block Types ');
    contentFrame = controlsframe(c, 'Table Content ');
    % 13 15
    c = controlsmake(c);
    % 15 17
    slCD = getslcdata(c);
    liUD = vertcat(cellhorzcat('Model', slCD.ModelLarge, 'In current model: '), cellhorzcat('System', slCD.SystemLarge, 'In current system'), cellhorzcat('Signal', slCD.SignalLarge, 'Warning - "Block Count" can not be a child of "Signal Loop"'), cellhorzcat('Block', slCD.BlockLarge, 'Warning - "Block Count" can not be a child of "Block Loop"'), cellhorzcat('', slCD.ModelLarge, 'All blocks in all models'));
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    c.x.LoopImage = uicontrol(c.x.all, 'style', 'togglebutton', 'Enable', 'inactive', 'Value', 1.0, 'UserData', liUD);
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    c.x.LoopEcho = uicontrol(c.x.all, 'Style', 'text', 'HorizontalAlignment', 'left');
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    blocksFrame.FrameContent = cellhorzcat(c.x.LoopImage, 5.0, vertcat(cellhorzcat(c.x.LoopEcho), cellhorzcat(cellhorzcat('indent', num2cell(ctranspose(c.x.IncludeBlocks))))));
    % 35 38
    % 36 38
    contentFrame.FrameContent = vertcat({[3.0]}, cellhorzcat(cellhorzcat(c.x.TableTitleTitle, c.x.TableTitle)), {[5.0]}, cellhorzcat(c.x.isBlockName), {[5.0]}, cellhorzcat(cellhorzcat(c.x.SortOrderTitle, num2cell(ctranspose(c.x.SortOrder)))));
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    c.x.LayoutManager = vertcat(cellhorzcat(blocksFrame), {[5.0]}, cellhorzcat(contentFrame));
    % 45 49
    % 46 49
    % 47 49
    UpdateFrame(c);
    % 49 51
    c = resize(c);
end % function
function c = refresh(c)
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    UpdateFrame(c);
end % function
function c = resize(c)
    % 60 63
    % 61 63
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 65 68
    % 66 68
    c = controlsupdate(c, whichControl, varargin{:});
    % 68 70
    UpdateFrame(c);
end % function
function UpdateFrame(c)
    % 72 76
    % 73 76
    % 74 76
    lType = getparentloop(c);
    ud = get(c.x.LoopImage, 'UserData');
    % 77 79
    typeIndex = find(strcmp(ud(:, 1.0), lType));
    if lt(length(typeIndex), 1.0)
        typeIndex = 1.0;
    else
        typeIndex = typeIndex(1.0);
    end % if
    % 84 86
    set(c.x.LoopImage, 'CData', ud{typeIndex, 2.0});
    set(c.x.LoopEcho, 'String', ud{typeIndex, 3.0});
    % 87 89
    if strcmp(lType, 'Model')
        set(c.x.IncludeBlocks, 'Enable', 'on');
    else
        set(c.x.IncludeBlocks, 'Enable', 'off');
    end % if
    % 93 95
    statbar(c, sprintf('Count block types - %s', ud{typeIndex, 3.0}), strncmpi(ud{typeIndex, 3.0}, xlate('Warning'), 7.0));
end % function
