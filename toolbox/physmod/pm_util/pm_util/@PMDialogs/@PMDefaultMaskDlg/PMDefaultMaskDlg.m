function hObj = PMDefaultMaskDlg(block, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    block = get_param(block, 'Handle');
    hObj = PMDialogs.PMDefaultMaskDlg(block);
    % 14 15
    hObj.BlockHandle = block;
end % function
