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
    titleFrame = controlsframe(c, 'Section title ');
    typeFrame = controlsframe(c, 'Section type ');
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    c = controlsmake(c);
    % 26 30
    % 27 30
    % 28 30
    for i=length(c.ref.allTypes):-1.0:1.0
        c.x.TypeText(i) = uicontrol(c.x.all, 'style', 'text', 'horizontalalignment', 'left', 'String', horzcat(c.ref.allTypes{i, 2.0}, '        '));
        % 31 35
        % 32 35
        % 33 35
        indentedLayout{i, 1.0} = cellhorzcat(horzcat(mtimes(10.0, minus(i, 1.0)), 1.0), c.x.TypeText(i));
    end % for
    % 36 38
    UpdateEnable(c);
    % 38 40
    typeFrame.FrameContent = indentedLayout;
    % 40 42
    titleFrame.FrameContent = vertcat(cellhorzcat(c.x.isTitleFromSubComponent(1.0)), cellhorzcat(cellhorzcat(c.x.isTitleFromSubComponent(2.0), c.x.SectionTitle)), {[5.0]}, cellhorzcat(c.x.NumberMode(1.0)), cellhorzcat(cellhorzcat(c.x.NumberMode(2.0), c.x.Number)));
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    c.x.LayoutManager = vertcat(cellhorzcat(titleFrame), {[5.0]}, cellhorzcat(typeFrame));
    % 50 54
    % 51 54
    % 52 54
    c = resize(c);
    % 54 56
    c.x.oldDepth = 0.0;
    UpdateSectionBold(c);
function c = refresh(c)
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    UpdateSectionBold(c);
function c = resize(c)
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    switch whichControl
    case 'isTitleFromSubComponent'
        c = controlsupdate(c, whichControl, varargin{:});
        UpdateEnable(c);
    case 'SectionTitle'
        oldTitle = c.att.SectionTitle;
        c = controlsupdate(c, whichControl, varargin{:});
        if isempty(c.att.SectionTitle)
            c.att.SectionTitle = oldTitle;
            set(c.x.SectionTitle, 'String', oldTitle);
            errString = 'Section title must not be empty';
        else
            errString = '';
        end % if
        statbar(c, errString, not(isempty(errString)));
    case 'NumberMode'
        c = controlsupdate(c, whichControl, varargin{:});
        UpdateEnable(c);
    otherwise
        c = controlsupdate(c, whichControl, varargin{:});
    end % switch
    % 96 98
    UpdateSectionBold(c);
function UpdateEnable(c)
    % 99 103
    % 100 103
    % 101 103
    if c.att.isTitleFromSubComponent
        set(c.x.SectionTitle, 'Enable', 'off');
    else
        set(c.x.SectionTitle, 'Enable', 'on');
    end % if
    % 107 109
    if strcmp(c.att.NumberMode, 'auto')
        set(c.x.Number, 'Enable', 'off');
    else
        set(c.x.Number, 'Enable', 'on');
    end % if
function UpdateSectionBold(c)
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    d = getsectiondepth(c);
    if ne(d, c.x.oldDepth)
        c.x.oldDepth = d;
        set(c.x.TypeText, 'FontWeight', 'normal');
        set(c.x.TypeText(d), 'FontWeight', 'bold');
    end % if
