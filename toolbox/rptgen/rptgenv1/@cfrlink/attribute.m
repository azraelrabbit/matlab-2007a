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
    c = controlsmake(c);
    % 12 14
    myChildren = children(c);
    if gt(length(myChildren), 0.0)
        set(c.x.LinkText, 'String', 'Link text taken from subcomponents', 'Enable', 'off');
        % 16 19
        % 17 19
        set(c.x.isEmphasizeText, 'Enable', 'off')
    end % if
    % 20 23
    % 21 23
    set(horzcat(c.x.LinkTypeTitle, c.x.LinkTextTitle, c.x.LinkIDTitle), 'HorizontalAlignment', 'left');
    % 23 26
    % 24 26
    linkLayout = vertcat(cellhorzcat(cellhorzcat(c.x.LinkTypeTitle, num2cell(ctranspose(c.x.LinkType)))), {[3.0]}, cellhorzcat(c.x.LinkIDTitle), cellhorzcat(cellhorzcat('indent', c.x.LinkID)));
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    textLayout = vertcat(cellhorzcat(c.x.LinkTextTitle), cellhorzcat(vertcat(cellhorzcat('indent', c.x.LinkText), cellhorzcat('indent', c.x.isEmphasizeText))));
    % 31 35
    % 32 35
    % 33 35
    c.x.LayoutManager = vertcat(cellhorzcat(linkLayout), {[10.0]}, cellhorzcat(textLayout));
    % 35 39
    % 36 39
    % 37 39
    ChangeLinkIdentifierTitle(c);
    % 39 41
    c = resize(c);
function c = refresh(c)
    % 42 44
function c = resize(c)
    % 44 55
    % 45 55
    % 46 55
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 56 65
    % 57 65
    % 58 65
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    c = controlsupdate(c, whichControl, varargin{:});
    switch whichControl
    case 'LinkType'
        ChangeLinkIdentifierTitle(c);
    end % switch
function ChangeLinkIdentifierTitle(c)
    % 70 74
    % 71 74
    % 72 74
    switch lower(c.att.LinkType)
    case 'link'
        idStr = 'Anchor ID to reference';
    case 'ulink'
        % 77 79
        idStr = 'Web URL (http://) to link';
    case 'anchor'
        % 80 82
        idStr = 'Anchor ID to create';
    case 'xref'
        % 83 85
        idStr = 'Text ID to insert';
    otherwise
        % 86 88
        idStr = 'Link ID';
        % 88 90
    end % switch
    ltSuffix = xlate('(optional)');
    % 91 93
    set(c.x.LinkIDTitle, 'String', idStr);
    set(c.x.LinkTextTitle, 'String', sprintf('Link text %s', ltSuffix));
