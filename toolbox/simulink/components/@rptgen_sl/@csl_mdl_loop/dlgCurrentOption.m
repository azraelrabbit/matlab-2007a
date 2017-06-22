function currOption = dlgCurrentOption(this, mdlIdx)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    allOptions = this.LoopList;
    nModels = length(allOptions);
    % 11 12
    if lt(nargin, 2.0)
        mdlIdx = this.DlgLoopListIdx;
    end % if
    % 15 16
    if eq(nModels, 0.0)
        currOption = [];
        mdlIdx = [];
    else
        mdlIdx = plus(max(0.0, min(mdlIdx, minus(nModels, 1.0))), 1.0);
        currOption = allOptions(mdlIdx);
    end % if
end % function
