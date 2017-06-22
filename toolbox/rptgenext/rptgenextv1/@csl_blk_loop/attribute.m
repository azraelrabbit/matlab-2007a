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
    loopFrame = controlsframe(c, 'Report On ');
    optFrame = controlsframe(c, 'Loop Options');
    % 13 15
    c = controlsmake(c, {'LoopType';'ObjectList';'SortBy';'isFilterList'});
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    slCD = getslcdata(c);
    loopInfo = loopblock(c.zslmethods);
    % 23 25
    c.x.LoopData = horzcat(loopInfo.contextCode, vertcat(cellhorzcat(slCD.SystemLarge), cellhorzcat(slCD.ModelLarge), cellhorzcat(slCD.SignalLarge), cellhorzcat(slCD.BlockLarge), cellhorzcat(slCD.ModelLarge)), loopInfo.contextName);
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    c.x.LoopImage = uicontrol(c.x.all, 'style', 'togglebutton', 'Enable', 'inactive', 'Value', 1.0, 'Position', [-100.0 -100.0 1.0 1.0]);
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    loopFrame.FrameContent = vertcat(cellhorzcat(c.x.LoopType(1.0)), cellhorzcat(c.x.LoopType(2.0)), cellhorzcat(cellhorzcat('indent', c.x.ObjectList)));
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    c.x.FilterNameTitle = uicontrol(c.x.all, 'style', 'text', 'HorizontalAlignment', 'left', 'String', 'Property name');
    % 43 47
    % 44 47
    % 45 47
    c.x.FilterValueTitle = uicontrol(c.x.all, 'style', 'text', 'HorizontalAlignment', 'left', 'String', 'Property value');
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    numFilters = 1.0;
    for i=numFilters:-1.0:1.0
        nameIndex = minus(mtimes(i, 2.0), 1.0);
        valueIndex = mtimes(i, 2.0);
        % 60 62
        if ge(length(c.att.FilterTerms), valueIndex)
            nameString = c.att.FilterTerms{nameIndex};
            valueString = c.att.FilterTerms{valueIndex};
        else
            nameString = '';
            valueString = '';
        end
        % 68 70
        cbString = sprintf('%s''UpdateFilter'',%i);', c.x.getobj, nameIndex);
        % 70 73
        % 71 73
        c.x.FilterName(i, 1.0) = uicontrol(c.x.all, 'style', 'edit', 'HorizontalAlignment', 'left', 'BackgroundColor', [1.0 1.0 1.0], 'String', nameString, 'Callback', cbString);
        % 73 80
        % 74 80
        % 75 80
        % 76 80
        % 77 80
        % 78 80
        c.x.FilterValue(i, 1.0) = uicontrol(c.x.all, 'style', 'edit', 'HorizontalAlignment', 'left', 'BackgroundColor', [1.0 1.0 1.0], 'String', valueString, 'Callback', cbString);
        % 80 86
        % 81 86
        % 82 86
        % 83 86
        % 84 86
    end % for
    % 86 88
    optFrame.FrameContent = vertcat(cellhorzcat(cellhorzcat(c.x.SortByTitle, c.x.SortBy)), {[5.0]}, cellhorzcat(c.x.isFilterList), cellhorzcat(vertcat(cellhorzcat('indent', c.x.FilterNameTitle, c.x.FilterValueTitle), cellhorzcat(5.0, num2cell(c.x.FilterName), num2cell(c.x.FilterValue)))), {[3.0]});
    % 88 99
    % 89 99
    % 90 99
    % 91 99
    % 92 99
    % 93 99
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    c.x.LayoutManager = vertcat(cellhorzcat(loopFrame), {[5.0]}, cellhorzcat(optFrame));
    % 99 103
    % 100 103
    % 101 103
    UpdateFrame(c);
    EnableControls(c);
    % 104 107
    % 105 107
    c = resize(c);
end
function c = refresh(c)
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    UpdateFrame(c);
end
function c = resize(c)
    % 116 119
    % 117 119
    c = controlsresize(c);
end
function c = Update(c, whichControl, varargin)
    % 121 124
    % 122 124
    c = controlsupdate(c, whichControl, varargin{:});
    EnableControls(c);
end
function EnableControls(c)
    % 127 131
    % 128 131
    % 129 131
    set(horzcat(c.x.ObjectList), 'enable', onoff(strcmp(c.att.LoopType, '$list')));
    % 131 135
    % 132 135
    % 133 135
    set(vertcat(horzcat(c.x.FilterNameTitle), horzcat(c.x.FilterValueTitle), horzcat(c.x.FilterName), horzcat(c.x.FilterValue)), 'enable', onoff(c.att.isFilterList));
    % 135 137
end
function UpdateFrame(c)
    % 138 142
    % 139 142
    % 140 142
    lType = getparentloop(c);
    ud = c.x.LoopData;
    % 143 145
    typeIndex = find(strcmp(ud(:, 1.0), lType));
    if lt(length(typeIndex), 1.0)
        typeIndex = size(ud, 1.0);
    else
        typeIndex = typeIndex(1.0);
    end
    % 150 152
    set(c.x.LoopImage, 'CData', ud{typeIndex, 2.0});
    set(c.x.LoopType(1.0), 'String', sprintf('Auto - %s', ud{typeIndex, 3.0}));
end
function strOnOff = onoff(logOnOff)
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end
end
function c = UpdateFilter(c, index)
    % 166 170
    % 167 170
    % 168 170
    nameIndex = index;
    valueIndex = plus(index, 1.0);
    hIndex = mrdivide(plus(index, 1.0), 2.0);
    % 172 174
    hName = c.x.FilterName(hIndex);
    hValue = c.x.FilterValue(hIndex);
    % 175 177
    nameString = get(hName, 'String');
    valueString = get(hValue, 'String');
    % 178 180
    if ge(length(c.att.FilterTerms), nameIndex)
        prevName = c.att.FilterTerms{nameIndex};
        newFilter = logical(0);
    else
        prevName = '';
        newFilter = logical(1);
    end
    % 186 188
    if not(isempty(nameString))
        [nameString, errorMsg] = rptgenutil('VariableNameCheck', nameString, prevName, logical(0));
        % 189 193
        % 190 193
        % 191 193
        errorMsg = strrep(errorMsg, 'variable', 'property');
        errorMsg = strrep(errorMsg, 'Variable', 'Property');
    else
        errorMsg = '';
    end
    % 197 200
    % 198 200
    statbar(c, errorMsg, 1.0);
    set(hName, 'String', nameString);
    % 201 203
    c.att.FilterTerms{nameIndex} = nameString;
    c.att.FilterTerms{valueIndex} = valueString;
end
