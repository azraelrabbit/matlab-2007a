function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end % function
function c = start(c)
    % 9 13
    % 10 13
    % 11 13
    c = controlsmake(c);
    % 13 16
    % 14 16
    myText = {'while (';')';'    %run subcomponents';'end'};
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    for i=length(myText):-1.0:1.0
        c.x.fillerText(i) = uicontrol(c.x.all, 'style', 'text', 'horizontalAlignment', 'left', 'String', myText{i}, 'FontWeight', 'bold', 'FontName', fixedwidthfont(c));
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
    end % for
    % 28 32
    % 29 32
    % 30 32
    c.x.LayoutManager = vertcat({[10.0]}, cellhorzcat(cellhorzcat(c.x.fillerText(1.0), c.x.ConditionalString, c.x.fillerText(2.0))), cellhorzcat(c.x.fillerText(3.0)), cellhorzcat(c.x.fillerText(4.0)), {[10.0]}, cellhorzcat(cellhorzcat(c.x.isMaxIterations, c.x.MaxIterations)));
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    c = LocReviseNumLoops(c);
    % 39 42
    % 40 42
    c = resize(c);
    % 42 44
    set(horzcat(c.x.MaxIterations), 'enable', LocOnOff(c.att.isMaxIterations));
end % function
function c = refresh(c)
    % 46 48
end % function
function c = resize(c)
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 58 62
    % 59 62
    % 60 62
    c = controlsupdate(c, whichControl, varargin{:});
    % 62 64
    switch whichControl
    case 'MaxIterations'
        c = LocReviseNumLoops(c);
    case 'isMaxIterations'
        set(horzcat(c.x.MaxIterations), 'enable', LocOnOff(c.att.isMaxIterations));
        % 68 70
    end % switch
end % function
function c = LocReviseNumLoops(c)
    % 72 75
    % 73 75
    newNL = floor(c.att.MaxIterations);
    c.att.MaxIterations = newNL;
    set(c.x.MaxIterations, 'Value', newNL);
    set(c.x.isMaxIterations, 'String', sprintf('Limit number of loops to:  %d ', newNL));
end % function
function strVal = LocOnOff(logVal)
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    if logVal
        strVal = 'on';
    else
        strVal = 'off';
    end % if
end % function
