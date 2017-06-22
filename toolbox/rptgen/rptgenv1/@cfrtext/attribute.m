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
    if ischar(c.att.Content)
        c.att.Content = cellstr(c.att.Content);
    end % if
    % 14 16
    c = controlsmake(c, {'Content','isEmphasis','isLiteral'});
    % 16 18
    set(c.x.ContentTitle, 'HorizontalAlignment', 'left');
    % 18 21
    % 19 21
    c = resize(c);
    % 21 23
    LocChangeText(c);
function c = refresh(c)
    % 24 26
function c = resize(c)
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    resizeHandles = horzcat(c.x.ContentTitle, c.x.Content, c.x.isEmphasis, c.x.isLiteral);
    % 34 36
    barHt = 15.0;
    pad = 5.0;
    % 37 39
    xStart = plus(c.x.xzero, pad);
    yStart = plus(c.x.yzero, pad);
    % 40 42
    pageWid = minus(minus(c.x.xlim, c.x.xzero), mtimes(2.0, pad));
    pageHt = minus(minus(c.x.ylim, c.x.yzero), mtimes(2.0, pad));
    % 43 45
    editHt = minus(pageHt, mtimes(3.0, barHt));
    % 45 47
    resizePositions = vertcat(cellhorzcat(horzcat(xStart, plus(plus(yStart, mtimes(2.0, barHt)), editHt), pageWid, barHt)), cellhorzcat(horzcat(xStart, plus(yStart, mtimes(2.0, barHt)), pageWid, editHt)), cellhorzcat(horzcat(xStart, plus(yStart, mtimes(1.0, barHt)), pageWid, barHt)), cellhorzcat(horzcat(xStart, yStart, pageWid, barHt)));
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    set(resizeHandles, {'Position'}, resizePositions);
function c = Update(c, whichControl, varargin)
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    c = controlsupdate(c, whichControl, varargin{:});
    % 58 60
    switch whichControl
    case 'isEmphasis'
        LocChangeText(c);
    end % switch
function LocChangeText(c)
    % 64 68
    % 65 68
    % 66 68
    if c.att.isEmphasis
        set(c.x.Content, 'FontAngle', 'italic');
    else
        set(c.x.Content, 'FontAngle', 'normal');
    end % if
