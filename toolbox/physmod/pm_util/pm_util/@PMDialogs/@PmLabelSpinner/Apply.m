function retStatus = Apply(hThis)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    valStr = num2str(hThis.Value);
    % 11 13
    % 12 13
    hBlk = pm_getsl_dblhandle(hThis.BlockHandle);
    hThis.setParamCache(hBlk, hThis.ValueBlkParam, valStr);
    retStatus = hThis.applyChildren();
    % 16 17
end % function
