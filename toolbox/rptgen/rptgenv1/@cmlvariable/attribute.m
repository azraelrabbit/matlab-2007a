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
    sourceControls = controlsframe(c, 'Variable to Include ');
    renderControls = controlsframe(c, 'Render Options');
    % 13 15
    c = controlsmake(c);
    % 15 17
    sourceControls.FrameContent = vertcat(cellhorzcat(c.x.sourceTitle, c.x.source(1.0)), cellhorzcat(2.0, cellhorzcat(c.x.source(2.0), num2cell(c.x.filename))), cellhorzcat(2.0, c.x.source(3.0)), {[3.0],[inf,3.0]}, cellhorzcat(c.x.variableTitle, c.x.variable));
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    renderControls.FrameContent = vertcat(cellhorzcat(vertcat(cellhorzcat(c.x.renderAsTitle, num2cell(ctranspose(c.x.renderAs))), {[5.0],[inf,5.0]})), cellhorzcat(c.x.forceinline), {[3.0]}, cellhorzcat(c.x.sizeLimit));
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    c.x.LayoutManager = vertcat(cellhorzcat(sourceControls), {[5.0]}, cellhorzcat(renderControls));
    % 29 33
    % 30 33
    % 31 33
    set(c.x.filename, 'enable', LocOnOff(strcmp('M', c.att.source)));
    % 33 37
    % 34 37
    % 35 37
    c = resize(c);
end
function c = refresh(c)
end
function c = resize(c)
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    c = controlsresize(c);
end
function c = Update(c, whichControl, varargin)
    % 50 53
    % 51 53
    switch whichControl
    case 'variable'
        vString = get(c.x.variable, 'string');
        if isempty(findstr(vString, '%<'))
            [c.att.variable, errMsg] = rptgenutil('VariableNameCheck', c.x.variable, c.att.variable, logical(1));
            % 57 60
            % 58 60
            statbar(c, errMsg, not(isempty(errMsg)));
        else
            c.att.variable = vString;
        end
    case 'source'
        c = controlsupdate(c, whichControl, varargin{:});
        set(c.x.filename, 'enable', LocOnOff(strcmp('M', c.att.source)));
    otherwise
        % 67 69
        c = controlsupdate(c, whichControl, varargin{:});
    end
end
function strOnOff = LocOnOff(logOnOff)
    % 72 75
    % 73 75
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end
end
