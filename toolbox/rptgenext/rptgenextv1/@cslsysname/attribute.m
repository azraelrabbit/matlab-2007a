function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
function c = start(c)
    % 8 12
    % 9 12
    % 10 12
    nameFrame = controlsframe(c, 'Show name of current: ');
    renderFrame = controlsframe(c, 'Render name as: ');
    % 13 15
    c = controlsmake(c);
    % 15 17
    c.x.ExampleStringTitle = uicontrol(c.x.all, 'Style', 'text', 'FontAngle', 'italic', 'String', '(Sample) ', 'HorizontalAlignment', 'left');
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    c.x.ExampleString = uicontrol(c.x.all, 'Style', 'text', 'FontWeight', 'bold', 'HorizontalAlignment', 'left');
    % 23 33
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    cdata = getslcdata(c.zslmethods);
    % 33 35
    set(c.x.ObjectType(2.0:5.0), {'cdata'}, vertcat(cellhorzcat(cdata.ModelLarge), cellhorzcat(cdata.SystemLarge), cellhorzcat(cdata.BlockLarge), cellhorzcat(cdata.SignalLarge)), 'String', '');
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    spacer = [-Inf 5.0];
    nameFrame.FrameContent = vertcat({[3.0]}, cellhorzcat(c.x.ObjectType(1.0)), cellhorzcat(cellhorzcat(c.x.ObjectType(2.0), spacer, c.x.ObjectType(3.0), spacer, c.x.ObjectType(4.0), spacer, c.x.ObjectType(5.0))));
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    renderFrame.FrameContent = vertcat(cellhorzcat(vertcat(cellhorzcat(c.x.ExampleStringTitle, c.x.ExampleString), {[3.0],[inf,3.0]})), cellhorzcat(num2cell(ctranspose(c.x.renderAs))), {[5.0]}, cellhorzcat(c.x.isfullname));
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    c.x.LayoutManager = vertcat(cellhorzcat(nameFrame), {[5.0]}, cellhorzcat(renderFrame));
    % 51 55
    % 52 55
    % 53 55
    UpdateAutoText(c);
    % 55 57
    set(c.x.isfullname, 'Enable', onoff(not(any(strcmp({'Model','Signal'}, c.att.ObjectType)))));
    % 57 60
    % 58 60
    LocExampleString(c);
    % 60 62
    c = resize(c);
function c = refresh(c)
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    UpdateAutoText(c);
    LocExampleString(c);
function c = resize(c)
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 80 99
    % 81 99
    % 82 99
    % 83 99
    % 84 99
    % 85 99
    % 86 99
    % 87 99
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
    c = controlsupdate(c, whichControl, varargin{:});
    % 99 101
    switch whichControl
    case 'ObjectType'
        set(c.x.isfullname, 'Enable', onoff(not(any(strcmp({'Model','Signal'}, c.att.ObjectType)))));
        % 103 105
    end % switch
    % 105 107
    LocExampleString(c);
function eString = LocExampleString(c)
    % 108 112
    % 109 112
    % 110 112
    if strcmp(c.att.ObjectType, 'Automatic')
        oType = getparentloop(c);
        if isempty(oType)
            oType = 'Model';
        end % if
    else
        oType = c.att.ObjectType;
    end % if
    % 119 121
    switch oType
    case 'Model'
        oName = 'f14';
        pName = '';
    case 'System'
        oName = 'Aircraft Dynamics Model';
        pName = 'f14/';
    case 'Signal'
        oName = 'w';
        pName = '';
    case 'Block'
        oName = 'Gain4';
        pName = 'f14/Aircraft Dynamics Model/';
    otherwise
        oName = 'Name';
        pName = 'Parent/';
        oType = 'Type';
    end % switch
    % 138 141
    % 139 141
    if c.att.isfullname
        oName = horzcat(pName, oName);
    end % if
    % 143 146
    % 144 146
    switch c.att.renderAs
    case 't n'
        eString = horzcat(oType, ' ', oName);
    case 't-n'
        eString = horzcat(oType, ' - ', oName);
    case 't:n'
        eString = horzcat(oType, ': ', oName);
    otherwise
        eString = oName;
    end % switch
    % 155 157
    set(c.x.ExampleString, 'String', eString);
function UpdateAutoText(c)
    % 158 162
    % 159 162
    % 160 162
    oType = getparentloop(c);
    if isempty(oType)
        oType = 'Model';
    end % if
    % 165 167
    set(c.x.ObjectType(1.0), 'String', sprintf('Automatic (%s)', oType));
function strOnOff = onoff(logOnOff)
    % 168 174
    % 169 174
    % 170 174
    % 171 174
    % 172 174
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
