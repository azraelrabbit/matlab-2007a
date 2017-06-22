function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pk = findpackage('seqgen');
    % 10 13
    % 11 13
    c = schema.class(pk, 'pn');
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    p = schema.prop(c, 'GenPoly', 'double_vector');
    p.SetFunction = @setGenPoly;
    p.GetFunction = @getGenPoly;
    % 30 33
    % 31 33
    p = schema.prop(c, 'InitialStates', 'double_vector');
    p.SetFunction = @setInitialStates;
    % 34 37
    % 35 37
    p = schema.prop(c, 'CurrentStates', 'double_vector');
    p.SetFunction = @setCurrentStates;
    % 38 41
    % 39 41
    p = schema.prop(c, 'NumBitsOut', 'posint');
    p.FactoryValue = 1.0;
    % 42 45
    % 43 45
    p = schema.prop(c, 'PrivGenPoly', 'double_vector');
    p.Visible = 'off';
    % 46 49
    % 47 49
    p = schema.prop(c, 'PrivMask', 'double_vector');
    p.Visible = 'off';
end
function genPolyBits = setGenPoly(h, genPoly)
    % 52 67
    % 53 67
    % 54 67
    % 55 67
    % 56 67
    % 57 67
    % 58 67
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    if check_bool_vector(genPoly)
        % 67 69
        genPolyBits = genPoly;
        % 69 71
        if lt(length(genPolyBits), 2.0)
            error('comm:seqgen:pn:InvalidGenPolyLength', 'GenPoly length must be greater than one.');
            % 72 74
        end
        % 74 76
        if not(genPolyBits(1.0))
            % 76 78
            genPolyBits = removeLeadingZeros(genPolyBits);
        end
    else
        % 80 82
        if not(check_nonneg_int(genPoly))
            throwInvalidGenPolyValuesError;
        end
        % 84 87
        % 85 87
        genPolyBits = genPolyIntsToBitVector(genPoly);
    end
    % 88 90
    genPolyBits = double(genPolyBits);
    genPolyOrder = minus(length(genPolyBits), 1.0);
    % 91 100
    % 92 100
    % 93 100
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    h.PrivGenPoly = genPolyBits;
    h.InitialStates = horzcat(zeros(1.0, minus(genPolyOrder, 1.0)), 1.0);
    h.CurrentStates = horzcat(zeros(1.0, minus(genPolyOrder, 1.0)), 1.0);
    h.PrivMask = horzcat(zeros(1.0, minus(genPolyOrder, 1.0)), 1.0);
    % 103 107
    % 104 107
    % 105 107
    if le(genPolyOrder, 16.0)
        if not(isequal(gfprimck(fliplr(genPolyBits)), 1.0))
            warning('comm:seqgen:pn:GenPolyNotPrimitive', 'GenPoly is not a primitive polynomial. Type warning(''off'',''comm:seqgen:pn:GenPolyNotPrimitive'') to turn off this warning message.');
            % 109 114
            % 110 114
            % 111 114
            % 112 114
        end
    end
end
function genPoly = getGenPoly(h, genPoly)
    % 117 121
    % 118 121
    % 119 121
    genPoly = h.PrivGenPoly;
end
function initStates = setInitialStates(h, initStates)
    % 123 128
    % 124 128
    % 125 128
    % 126 128
    if isempty(initStates) || not(check_bool_vector(initStates))
        error('comm:seqgen:pn:InvalidInitialStatesValues', 'InitialStates values must be 0 or 1.');
        % 129 131
    end
    % 131 134
    % 132 134
    if ne(length(initStates), minus(length(h.PrivGenPoly), 1.0))
        % 134 136
        if isequal(length(initStates), 1.0)
            initStates = times(initStates, ones(1.0, minus(length(h.PrivGenPoly), 1.0)));
        else
            error('comm:seqgen:pn:InvalidInitialStatesLength', 'InitialStates vector length must equal the GenPoly order.');
            % 139 141
        end
    end
    % 142 145
    % 143 145
    h.CurrentStates = initStates;
end
function currStates = setCurrentStates(h, currStates)
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    if isempty(currStates) || not(check_bool_vector(currStates))
        error('comm:seqgen:pn:InvalidCurrentStatesValues', 'CurrentStates values must be 0 or 1.');
        % 153 155
    end
    % 155 158
    % 156 158
    if ne(length(currStates), minus(length(h.PrivGenPoly), 1.0))
        % 158 160
        if isequal(length(currStates), 1.0)
            currStates = times(currStates, ones(1.0, minus(length(h.PrivGenPoly), 1.0)));
        else
            error('comm:seqgen:pn:InvalidCurrentStatesLength', 'CurrentStates vector length must equal the GenPoly order.');
            % 163 165
        end
    end
end
function success = check_bool_vector(values)
    % 168 177
    % 169 177
    % 170 177
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    success = check_nonneg_int(values) && le(max(values), 1.0);
end
function success = check_nonneg_int(values)
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    success = not(any(rem(values, 1.0))) && ge(min(values), 0.0);
end
function genPolyBits = genPolyIntsToBitVector(genPolyInts)
    % 186 190
    % 187 190
    % 188 190
    if gt(length(genPolyInts), 1.0)
        genPolyIntsCol = genPolyInts(:);
        % 191 194
        % 192 194
        if not(isequal(sort(genPolyIntsCol, 1.0, 'descend'), genPolyIntsCol))
            throwInvalidGenPolyValuesError;
        end
        % 196 198
        numPolyBits = plus(genPolyIntsCol(1.0), 1.0);
        genPolyBits = zeros(numPolyBits, 1.0);
        genPolyBits(plus(genPolyIntsCol, 1.0)) = 1.0;
        genPolyBits = fliplr(ctranspose(genPolyBits));
    else
        % 202 204
        genPolyBits = de2bi(pow2(genPolyInts), 'left-msb');
    end
end
function genPolyBits = removeLeadingZeros(genPolyBits)
    % 207 210
    % 208 210
    genPolyBits = genPolyBits(2.0:end);
    if gt(length(genPolyBits), 1.0)
        if not(genPolyBits(1.0))
            % 212 214
            genPolyBits = removeLeadingZeros(genPolyBits);
        end
    end
end
function throwInvalidGenPolyValuesError
    % 218 221
    % 219 221
    error('comm:seqgen:pn:InvalidGenPolyValues', 'GenPoly values must be 0 or 1, or all non-negative integers. Values specified as non-negative integer powers of two must be in strictly decreasing order.');
    % 221 224
    % 222 224
end
