function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end
function c = start(c)
    % 9 12
    % 10 12
    loopFrame = controlsframe(c, 'Report on ');
    sortFrame = controlsframe(c, 'Sort Signals');
    % 13 17
    % 14 17
    % 15 17
    c = controlsmake(c);
    % 17 19
    slCD = getslcdata(c);
    loopInfo = loopsignal(c.zslmethods);
    liUD = horzcat(loopInfo.contextCode, vertcat(cellhorzcat(slCD.SystemLarge), cellhorzcat(slCD.ModelLarge), cellhorzcat(slCD.SignalLarge), cellhorzcat(slCD.BlockLarge), cellhorzcat(slCD.ModelLarge)), loopInfo.contextName);
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    c.x.LoopImage = uicontrol(c.x.all, 'style', 'togglebutton', 'Enable', 'inactive', 'Value', 1.0, 'UserData', liUD);
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    c.x.LoopEcho = uicontrol(c.x.all, 'Style', 'text', 'HorizontalAlignment', 'left');
    % 32 36
    % 33 36
    % 34 36
    contextRow = vertcat(cellhorzcat(c.x.LoopImage, 3.0, c.x.LoopEcho), {[1.0],[1.0],[inf,1.0]});
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    optionsColumn = cellhorzcat('indent', vertcat(cellhorzcat(c.x.isBlockIncoming), cellhorzcat(c.x.isBlockOutgoing)), vertcat(cellhorzcat(c.x.isSystemIncoming), cellhorzcat(c.x.isSystemOutgoing), cellhorzcat(c.x.isSystemInternal)));
    % 44 47
    % 45 47
    loopFrame.FrameContent = vertcat(cellhorzcat(contextRow), {[5.0]}, cellhorzcat(optionsColumn));
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    sortFrame.FrameContent = num2cell(ctranspose(c.x.SortBy));
    c.x.LayoutManager = vertcat(cellhorzcat(loopFrame), {[5.0]}, cellhorzcat(sortFrame));
    % 56 60
    % 57 60
    % 58 60
    UpdateFrame(c);
    % 60 62
    c = resize(c);
end
function c = refresh(c)
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    UpdateFrame(c);
end
function c = resize(c)
    % 71 74
    % 72 74
    c = controlsresize(c);
end
function c = Update(c, whichControl, varargin)
    % 76 79
    % 77 79
    c = controlsupdate(c, whichControl, varargin{:});
    errMsg = '';
    switch whichControl
    case {'isBlockIncoming','isBlockOutgoing'}
        if not(any(horzcat(c.att.isBlockIncoming, c.att.isBlockOutgoing)))
            c.att = setfield(c.att, whichControl, logical(1));
            set(getfield(c.x, whichControl), 'Value', logical(1));
            errMsg = 'At least one block signal type must be selected';
        else
            LocRedrawPreview(c);
        end
    case {'isSystemIncoming','isSystemOutgoing','isSystemInternal'}
        if not(any(horzcat(c.att.isSystemIncoming, c.att.isSystemOutgoing, c.att.isSystemInternal)))
            % 91 94
            % 92 94
            c.att = setfield(c.att, whichControl, logical(1));
            set(getfield(c.x, whichControl), 'Value', logical(1));
            errMsg = 'At least one system signal type must be selected';
        else
            LocRedrawPreview(c);
        end
    end
    % 100 102
    statbar(c, errMsg, logical(1));
end
function UpdateFrame(c)
    % 104 107
    % 105 107
    lType = getparentloop(c);
    ud = get(c.x.LoopImage, 'UserData');
    % 108 110
    typeIndex = find(strcmp(ud(:, 1.0), lType));
    if lt(length(typeIndex), 1.0)
        typeIndex = size(ud, 1.0);
    else
        typeIndex = typeIndex(1.0);
    end
    % 115 117
    set(c.x.LoopImage, 'CData', ud{typeIndex, 2.0});
    set(c.x.LoopEcho, 'String', ud{typeIndex, 3.0});
    % 118 120
    blockHandles = horzcat(c.x.isBlockIncoming, c.x.isBlockOutgoing);
    systemHandles = horzcat(c.x.isSystemIncoming, c.x.isSystemOutgoing, c.x.isSystemInternal);
    % 121 123
    switch lType
    case 'System'
        set(systemHandles, 'Enable', 'on');
        set(blockHandles, 'Enable', 'off');
    case 'Block'
        set(blockHandles, 'Enable', 'on');
        set(systemHandles, 'Enable', 'off');
    case ''
        set(horzcat(systemHandles, blockHandles), 'Enable', 'on');
    otherwise
        set(horzcat(systemHandles, blockHandles), 'Enable', 'off');
    end
end
function x = LocDrawPreviewPicture(x)
    % 136 141
    % 137 141
    % 138 141
    % 139 141
    childProp = struct('Parent', x.all.Parent, 'Units', x.all.Units, 'Tag', x.all.Tag, 'HandleVisibility', x.all.HandleVisibility, 'Visible', x.all.Visible);
    % 141 147
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    x.previewAxis = axes(childProp, 'Box', 'on', 'Color', 'none', 'Xcolor', [0.0 0.0 0.0], 'Ycolor', [0.0 0.0 0.0], 'Xlim', [0.0 1.0], 'Ylim', [0.0 1.0], 'XTick', [], 'YTick', [], 'ZTick', [], 'visible', 'off');
    % 147 159
    % 148 159
    % 149 159
    % 150 159
    % 151 159
    % 152 159
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    childProp.Parent = x.previewAxis;
end
function LocRedrawPreview(c, currContext)
    % 161 165
    % 162 165
    % 163 165
    if lt(nargin, 2.0)
        currContext = getparentloop(c);
    end
end
