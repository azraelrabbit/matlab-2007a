function siggui_resizefcn(this, IdealSizeW, IdealSizeH)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(nargin, 2.0)
        if eq(length(IdealSizeW), 2.0)
            IdealSizeH = IdealSizeW(2.0);
            IdealSizeW = IdealSizeW(1.0);
        else
            error('Need figure Width and Height')
        end % if
        % 16 18
    end % if
    % 18 21
    % 19 21
    hFig = get(this, 'FigureHandle');
    % 21 24
    % 22 24
    FigureUnits = get(hFig, 'Units');
    % 24 27
    % 25 27
    set(hFig, 'Units', 'Pixels');
    FigureSize = get(hFig, 'position');
    set(hFig, 'Units', FigureUnits);
    % 29 31
    ratW = rdivide(FigureSize(3.0), IdealSizeW);
    ratH = rdivide(FigureSize(4.0), IdealSizeH);
    % 32 34
    SizeRatio = horzcat(ratW, ratH, ratW, ratH);
    % 34 37
    % 35 37
    h = handles2vector(this);
    h = unique(h);
    h(strcmpi('uimenu', get(h, 'Type'))) = [];
    h(strcmpi('text', get(h, 'Type'))) = [];
    h(strcmpi('uicontextmenu', get(h, 'Type'))) = [];
    % 41 43
    if isempty(h)
        return;
    end % if
    h = h(isprop(h, 'Position'));
    if isempty(h)
        return;
    end % if
    for indx=1.0:length(h)
        set(h(indx), 'Position', times(get(h(indx), 'Position'), SizeRatio));
    end % for
end % function
