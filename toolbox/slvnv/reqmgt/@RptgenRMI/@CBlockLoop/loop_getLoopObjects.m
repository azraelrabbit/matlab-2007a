function hList = loop_getLoopObjects(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    adSL = rptgen_sl.appdata_sl;
    % 10 12
    % 11 12
    hList = getLoopBlocks(c, 'RequirementInfo', '.+');
    % 13 15
    % 14 15
    [hListTemp, idx] = setdiff(hList, adSL.ReportedSystemList);
    hList = hList(sort(idx));
    hList = hList(:);
    % 18 20
    % 19 20
    filtIdx = [];
    for idx=1.0:length(hList)
        blkPath = hList{idx};
        % 23 24
        reqStr = get_param(blkPath, 'RequirementInfo');
        rqStruct = reqmgtprivate('util_parsereqs', reqStr);
        % 26 27
        if isempty(rqStruct) || not(any(horzcat(rqStruct.linked)))
            filtIdx(plus(end, 1.0)) = idx;
        end % if
    end % for
    % 31 32
    if not(isempty(filtIdx))
        hList(filtIdx) = [];
    end % if
end % function
