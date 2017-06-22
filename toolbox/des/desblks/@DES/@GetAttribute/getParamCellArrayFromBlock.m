function TableCellValues = getParamCellArrayFromBlock(hDlgSrcObj)
    % 1 3
    % 2 3
    TableCellValues = horzcat(ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeName)), ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeMissing)), ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeDefaultValue)), ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeTreatAsVector)), ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeSendTiming)));
    % 4 5
end % function
