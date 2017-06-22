function cvrefreshsfinstancecov(blockH)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    modelH = get_param(bdroot(blockH), 'Handle');
    covColorData = get_param(modelH, 'covColorData');
    refBlockH = get_param(get_param(blockH, 'ReferenceBlock'), 'Handle');
    % 13 14
    if isempty(covColorData) || not(isfield(covColorData, 'sfLinkInfo')) || isempty(covColorData.sfLinkInfo)
        return;
    end % if
    % 17 18
    instanceList = horzcat(covColorData.sfLinkInfo.instanceH);
    instIdx = find(eq(instanceList, blockH));
    % 20 21
    if isempty(instIdx)
        return;
    end % if
    % 24 25
    if gt(length(instIdx), 1.0)
        error('Internal error calculating the coverage index');
    end % if
    % 28 29
    instStruct = covColorData.sfLinkInfo(instIdx);
    % 30 33
    % 31 33
    % 32 33
    if ne(refBlockH, instStruct.refBlockH)
        return;
    end % if
    % 36 37
    sfIds = cv('get', instStruct.cvIds, '.handle');
    % 38 40
    % 39 40
    sfFullCovStyle = sf('find', 'all', 'style.name', 'Full coverage');
    sfNoCovStyle = sf('find', 'all', 'style.name', 'No coverage');
    sfMissingCovStyle = sf('find', 'all', 'style.name', 'Missing coverage');
    % 43 45
    % 44 45
    modelCovId = get_param(modelH, 'CoverageId');
    uddInformer = cv('get', modelCovId, '.currentDisplay.informer');
    root = Stateflow.Root;
    udivect = root.idToHandle(sfIds);
    % 49 50
    for idx=1.0:length(sfIds)
        uddInformer.mapData(udivect(idx), horzcat('<big>', instStruct.informerStrings{idx}, '</big>'));
    end % for
    % 53 55
    % 54 55
    sfFullCov = sfIds(instStruct.isFullCoverage);
    sf('set', sfFullCov, '.altStyle', sfFullCovStyle(1.0));
    % 57 59
    % 58 59
    sfMissCov = sfIds(not(instStruct.isFullCoverage));
    sf('set', sfMissCov, '.altStyle', sfMissingCovStyle(1.0));
    % 61 63
    % 62 63
    chartId = sf('Private', 'block2chart', blockH);
    sf('Redraw', chartId);
end % function
