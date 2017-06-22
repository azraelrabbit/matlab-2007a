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
    nameFrame = controlsframe(c, 'Show Name of Current: ');
    renderFrame = controlsframe(c, 'Render Name As: ');
    % 13 15
    c = controlsmake(c);
    % 15 17
    cdata = gethgcdata(c);
    % 17 19
    set(c.x.ObjType, 'String', '', {'cdata'}, vertcat(cellhorzcat(cdata.FigureLarge), cellhorzcat(cdata.AxesLarge), cellhorzcat(cdata.ObjectLarge)));
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    c.x.ExampleStringTitle = uicontrol(c.x.all, 'Style', 'text', 'FontAngle', 'italic', 'String', '(Sample) ', 'HorizontalAlignment', 'left');
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    c.x.ExampleString = uicontrol(c.x.all, 'Style', 'text', 'FontWeight', 'bold', 'HorizontalAlignment', 'left');
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    spacer = [-Inf 5.0];
    nameFrame.FrameContent = vertcat({[3.0]}, cellhorzcat(cellhorzcat(c.x.ObjType(1.0), spacer, c.x.ObjType(2.0), spacer, c.x.ObjType(3.0))));
    % 36 40
    % 37 40
    % 38 40
    renderFrame.FrameContent = vertcat(cellhorzcat(vertcat(cellhorzcat(c.x.ExampleStringTitle, c.x.ExampleString), {[3.0],[inf,3.0]})), cellhorzcat(cellhorzcat(num2cell(ctranspose(c.x.renderAs)))));
    % 40 44
    % 41 44
    % 42 44
    c.x.LayoutManager = vertcat(cellhorzcat(nameFrame), {[5.0]}, cellhorzcat(renderFrame));
    % 44 48
    % 45 48
    % 46 48
    LocExampleString(c);
    % 48 50
    c = resize(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 54 62
    % 55 62
    % 56 62
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    c = controlsupdate(c, whichControl, varargin{:});
    % 69 71
    LocExampleString(c);
end % function
function eString = LocExampleString(c)
    % 73 76
    % 74 76
    oType = c.att.ObjType;
    % 76 78
    switch oType
    case 'Figure'
        oName = 'FigName';
    case 'Axes'
        oName = 'AxName';
    case 'Object'
        oName = 'ObjName';
    otherwise
        oName = 'Name';
        oType = 'Type';
    end % switch
    % 88 90
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
    % 99 101
    set(c.x.ExampleString, 'String', eString);
end % function
function strOnOff = onoff(logOnOff)
    % 103 106
    % 104 106
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
end % function
