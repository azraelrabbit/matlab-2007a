function A = arrowline(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch nargin
    case 0.0
        A.Class = 'arrowline';
        A.arrowhead = [];
        A.line = [];
        A.fullline = [];
        A.hScale = [];
        A.vScale = [];
        A = class(A, 'arrowline', editline);
        return;
    case 1.0
        % 18 20
        HG = varargin{1.0};
        arrowID = get(HG, 'UserData');
        fig = get(get(HG, 'Parent'), 'Parent');
        components = findall(fig, 'UserData', arrowID);
        % 23 26
        % 24 26
        fulllineH = double(find(handle(components), '-class', 'graph2d.arrow'));
        if isempty(fulllineH)
            fulllineH = findobj(components, 'Tag', 'ScribeArrowlineObject');
        end % if
        lineH = findobj(components, 'Tag', 'ScribeArrowlineBody');
        headH = findobj(components, 'Tag', 'ScribeArrowlineHead');
        % 31 33
        if isempty(fulllineH)
            fulllineH = setdiff(components, horzcat(lineH, headH));
            set(fulllineH, 'Tag', 'ScribeArrowlineObject');
        end % if
        % 36 38
        [fulllineH, lineH, headH, hscale, vscale] = makearrow(fulllineH, lineH, headH);
    otherwise
        % 39 41
        % 40 42
        [fulllineH, lineH, headH, hscale, vscale] = makearrow(varargin{:});
        % 42 46
        % 43 46
        % 44 46
        arrowID = sprintf('%d', double(fulllineH));
        set(horzcat(fulllineH, lineH, headH), {'Tag','UserData'}, vertcat(cellhorzcat('', arrowID), cellhorzcat('ScribeArrowlineBody', arrowID), cellhorzcat('ScribeArrowlineHead', arrowID)));
        % 47 53
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        if not(isa(handle(fulllineH), 'graph2d.arrow'))
            set(fulllineH, 'tag', 'ScribeArrowlineObject');
        end % if
        % 55 57
    end % switch
    % 57 59
    A.Class = 'arrowline';
    A.arrowhead = headH;
    A.line = lineH;
    A.fullline = fulllineH;
    % 62 66
    % 63 66
    % 64 66
    A.hScale = hscale;
    A.vScale = vscale;
    % 67 69
    X = get(lineH, 'XData');
    Y = get(lineH, 'YData');
    % 70 72
    set(horzcat(fulllineH, lineH, headH), 'EraseMode', 'normal');
    % 72 74
    editlineObj = editline(fulllineH);
    % 74 76
    u = getscribecontextmenu(fulllineH);
    setscribecontextmenu(lineH, u);
    setscribecontextmenu(headH, u);
    % 78 80
    A = class(A, 'arrowline', editlineObj);
    scribehandle(A);
