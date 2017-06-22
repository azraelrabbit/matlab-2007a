function hObj = DynDlgSource(block, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    block = get_param(block, 'Handle');
    hObj = PMDialogs.DynDlgSource(block);
    hObj.BlockHandle = block;
end % function
