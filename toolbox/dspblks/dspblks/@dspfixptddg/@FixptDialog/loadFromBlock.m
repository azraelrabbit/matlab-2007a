function loadFromBlock(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this.RoundingMode = this.Block.roundingMode;
    if strcmpi(this.Block.overflowMode, 'on')
        this.OverflowMode = 'Saturate';
    else
        this.OverflowMode = 'Wrap';
    end % if
    % 16 17
    if this.hasLockScale
        this.LockScale = strcmpi(this.Block.LockScale, 'on');
    end % if
    % 20 22
    % 21 22
    if not(isempty(this.ExtraOp))
        for ind=1.0:length(this.ExtraOp)
            this.ExtraOp(ind).loadFromBlock;
        end % for
    end % if
    % 27 29
    % 28 29
    if not(isempty(this.DataTypeRows))
        for dtrInd=1.0:length(this.DataTypeRows)
            this.DataTypeRows(dtrInd).loadFromBlock;
        end % for
    end % if
end % function
