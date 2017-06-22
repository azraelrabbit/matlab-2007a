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
    loopFrame = controlsframe(c, 'Loop Type');
    variFrame = controlsframe(c, 'Workspace Variable');
    prevFrame = controlsframe(c, 'Preview');
    % 26 28
    c = controlsmake(c);
    % 28 30
    c.x.PreviewText = uicontrol(c.x.all, 'style', 'text', 'horizontalAlignment', 'left', 'String', '', 'FontName', fixedwidthfont(c));
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    loopFrame.FrameContent = vertcat(cellhorzcat(c.x.LoopType(1.0)), cellhorzcat(vertcat(cellhorzcat('indent', c.x.StartNumberTitle, c.x.StartNumber), cellhorzcat(1.0, c.x.IncrementNumberTitle, c.x.IncrementNumber), cellhorzcat(1.0, c.x.EndNumberTitle, c.x.EndNumber))), cellhorzcat(c.x.LoopType(2.0)), cellhorzcat(cellhorzcat('indent', c.x.LoopVectorTitle, c.x.LoopVector)));
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    variFrame.FrameContent = vertcat(cellhorzcat(c.x.isUseVariable), cellhorzcat(cellhorzcat('indent', c.x.VariableNameTitle, c.x.VariableName)), cellhorzcat(cellhorzcat('indent', c.x.isCleanup)));
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    prevFrame.FrameContent = vertcat(cellhorzcat(c.x.PreviewText), {[inf,1.0]});
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    c.x.LayoutManager = vertcat(cellhorzcat(loopFrame), {[3.0]}, cellhorzcat(variFrame), {[3.0]}, cellhorzcat(prevFrame));
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    c = EnableControls(c);
    % 69 100
    % 70 100
    % 71 100
    % 72 100
    % 73 100
    % 74 100
    % 75 100
    % 76 100
    % 77 100
    % 78 100
    % 79 100
    % 80 100
    % 81 100
    % 82 100
    % 83 100
    % 84 100
    % 85 100
    % 86 100
    % 87 100
    % 88 100
    % 89 100
    % 90 100
    % 91 100
    % 92 100
    % 93 100
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    c = resize(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 113 150
    % 114 150
    % 115 150
    % 116 150
    % 117 150
    % 118 150
    % 119 150
    % 120 150
    % 121 150
    % 122 150
    % 123 150
    % 124 150
    % 125 150
    % 126 150
    % 127 150
    % 128 150
    % 129 150
    % 130 150
    % 131 150
    % 132 150
    % 133 150
    % 134 150
    % 135 150
    % 136 150
    % 137 150
    % 138 150
    % 139 150
    % 140 150
    % 141 150
    % 142 150
    % 143 150
    % 144 150
    % 145 150
    % 146 150
    % 147 150
    % 148 150
    c = controlsupdate(c, whichControl, varargin{:});
    % 150 152
    c = EnableControls(c);
end % function
function strVal = LocOnOff(logVal)
    % 154 157
    % 155 157
    if logVal
        strVal = 'on';
    else
        strVal = 'off';
    end % if
end % function
function c = EnableControls(c)
    % 163 166
    % 164 166
    set(horzcat(c.x.VariableName, c.x.isCleanup), 'enable', LocOnOff(c.att.isUseVariable));
    % 166 169
    % 167 169
    set(horzcat(c.x.StartNumber, c.x.IncrementNumber, c.x.EndNumber), 'enable', LocOnOff(strcmp(c.att.LoopType, '$increment')));
    % 169 172
    % 170 172
    set(horzcat(c.x.LoopVector), 'enable', LocOnOff(strcmp(c.att.LoopType, '$vector')));
    % 172 175
    % 173 175
    set(c.x.PreviewText, 'String', sprintf('%s\n     %%run child components\nend', outlinestring(c)));
end % function
