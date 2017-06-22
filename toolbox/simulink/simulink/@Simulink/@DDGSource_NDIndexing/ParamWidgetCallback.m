function ParamWidgetCallback(this, dlg, paramName, refreshFlag, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    dlg.resetSize(refreshFlag);
    % 6 8
    block = this.getBlock;
    % 8 10
    switch block.DialogParameters.(paramName).Type
    case 'enum'
        entries = ctranspose(block.getPropAllowedValues(paramName));
        this.DialogData.(paramName) = entries{plus(varargin{1.0}, 1.0)};
    case 'string'
        this.DialogData.(paramName) = varargin{1.0};
    end
    % 16 18
    if refreshFlag
        dlg.refresh;
    end
    % 20 22
end
