function TableCellValues = getParamCellArrayFromBlock(hDlgSrcObj)
    % 1 3
    % 2 3
    TableCellValues = horzcat(ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeName)), ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeFrom)), ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeValue)), ctranspose(des_cellpipe(hDlgSrcObj.Block.AttributeTreatAsVector)));
end % function
