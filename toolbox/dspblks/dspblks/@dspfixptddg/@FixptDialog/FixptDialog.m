function this = FixptDialog(controller, baseDTs, otherDTs, extraOp)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    this = dspfixptddg.FixptDialog;
    % 22 24
    if lt(nargin, 3.0)
        otherDTs = {};
    end
    if lt(nargin, 4.0)
        extraOp = [];
    end
    % 29 31
    this.Controller = controller;
    this.Block = controller.block;
    this.ExtraOp = extraOp;
    % 33 36
    % 34 36
    this.hasLockScale = isfield(this.Block.DialogParameters, 'LockScale');
    % 36 38
    this.TotalOpRows = 1.0;
    ExtraDTypeRows = [];
    for ind=1.0:length(extraOp)
        if isempty(extraOp(ind).UserData)
            extraOp(ind).UserData = 'FixptOP';
        end
        rowspan = extraOp(ind).DialogSchema.RowSpan;
        switch extraOp(ind).UserData
        case 'FixptOP'
            this.TotalOpRows = plus(this.TotalOpRows, 1.0);
        case 'FixptDType'
            ExtraDTypeRows = cat(2.0, ExtraDTypeRows, rowspan(1.0):rowspan(2.0));
        end
    end % for
    % 51 53
    ExtraDTypeRows = unique(ExtraDTypeRows);
    % 53 55
    this.TotalDataTypeRows = plus(plus(1.0, this.hasLockScale), length(ExtraDTypeRows));
    % 55 57
    baseOffset = plus(length(otherDTs), 1.0);
    otherOffset = 1.0;
    % 58 60
    dtRows = handle(1.0:plus(length(baseDTs), length(otherDTs)));
    % 60 62
    row = plus(1.0, baseOffset);
    row = plus(row, sum(le(ExtraDTypeRows, row)));
    for ind=1.0:length(baseDTs)
        while any(eq(row, ExtraDTypeRows))
            row = plus(row, 1.0);
        end % while
        dtRows(ind) = dspfixptddg.DataTypeRow(baseDTs{ind}, row, controller);
        % 68 71
        % 69 71
        row = plus(row, 1.0);
    end % for
    % 72 74
    row = plus(1.0, otherOffset);
    row = plus(row, sum(le(ExtraDTypeRows, row)));
    for ind=1.0:length(otherDTs)
        while any(eq(row, ExtraDTypeRows))
            row = plus(row, 1.0);
        end % while
        if isfield(otherDTs{ind}, 'Type')
            dtRows(plus(ind, length(baseDTs))) = dspfixptddg.(otherDTs{ind}.Type)(row, controller, otherDTs{ind});
        else
            % 82 85
            % 83 85
            % 84 86
            customType.name = 'custom';
            dtRows(plus(ind, length(baseDTs))) = dspfixptddg.DataTypeRow(customType, row, controller, otherDTs{ind});
            % 87 91
            % 88 91
            % 89 91
        end
        row = plus(row, 1.0);
    end % for
    % 93 95
    this.DataTypeRows = dtRows;
    % 95 97
    this.TotalDataTypeRows = plus(this.TotalDataTypeRows, length(this.DataTypeRows));
    % 97 99
    this.loadFromBlock;
end
