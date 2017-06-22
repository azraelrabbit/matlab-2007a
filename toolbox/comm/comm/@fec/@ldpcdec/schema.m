function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('fec');
    c = schema.class(pk, 'ldpcdec');
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'ParityCheckMatrix', 'mxArray');
    p.SetFunction = @setParityCheckMatrix;
    p.GetFunction = @getParityCheckMatrix;
    % 19 22
    % 20 22
    p = schema.prop(c, 'StoredParityCheckMatrix', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 24 26
    p = schema.prop(c, 'BlockLength', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 27 29
    p = schema.prop(c, 'NumInfoBits', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 30 32
    p = schema.prop(c, 'NumParityBits', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 33 35
    p = schema.prop(c, 'DecisionType', 'string');
    p.SetFunction = @setDecisionType;
    p.GetFunction = @getDecisionType;
    % 37 40
    % 38 40
    p = schema.prop(c, 'StoredDecisionType', 'string');
    p.FactoryValue = 'Hard decision';
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 43 45
    p = schema.prop(c, 'OutputFormat', 'string');
    p.SetFunction = @setOutputFormat;
    p.GetFunction = @getOutputFormat;
    % 47 50
    % 48 50
    p = schema.prop(c, 'StoredOutputFormat', 'string');
    p.FactoryValue = 'Information part';
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 53 55
    p = schema.prop(c, 'DoParityChecks', 'string');
    p.SetFunction = @setDoParityChecks;
    p.GetFunction = @getDoParityChecks;
    % 57 60
    % 58 60
    p = schema.prop(c, 'StoredDoParityChecks', 'string');
    p.FactoryValue = 'No';
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 63 65
    p = schema.prop(c, 'NumIterations', 'double');
    p.SetFunction = @setNumIterations;
    p.GetFunction = @getNumIterations;
    % 67 70
    % 68 70
    p = schema.prop(c, 'StoredNumIterations', 'double');
    p.FactoryValue = 50.0;
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 73 75
    p = schema.prop(c, 'ActualNumIterations', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    % 77 79
    p = schema.prop(c, 'FinalParityChecks', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    % 81 84
    % 82 84
    p = schema.prop(c, 'dlist', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 86 89
    % 87 89
    p = schema.prop(c, 'rlist', 'mxArray');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
function H = getParityCheckMatrix(h, H)
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    H = h.StoredParityCheckMatrix;
end % function
function H = getDecisionType(h, H)
    H = h.StoredDecisionType;
end % function
function H = getOutputFormat(h, H)
    H = h.StoredOutputFormat;
end % function
function H = getDoParityChecks(h, H)
    H = h.StoredDoParityChecks;
end % function
function H = getNumIterations(h, H)
    H = h.StoredNumIterations;
end % function
function H = setParityCheckMatrix(h, H)
    % 112 118
    % 113 118
    % 114 118
    % 115 118
    % 116 118
    if not(issparse(H))
        error('comm:ldpcdec:NonSparseParityCheckMatrix', 'The parity-check matrix must be a sparse matrix.');
        % 119 121
    end % if
    % 121 123
    N = size(H, 2.0);
    K = minus(size(H, 2.0), size(H, 1.0));
    % 124 126
    if le(N, 0.0)
        error('comm:ldpcdec:InvalidNumColumns', 'The parity-check matrix must have at least one column.');
        % 127 129
    end % if
    % 129 131
    if le(K, 0.0)
        error('comm:ldpcdec:TooFewColumns', 'The parity-check matrix must have more columns than rows.');
        % 132 134
    end % if
    % 134 136
    X = nonzeros(H);
    if not(isempty(find(ne(X, 1.0), 1.0)))
        error('comm:ldpcdec:NotZeroOneMatrix', 'The parity-check matrix must be a zero-one matrix.');
        % 138 140
    end % if
    % 140 142
    [i, j] = find(H);
    j = horzcat(full(sum(H)), -1.0);
    if not(isempty(find(eq(j, 0.0), 1.0)))
        error('comm:ldpcdec:EmptyColumn', 'The parity-check matrix must have at least one non-zero element in each column.');
        % 145 147
    end % if
    % 147 149
    x = find(minus(j(2.0:end), j(1.0:minus(end, 1.0))));
    y = j(x);
    % 150 152
    setprivprop(h, 'rlist', int32(minus(i, 1.0)));
    setprivprop(h, 'dlist', int32(reshape(vertcat(filter([1.0 -1.0], 1.0, x), y), 1.0, [])));
    setprivprop(h, 'StoredParityCheckMatrix', gt(H, 0.0));
    setprivprop(h, 'BlockLength', N);
    setprivprop(h, 'NumParityBits', minus(N, K));
    setprivprop(h, 'NumInfoBits', K);
end % function
function H = setNumIterations(h, H)
    % 159 162
    % 160 162
    if le(H, 0.0) || ne(round(H), H)
        error('comm:ldpcdec:InvalidNumIterations', 'NumIterations must be a positive integer.');
        % 163 165
    end % if
    % 165 167
    setprivprop(h, 'StoredNumIterations', H);
end % function
function H = setDoParityChecks(h, H)
    % 169 172
    % 170 172
    s = lower(H);
    if strcmp(s, 'yes')
        s(1.0) = 'Y';
    else
        if strcmp(s, 'no')
            s(1.0) = 'N';
        else
            error('comm:ldpcdec:InvalidDoParityChecks', 'DoParityChecks must be either ''Yes'' or ''No''.');
        end % if
        % 180 182
    end % if
    setprivprop(h, 'StoredDoParityChecks', s);
end % function
function H = setDecisionType(h, H)
    % 185 187
    s = lower(H);
    if strcmp(s, 'hard decision')
        s(1.0) = 'H';
    else
        if strcmp(s, 'soft decision')
            s(1.0) = 'S';
        else
            error('comm:ldpcdec:InvalidDecisionType', 'DecisionType must be either ''Hard decision'' or ''Soft decision''.');
        end % if
        % 195 197
    end % if
    setprivprop(h, 'StoredDecisionType', s);
end % function
function H = setOutputFormat(h, H)
    % 200 202
    s = lower(H);
    if strcmp(s, 'information part')
        s(1.0) = 'I';
    else
        if strcmp(s, 'whole codeword')
            s(1.0) = 'W';
        else
            error('comm:ldpcdec:InvalidOutputFormat', 'OutputFormat must be either ''Information part'' or ''Whole codeword''.');
        end % if
        % 210 212
    end % if
    setprivprop(h, 'StoredOutputFormat', s);
end % function
