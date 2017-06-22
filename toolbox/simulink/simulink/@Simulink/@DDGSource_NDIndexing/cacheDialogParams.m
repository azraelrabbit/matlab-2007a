function cacheDialogParams(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    block = this.getBlock;
    lstParams = fieldnames(block.DialogParameters);
    % 7 9
    for i=1.0:length(lstParams)
        this.DialogData.(lstParams{i}) = block.(lstParams{i});
    end % for
    % 11 15
    % 12 15
    % 13 15
    this.DialogData.IndexOptionArray = block.IndexOptionArray;
    this.DialogData.IndexParamArray = block.IndexParamArray;
    this.DialogData.OutputSizeArray = block.OutputSizeArray;
    % 17 19
end
