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
    displayFrame = controlsframe(c, 'Display Options');
    contentFrame = controlsframe(c, 'Report Options');
    % 13 15
    c = controlsmake(c);
    ChangeListTitleTitle(c);
    % 16 18
    contentFrame.FrameContent = vertcat(cellhorzcat(cellhorzcat(c.x.LinkToTitle, num2cell(ctranspose(c.x.LinkTo)))), cellhorzcat(c.x.isBlockType));
    % 18 22
    % 19 22
    % 20 22
    displayFrame.FrameContent = vertcat(cellhorzcat(c.x.RenderAsTitle, num2cell(ctranspose(c.x.RenderAs))), cellhorzcat(c.x.ListTitleTitle, c.x.ListTitle));
    % 22 26
    % 23 26
    % 24 26
    c.x.LayoutManager = vertcat(cellhorzcat(contentFrame), {[5.0]}, cellhorzcat(displayFrame));
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    c = resize(c);
function c = refresh(c)
    % 32 34
function c = resize(c)
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 43 47
    % 44 47
    % 45 47
    c = controlsupdate(c, whichControl, varargin{:});
    switch whichControl
    case 'RenderAs'
        ChangeListTitleTitle(c);
    end % switch
function ChangeListTitleTitle(c)
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    if strcmp(c.att.RenderAs, 'cfrlist')
        tString = '   List title ';
    else
        tString = 'Table title ';
    end % if
    % 61 63
    set(c.x.ListTitleTitle, 'String', tString);
