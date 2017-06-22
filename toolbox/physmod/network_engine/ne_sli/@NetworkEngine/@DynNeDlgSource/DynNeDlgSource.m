function hObj = DynNeDlgSource(block, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    block = pm_getsl_dblhandle(block);
    hObj = NetworkEngine.DynNeDlgSource(block);
    hObj.BlockHandle = block;
end % function
