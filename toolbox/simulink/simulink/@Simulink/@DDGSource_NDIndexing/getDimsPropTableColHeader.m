function colheader = getDimsPropTableColHeader(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    block = this.getBlock;
    % 8 9
    colheader{this.getColId('idxopt')} = block.DialogParameters.IndexOptions.Prompt;
    colheader{this.getColId('idx')} = block.DialogParameters.Indices.Prompt;
    colheader{this.getColId('outsize')} = block.DialogParameters.OutputSizes.Prompt;
    % 12 13
end % function
