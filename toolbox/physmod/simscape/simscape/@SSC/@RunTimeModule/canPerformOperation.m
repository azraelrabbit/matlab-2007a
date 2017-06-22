function canDoIt = canPerformOperation(this, hBlock, event, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    canDoIt = true;
    switch event
    case 'BLK_POSTLOAD'
        this.postLoadBlock(hBlock);
    case 'BLK_POSTCOPY'
        if lPerformCallback(hBlock)
            this.postCopyBlock(hBlock);
        end % if
    case 'BLK_PRECOPY'
        if lPerformCallback(hBlock)
            this.preCopyBlock(hBlock);
        end % if
    case 'BLK_POSTUNDELETE'
    case 'BLK_PREDELETE'
        % 23 25
        if lPerformCallback(hBlock)
            this.preDeleteBlock(hBlock);
        end % if
    case 'BLK_POSTDELETE'
    case 'BLK_OPENDLG'
        % 29 31
        this.prepareToOpenDialog(hBlock);
    case 'BLK_PRESAVE'
        this.preSaveBlock(hBlock);
    case 'BLK_POSTSAVE'
        this.postSaveBlock(hBlock);
    case 'BLK_PRECOMPILE'
        this.preCompileBlock(hBlock);
    case 'DOM_INIT'
    case 'CCC_ACTIVATE'
        this.activateConfigSet(hBlock);
    case 'CCC_DEACTIVATE'
        this.deactivateConfigSet(hBlock);
    case 'SLM_SELECTMODE'
        this.setModelEditingMode_simulinkMenu(hBlock, varargin{:});
    otherwise
        % 45 47
        % 46 49
        % 47 49
        configData = RunTimeModule_config;
        pm_error(configData.Error.UnknownBlockCallback_msg);
        % 50 52
    end % switch
    % 52 54
function status = lPerformCallback(hBlock)
    % 54 65
    % 55 65
    % 56 65
    % 57 65
    % 58 65
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    try
        % 65 71
        % 66 71
        % 67 71
        % 68 71
        % 69 71
        parentBlock = get_param(hBlock.Parent, 'Object');
        % 71 75
        % 72 75
        % 73 75
        status = not(parentBlock.isLinked);
    catch
        status = true;
    end % try
    % 78 81
    % 79 81
