function hList = loop_getLoopObjects(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    adh = rptgen_hg.appdata_hg;
    currFig = adh.CurrentFigure;
    % 10 12
    if isempty(currFig)
        hList = [];
        return
    end
    % 15 17
    if strcmp(c.LoopType, 'current')
        hList = get(currFig, 'CurrentAxes');
        return
    end
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    loopContext = getContextType(adh, c, logical(0));
    if isempty(loopContext)
        % 27 30
        % 28 30
        firstTerm = 0.0;
    else
        if strncmp(loopContext, 'fig', 3.0)
            % 32 34
            firstTerm = currFig;
        else
            % 35 37
            firstTerm = adh.CurrentAxes;
        end
    end
    % 39 41
    if c.ExcludeSubclasses
        findTerms = {'-class','hg.axes'};
    else
        findTerms = {'-isa','hg.axes'};
    end
    % 45 47
    hList = sort(feval(c.IncludeHidden, double(firstTerm), findTerms{:}, c.SearchTerms{:}));
    % 47 50
    % 48 50
end
