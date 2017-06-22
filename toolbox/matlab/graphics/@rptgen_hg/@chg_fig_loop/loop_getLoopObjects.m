function hList = loop_getLoopObjects(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch upper(c.LoopType)
    case 'ALL'
        adHG = rptgen_hg.appdata_hg;
        % 11 15
        % 12 15
        % 13 15
        if c.isDataFigureOnly
            findTerms = {'HandleVisibility','on'};
        else
            findTerms = {};
        end % if
        % 19 21
        hList = double(find(handle(allchild(0.0)), '-depth', 0.0, 'type', 'figure', 'visible', 'on', findTerms{:}, '-not', {'tag'}, adHG.getSafeTags));
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
    case 'CURRENT'
        % 27 29
        hList = get(0.0, 'CurrentFigure');
    case 'TAG'
        % 30 32
        if isempty(c.TagList)
            tagTerms = {'tag',''};
            regexpTerms = {};
        else
            tagTerms = cellhorzcat({'tag'}, c.TagList);
            if c.UseRegexp
                regexpTerms = {'-regexp'};
            else
                regexpTerms = {};
            end % if
        end % if
        % 42 45
        % 43 45
        hList = double(find(handle(allchild(0.0)), '-depth', 0.0, 'type', 'figure', regexpTerms{:}, tagTerms{:}));
    otherwise
        % 46 50
        % 47 50
        % 48 50
        % 49 51
        hList = [];
    end % switch
    % 52 54
    hList = sort(hList);
