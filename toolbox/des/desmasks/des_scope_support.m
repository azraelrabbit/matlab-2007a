function des_scope_support(action, block, varargin)
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
    des_scope_support_debug = 0.0;
    % 12 16
    % 13 16
    % 14 16
    if lt(nargin, 2.0)
        block = gcbh;
    end % if
    % 18 22
    % 19 22
    % 20 22
    hBlk = get_param(block, 'Handle');
    blkName = horzcat(get_param(block, 'parent'), '/', get_param(block, 'name'));
    blkName = strrep(blkName, char(10.0), ' ');
    blkName = strrep(blkName, char(13.0), ' ');
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    if des_scope_support_debug
        disp(horzcat('starting @@ des_scope_support(', action, ',', num2str(block), '[', blkName, '],', varargin{:}, ')'));
    end % if
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    switch action
    case 'desCloseFcn'
    case 'desCopyFcn'
        % 43 45
        des_get_configset(blkName);
        call_desblock_callback(blkName, 'des_scope2', 'BlockCopy');
    case 'desDeleteFcn'
        % 47 49
        call_desblock_callback(blkName, 'des_scope2', 'BlockDelete');
        % 50 52
    case 'desLoadFcn'
        % 51 53
        des_get_configset(blkName);
        call_desblock_callback(blkName, 'des_scope2', 'LoadModel', blkName);
        % 55 57
    case 'desModelCloseFcn'
    case 'desNameChangeFcn'
        % 57 59
        des_get_configset(blkName);
        call_desblock_callback(blkName, 'des_scope2', 'NameChange');
    case 'desOpenFcn'
        % 61 63
        call_desblock_callback(blkName, 'des_scope2', 'OpenScope', blkName);
    case 'desPostSaveFcn'
    case 'desPreSaveFcn'
    case 'desStartFcn'
    case 'desStopFcn'
        % 67 69
        call_desblock_callback(blkName, 'des_scope2', 'BlockStop', blkName);
    case 'desUndoDeleteFcn'
    otherwise
        % 71 73
        warning(horzcat('Illegal value for action, ''', action, ''', in des_scope_support call from ''', blkName, '''.'));
        % 73 76
        % 74 76
    end % switch
    % 76 78
    if des_scope_support_debug
        disp(horzcat('ending @@ des_scope_support(', action, ',', num2str(block), '[', blkName, '],', varargin{:}, ')'));
    end % if
function call_desblock_callback(blkName, filename, fcnName, varargin)
    % 81 91
    % 82 91
    % 83 91
    % 84 91
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    feval(filename, [], [], [], fcnName, varargin{:});
