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
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    depthTerms = {};
    loopContext = getContextType(adh, c, logical(0));
    switch loopContext
    case ''
        firstTerm = 0.0;
    case 'Figure'
        firstTerm = currFig;
    case 'Axes'
        firstTerm = adh.CurrentAxes;
    case 'Object'
        firstTerm = adh.CurrentObject;
        depthTerms = {'-depth',[0.0]};
    otherwise
        error('Unrecognized loop context');
    end
    % 41 49
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    if c.ExcludeGUI
        guiTerms = {'-not','type','uicontrol','-not','type','uimenu','-not','type','uicontextmenu','-not','type','uipushtool','-not','type','uitoggletool','-not','type','uitoolbar'};
    else
        % 51 56
        % 52 56
        % 53 56
        % 54 56
        % 55 57
        guiTerms = {};
    end
    % 58 60
    hList = sort(feval(c.IncludeHidden, double(firstTerm), depthTerms{:}, c.SearchTerms{:}, guiTerms{:}, '-not', 'type', 'axes', '-not', 'type', 'figure', '-not', 'type', 'root'));
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
end
