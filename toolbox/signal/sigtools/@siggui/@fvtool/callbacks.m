function fcns = callbacks(hObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    fcns = siggui_cbs(hObj);
    fcns.analysis = cellhorzcat(@analysis_cb, hObj);
    fcns.editparams = cellhorzcat(fcns.method, hObj, 'editparameters');
    fcns.editfs = cellhorzcat(fcns.method, hObj, 'editfs');
    fcns.righthand = cellhorzcat(@righthand_cb, hObj);
end % function
function analysis_cb(hcbo, eventStruct, hObj)
    % 14 18
    % 15 18
    % 16 18
    hFig = get(hObj, 'FigureHandle');
    p = getptr(hFig);
    setptr(hFig, 'watch');
    lastwarn('');
    % 21 24
    % 22 24
    analysis = get(hcbo, 'tag');
    % 24 26
    set(hObj, 'Analysis', analysis);
    % 26 29
    % 27 29
    if strcmpi('uitoggletool', get(hcbo, 'Type'))
        set(hcbo, 'State', 'On');
    end % if
    % 31 33
    set(hFig, p{:});
end % function
function righthand_cb(hcbo, eventStruct, hObj)
    % 35 38
    % 36 38
    hFig = get(hObj, 'FigureHandle');
    p = getptr(hFig);
    setptr(hFig, 'watch');
    lastwarn('');
    % 41 43
    analysis = get(hcbo, 'Tag');
    analysis = analysis(11.0:end);
    set(hObj, 'OverlayedAnalysis', analysis);
    % 45 47
    set(hFig, p{:});
end % function
