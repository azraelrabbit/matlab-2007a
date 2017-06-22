function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('fec');
    c = schema.class(pk, 'ldpcenc');
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'ParityCheckMatrix', 'mxArray');
    p.SetFunction = @setParityCheckMatrix;
    p.GetFunction = @getParityCheckMatrix;
    % 20 22
    % 21 22
    p = schema.prop(c, 'StoredParityCheckMatrix', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 25 26
    p = schema.prop(c, 'BlockLength', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 28 29
    p = schema.prop(c, 'NumInfoBits', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 31 32
    p = schema.prop(c, 'NumParityBits', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 34 35
    p = schema.prop(c, 'EncodingAlgorithm', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 37 38
    p = schema.prop(c, 'RowOrder', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 41 42
    p = schema.prop(c, 'EncodingMethod', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 45 46
    p = schema.prop(c, 'MatrixA_RowIndices', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 49 50
    p = schema.prop(c, 'MatrixA_RowStartLoc', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 53 54
    p = schema.prop(c, 'MatrixA_ColumnSum', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 57 58
    p = schema.prop(c, 'MatrixB_RowIndices', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 61 62
    p = schema.prop(c, 'MatrixB_RowStartLoc', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 65 66
    p = schema.prop(c, 'MatrixB_ColumnSum', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 69 70
    p = schema.prop(c, 'MatrixL_RowIndices', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 73 74
    p = schema.prop(c, 'MatrixL_RowStartLoc', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 77 78
    p = schema.prop(c, 'MatrixL_ColumnSum', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
function H = getParityCheckMatrix(h, H)
    % 83 100
    % 84 100
    % 85 100
    % 86 100
    % 87 100
    % 88 100
    % 89 100
    % 90 100
    % 91 100
    % 92 100
    % 93 100
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    % 99 100
    H = h.StoredParityCheckMatrix;
end % function
