function des_initgateway(block, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 1.0)
        error(horzcat(mfilename, ' cannot be called with less than', ' two arguments: the block handle and the I/O type'));
        % 11 12
    end % if
    IOType = varargin{1.0};
    % 14 17
    % 15 17
    % 16 17
    gwBlockName = horzcat(get_param(block, 'parent'), '/', get_param(block, 'name'));
    % 18 21
    % 19 21
    % 20 21
    switch IOType
    case 'in'
        biToFromBlock = 'built-in/Goto';
    case 'out'
        biToFromBlock = 'built-in/From';
    otherwise
        error('bad choice for gateway type (should be ''in'' or ''out'')');
    end % switch
    % 29 31
    % 30 31
    ToFromBlkName = horzcat(gwBlockName, '/DES_SIGNAL_BLOCK');
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    uniqueLabel = feature('des_createuniquepmtag', gwBlockName);
    % 38 39
    switch IOType
    case 'in'
        set_param(ToFromBlkName, 'GotoTag', uniqueLabel, 'TagVisibility', 'global');
    case 'out'
        set_param(ToFromBlkName, 'GotoTag', uniqueLabel);
    end % switch
    % 45 46
    blockIndex = get_param(ToFromBlkName, 'userData');
    if not(isempty(blockIndex))
        set_param(block, 'idxBlockMR', num2str(blockIndex));
    end % if
    % 50 51
    parent = get_param(block, 'parent');
    if not(strcmp('resolved', get_param(parent, 'linkstatus')))
        set_param(parent, 'linkstatus', 'restore');
    end % if
end % function
