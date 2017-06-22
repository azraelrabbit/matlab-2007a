function hList = loop_getLoopObjects(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hList = this.getLoopSystems(varargin{:});
    % 10 11
    blkLoop = RptgenRMI.CBlockLoop;
    adSL = rptgen_sl.appdata_sl;
    % 13 15
    % 14 15
    oldCurrSys = adSL.CurrentSystem;
    oldCurrBlk = adSL.CurrentBlock;
    oldContext = adSL.Context;
    % 18 19
    adSL.Context = 'System';
    % 20 21
    filtIdx = [];
    for idx=1.0:length(hList)
        sysPath = hList{idx};
        % 24 25
        reqStr = get_param(sysPath, 'RequirementInfo');
        % 26 27
        if isempty(reqStr)
            rqStruct = [];
        else
            rqStruct = reqmgtprivate('util_parsereqs', reqStr);
        end % if
        % 32 33
        if isempty(rqStruct) || not(any(horzcat(rqStruct.linked)))
            set(adSL, 'CurrentSystem', sysPath)
            childList = blkLoop.loop_getLoopObjects;
            % 36 37
            if isempty(childList)
                filtIdx(plus(end, 1.0)) = idx;
            end % if
        end % if
    end % for
    % 42 45
    % 43 45
    % 44 45
    if not(isempty(filtIdx))
        hList(filtIdx) = [];
    end % if
    % 48 51
    % 49 51
    % 50 51
    adSL.CurrentSystem = oldCurrSys;
    adSL.CurrentBlock = oldCurrBlk;
    adSL.Context = oldContext;
end % function
