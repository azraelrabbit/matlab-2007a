function [status, errmsg] = PreApplyCallback(this, dlg)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    block = this.getBlock;
    % 8 11
    % 9 11
    updateParams = fieldnames(block.DialogParameters);
    for i=length(updateParams):-1.0:1.0
        switch updateParams{i}
        case {'NumberOfDimensions','IndexOptions','Indices','OutputSizes'}
            % 14 16
            updateParams = ctranspose(cellhorzcat(updateParams{1.0:minus(i, 1.0)}, updateParams{plus(i, 1.0):end}));
            % 16 18
        end
    end % for
    % 19 21
    set_param_cmd = 'set_param(block.Handle';
    restore_param_cmd = 'set_param(block.Handle';
    numChanges = 0.0;
    % 23 27
    % 24 27
    % 25 27
    strNumDims = dlg.getWidgetValue('_Number_Of_Dimensions_');
    if ~(isequal(block.NumberOfDimensions, strNumDims))
        set_param_cmd = horzcat(set_param_cmd, ',''NumberOfDimensions'',''', strNumDims, '''');
        restore_param_cmd = horzcat(restore_param_cmd, ',''NumberOfDimensions'',''', block.NumberOfDimensions, '''');
        numChanges = plus(numChanges, 1.0);
    else
        numDims = str2double(strNumDims);
        if isnan(numDims) || ne(length(numDims), 1.0) || le(numDims, 0.0) || ne(floor(numDims), numDims)
            set_param_cmd = horzcat(set_param_cmd, ',''NumberOfDimensions'',''', strNumDims, '''');
            restore_param_cmd = horzcat(restore_param_cmd, ',''NumberOfDimensions'',''', block.NumberOfDimensions, '''');
            numChanges = plus(numChanges, 1.0);
        end
    end
    % 39 42
    % 40 42
    for i=1.0:length(updateParams)
        if ~(isequal(this.DialogData.(updateParams{i}), block.(updateParams{i})))
            set_param_cmd = horzcat(set_param_cmd, ',''', updateParams{i}, ''',''', this.DialogData.(updateParams{i}), '''');
            restore_param_cmd = horzcat(restore_param_cmd, ',''', updateParams{i}, ''',''', block.(updateParams{i}), '''');
            numChanges = plus(numChanges, 1.0);
        end
    end % for
    % 48 50
    numDims = this.getNumDims;
    % 50 53
    % 51 53
    if ~(isequal(this.DialogData.IndexOptionArray(1.0:numDims), block.IndexOptionArray))
        IndexOptions = [];
        for i=1.0:minus(numDims, 1.0)
            IndexOptions = horzcat(IndexOptions, this.DialogData.IndexOptionArray{i}, ',');
        end % for
        IndexOptions = horzcat(IndexOptions, this.DialogData.IndexOptionArray{numDims});
        this.DialogData.IndexOptions = IndexOptions;
        set_param_cmd = horzcat(set_param_cmd, ',''IndexOptions'',''', this.DialogData.IndexOptions, '''');
        restore_param_cmd = horzcat(restore_param_cmd, ',''IndexOptions'',''', block.IndexOptions, '''');
        numChanges = plus(numChanges, 1.0);
    end
    % 63 66
    % 64 66
    idxId = this.getColId('idx');
    if ~(isequal(this.DialogData.IndexParamArray(1.0:numDims), block.IndexParamArray))
        Indices = [];
        for i=1.0:minus(numDims, 1.0)
            [idx, status, errmsg] = GetAndCheckExprStr(this.DialogData.IndexParamArray{i}, this, dlg, i, idxId);
            if eq(status, 0.0)
                return
            else
                Indices = horzcat(Indices, idx, ',');
            end
        end % for
        [idx, status, errmsg] = GetAndCheckExprStr(this.DialogData.IndexParamArray{numDims}, this, dlg, numDims, idxId);
        if eq(status, 0.0)
            return
        else
            Indices = horzcat(Indices, idx);
        end
        this.DialogData.Indices = Indices;
        set_param_cmd = horzcat(set_param_cmd, ',''Indices'',''', this.DialogData.Indices, '''');
        restore_param_cmd = horzcat(restore_param_cmd, ',''Indices'',''', block.Indices, '''');
        numChanges = plus(numChanges, 1.0);
    end
    % 87 90
    % 88 90
    outsizeId = this.getColId('outsize');
    if ~(isequal(this.DialogData.OutputSizeArray(1.0:numDims), block.OutputSizeArray))
        OutputSizes = [];
        for i=1.0:minus(numDims, 1.0)
            [outsize, status, errmsg] = GetAndCheckExprStr(this.DialogData.OutputSizeArray{i}, this, dlg, i, outsizeId);
            if eq(status, 0.0)
                return
            else
                OutputSizes = horzcat(OutputSizes, outsize, ',');
            end
        end % for
        [outsize, status, errmsg] = GetAndCheckExprStr(this.DialogData.OutputSizeArray{numDims}, this, dlg, numDims, outsizeId);
        if eq(status, 0.0)
            return
        else
            OutputSizes = horzcat(OutputSizes, outsize);
        end
        this.DialogData.OutputSizes = OutputSizes;
        set_param_cmd = horzcat(set_param_cmd, ',''OutputSizes'',''', OutputSizes, '''');
        restore_param_cmd = horzcat(restore_param_cmd, ',''OutputSizes'',''', block.OutputSizes, '''');
        numChanges = plus(numChanges, 1.0);
    end
    % 111 113
    set_param_cmd = horzcat(set_param_cmd, ')');
    restore_param_cmd = horzcat(restore_param_cmd, ')');
    % 114 116
    status = 1.0;
    errmsg = '';
    if gt(numChanges, 0.0)
        try
            % 119 121
            eval(set_param_cmd);
        catch
            err = sllasterror;
            status = 0.0;
            errmsg = err.Message;
            % 125 128
            % 126 128
            try
                eval(restore_param_cmd);
                % 129 131
            end % try
        end % try
    end
end
function [expr, status, errmsg] = GetAndCheckExprStr(exprStr, source, dlg, dim, colId)
    % 135 139
    % 136 139
    % 137 139
    status = 1.0;
    errmsg = '';
    failed = false;
    try
        tmp = eval(exprStr);
    catch
        failed = true;
        err = lasterror;
    end % try
    if failed && ~(isequal(err.identifier, 'MATLAB:UndefinedFunction'))
        if ~(isequal(dlg.getTableItemValue('_Dimension_Property_', minus(dim, 1.0), minus(colId, 1.0)), exprStr))
            expr = '1';
        else
            block = source.getBlock;
            lstColHeader = source.getDimsPropTableColHeader;
            expr = '';
            errmsg = horzcat('"', lstColHeader{colId}, '" for dimension ', num2str(dim), ' ', err.message);
            status = 0.0;
            return
        end
    else
        expr = exprStr;
    end
    % 161 163
end
