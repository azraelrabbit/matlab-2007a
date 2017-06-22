function pList = getPropList(smsrc, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pList = smsrc.PropSrc.getPropList(varargin{:});
    pList{plus(end, 1.0)} = '%<SplitDialogParameters>';
end % function
