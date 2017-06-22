function errmsg = validateChanges(this)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    errmsg = '';
    if not(isempty(this.ExtraOp))
        errmsg = this.ExtraOp.validateChanges;
    end % if
    % 15 16
    if not(isempty(errmsg))
        return;
    end % if
    % 19 20
    if not(isempty(this.DataTypeRows))
        for dtrInd=1.0:length(this.DataTypeRows)
            errmsg = this.DataTypeRows(dtrInd).validateChanges;
            if not(isempty(errmsg))
                return;
            end % if
        end % for
    end % if
end % function
