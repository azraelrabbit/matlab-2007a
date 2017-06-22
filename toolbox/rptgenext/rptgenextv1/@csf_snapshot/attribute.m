function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end
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
    printOptFrame = controlsframe(c, 'Image Size');
    % 24 26
    c = controlsmake(c, {'imageSizing','PrintSize','PrintUnits','ImageFormat','picMinChildren','isCallouts','TitleType','TitleString'});
    % 26 41
    % 27 41
    % 28 41
    % 29 41
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
    iString = get(c.x.ImageFormat, 'String');
    iUserData = get(c.x.ImageFormat, 'UserData');
    imgInfo = getimgformat(c, 'AUTOSF');
    autoIndex = find(strcmp(iUserData, 'AUTOSF'));
    iString{autoIndex} = sprintf('Automatic (%s)', imgInfo.name);
    set(c.x.ImageFormat, 'String', iString);
    set(c.x.picMinChildrenTitle, 'HorizontalAlignment', 'left');
    % 47 49
    cString = horzcat(num2str(c.att.PrintSize(1.0)), 'x', num2str(c.att.PrintSize(2.0)));
    % 49 51
    set(c.x.PrintSize, 'String', cString);
    % 51 53
    printOptFrame.FrameContent = vertcat(cellhorzcat(cellhorzcat(num2cell(ctranspose(c.x.imageSizing)))), {[5.0]}, cellhorzcat(cellhorzcat(c.x.PrintSizeTitle, c.x.PrintSize, c.x.PrintUnits)));
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    c.x.LayoutManager = vertcat(cellhorzcat(cellhorzcat(c.x.ImageFormatTitle, c.x.ImageFormat)), {[5.0]}, cellhorzcat(c.x.picMinChildrenTitle), cellhorzcat(c.x.picMinChildren), {[5.0]}, cellhorzcat(c.x.isCallouts), {[5.0]}, cellhorzcat(cellhorzcat(c.x.TitleTypeTitle, vertcat(cellhorzcat(c.x.TitleType(1.0)), cellhorzcat(c.x.TitleType(2.0)), cellhorzcat(c.x.TitleType(3.0)), cellhorzcat(c.x.TitleType(4.0)), cellhorzcat(cellhorzcat(c.x.TitleType(5.0), c.x.TitleString))))), {[5.0]}, cellhorzcat(printOptFrame));
    % 59 76
    % 60 76
    % 61 76
    % 62 76
    % 63 76
    % 64 76
    % 65 76
    % 66 76
    % 67 76
    % 68 76
    % 69 76
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    c = resize(c);
    refresh(c);
end
function c = refresh(c)
    % 79 82
    % 80 82
    if ~(rgsf('is_parent_valid', c))
        set(c.x.title, 'String', 'Stateflow Snapshot (invalid parent)');
        [validity, errMsg] = rgsf('is_parent_valid', c);
        statbar(c, sprintf('Error: this component %s', xlate(errMsg)), 1.0);
    else
        parent = rgsf('get_sf_parent', c);
        set(c.x.title, 'String', sprintf('Stateflow Snapshot (%s)', parent.att.typeString));
        statbar(c, '', 0.0);
    end
end
function c = resize(c)
    % 92 101
    % 93 101
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    c = controlsresize(c);
end
function c = Update(c, whichControl, varargin)
    % 103 110
    % 104 110
    % 105 110
    % 106 110
    % 107 110
    % 108 110
    switch whichControl
    case 'PrintSize'
        oldValue = c.att.PrintSize;
        cString = get(c.x.PrintSize, 'String');
        notNumeric = find((lt(abs(cString), abs('0'))) | (gt(abs(cString), abs('9'))));
        cString(notNumeric) = deal(' ');
        nums = [];
        while ~(all(isspace(cString)))
            [numStr, cString] = strtok(cString);
            nums = horzcat(nums, str2double(numStr));
        end % while
        if lt(length(nums), 1.0)
            nums = oldValue;
            sString = 'Please enter size values as NxN';
        else
            if eq(length(nums), 1.0)
                nums = horzcat(nums, nums);
                sString = 'Please enter size values as NxN';
            else
                if gt(length(nums), 2.0)
                    nums = nums(1.0:2.0);
                    sString = 'Please enter size values as NxN';
                else
                    sString = '';
                end
            end
        end
        set(c.x.statusbar, 'String', sString);
        c.att.PrintSize = nums;
        if (lt(nargin, 3.0)) | (~(strcmp(varargin{1.0}, 'callFromPrintUnits')))
            Update(c, 'PrintUnits', 'callFromPrintSize');
        end
        cString = horzcat(num2str(nums(1.0)), 'x', num2str(nums(2.0)));
        set(c.x.PrintSize, 'String', cString);
    case 'PrintUnits'
        oldVal = c.att.PrintUnits;
        newVal = get(c.x.PrintUnits, 'Value');
        strTable = {'inches','centimeters','points'};
        switch oldVal
        case 'inches'
            oldVal = 1.0;
        case 'centimeters'
            oldVal = 2.0;
        case 'points'
            oldVal = 3.0;
        end
        table = [1.0 2.54 72.0];
        scale = mrdivide(table(newVal), table(oldVal));
        c.att.PrintSize = mtimes(c.att.PrintSize, scale);
        if (lt(nargin, 3.0)) | (~(strcmp(varargin{1.0}, 'callFromPrintSize')))
            myStr = horzcat(num2str(c.att.PrintSize(1.0)), 'x', num2str(c.att.PrintSize(2.0)));
            set(c.x.PrintSize, 'String', myStr);
        end
        ptScale = mrdivide(table(3.0), table(newVal));
        c.att.PrintSizePoints = mtimes(c.att.PrintSize, ptScale);
        c.att.PrintUnits = strTable{newVal};
    otherwise
        c = controlsupdate(c, whichControl, varargin{:});
        LocEnable(c, whichControl);
    end
    refresh(c);
end
function LocEnable(c, action)
    % 172 174
    switch action
    case 'disableAll'
        set(c.x.UIcontrolList, 'Enable', 'off');
    case 'isResizeFigure'
        set(horzcat(c.x.PrintSize, c.x.PrintUnits), 'Enable', LocOnOff(strcmp(c.att.isResizeFigure, 'manual')));
    case 'TitleType'
        % 179 181
        set(c.x.TitleString, 'Enable', LocOnOff(strcmp(c.att.TitleType, 'manual')));
        % 181 183
    end
end
function strOnOff = LocOnOff(logOnOff)
    % 185 204
    % 186 204
    % 187 204
    % 188 204
    % 189 204
    % 190 204
    % 191 204
    % 192 204
    % 193 204
    % 194 204
    % 195 204
    % 196 204
    % 197 204
    % 198 204
    % 199 204
    % 200 204
    % 201 204
    % 202 204
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end
end
