function tblData = getDimsPropTableData(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    block = this.getBlock;
    % 8 9
    numDims = this.getNumDims;
    % 10 11
    lstIdxOpts = block.getPropAllowedValues('IdxOptString');
    % 12 13
    tblData = cell(numDims, 3.0);
    % 14 15
    idxoptId = this.getColId('idxopt');
    idxId = this.getColId('idx');
    outsizeId = this.getColId('outsize');
    % 18 19
    for i=1.0:numDims
        % 20 21
        col_idxopt.Type = 'combobox';
        col_idxopt.Entries = lstIdxOpts;
        col_idxopt.Value = this.getEnumValFromStr(this.DialogData.IndexOptionArray{i}, lstIdxOpts);
        tblData{i, idxoptId} = col_idxopt;
        % 25 27
        % 26 27
        col_idxparam.Type = 'edit';
        col_idxparam.Alignment = 6.0;
        if this.isDialogOpt(col_idxopt.Value)
            col_idxparam.Value = this.DialogData.IndexParamArray{i};
            col_idxparam.Enabled = true;
        else
            if this.isAllOpt(col_idxopt.Value)
                col_idxparam.Value = this.getIndexStrForAllOpt;
            else
                col_idxparam.Value = this.getIndexStrForPortOpt(i);
            end % if
            col_idxparam.Enabled = false;
        end % if
        tblData{i, idxId} = col_idxparam;
        % 41 43
        % 42 43
        col_outsize.Type = 'edit';
        col_outsize.Alignment = 6.0;
        col_outsize.Value = this.DialogData.OutputSizeArray{i};
        col_outsize.Enabled = true;
        tblData{i, outsizeId} = col_outsize;
    end % for
    % 49 50
end % function
