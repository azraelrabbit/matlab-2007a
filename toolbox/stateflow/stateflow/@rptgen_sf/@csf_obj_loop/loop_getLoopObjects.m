function hList = loop_getLoopObjects(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if c.isSFFilterList
        searchTerms = rptgen_sf.findTerms(c.SFFilterTerms);
    else
        searchTerms = {};
    end
    % 13 15
    if strcmp(c.Depth, 'local')
        depthTerms = {'-depth',[1.0]};
    else
        depthTerms = {};
    end
    % 19 21
    adSF = rptgen_sf.appdata_sf;
    % 21 23
    [parentID, sfContext] = getContextObject(adSF);
    % 23 25
    if isempty(parentID)
        hList = [];
        return
    else
        if strcmpi(sfContext, 'object')
            depthTerms = {'-depth',[0.0]};
        end
    end
    termTypes = listTerminalTypes(adSF);
    typeFilter = {};
    for i=1.0:length(termTypes)
        if get(c, horzcat('isReport', termTypes{i}))
            if not(isempty(typeFilter))
                typeFilter{plus(end, 1.0)} = '-or';
            end
            thisFilter = cellhorzcat('-isa', horzcat('Stateflow.', termTypes{i}));
            if c.RemoveRedundant
                switch termTypes{i}
                    % 43 46
                    % 44 46
                case {'Transition','Junction','Note','Annotation'}
                    % 45 47
                    thisFilter{plus(end, 1.0)} = {{'-not','Description',''},'-or',{'-not','Document',''}};
                otherwise
                    % 48 50
                    % 49 52
                    % 50 52
                end
            end
            typeFilter{plus(end, 1.0)} = thisFilter;
        end
    end % for
    % 56 59
    % 57 59
    if c.SkipAutogenerated
        filterTerms = cellhorzcat('-function', @isNotAutogenerated);
    else
        filterTerms = {};
    end
    % 63 65
    hList = find(parentID, depthTerms{:}, typeFilter, filterTerms{:}, searchTerms{:});
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    hList = hList(:);
end
function tf = isNotAutogenerated(sfID)
    % 73 80
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    tf = rptgen_sf.isNotAutogenerated(sfID);
end