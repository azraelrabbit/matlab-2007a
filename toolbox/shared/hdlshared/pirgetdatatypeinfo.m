function tpinfo = pirgetdatatypeinfo(hT)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    className = hT.getClassName;
    % 22 24
    tpinfo.iscomplex = 0.0;
    tpinfo.numdims = 1.0;
    tpinfo.dims = 1.0;
    tpinfo.isscalar = 1.0;
    tpinfo.isvector = 0.0;
    tpinfo.ismatrix = 0.0;
    tpinfo.vector = 0.0;
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    tpinfo.isnative = 1.0;
    % 39 41
    switch className
    case 'tp_single'
        % 42 45
        % 43 45
        tpinfo.sltype = 'single';
        tpinfo.wordsize = 0.0;
        tpinfo.issigned = 1.0;
        tpinfo.binarypoint = 0.0;
    case 'tp_double'
        % 49 52
        % 50 52
        tpinfo.sltype = 'double';
        tpinfo.wordsize = 0.0;
        tpinfo.issigned = 1.0;
        tpinfo.binarypoint = 0.0;
    case 'tp_boolean'
        % 56 59
        % 57 59
        tpinfo.sltype = 'boolean';
        tpinfo.wordsize = 1.0;
        tpinfo.issigned = 0.0;
        tpinfo.binarypoint = 0.0;
    case 'tp_logic'
        % 63 66
        % 64 66
        wlen = hT.WordLength;
        % 66 68
        tpinfo.wordsize = wlen;
        tpinfo.issigned = 0.0;
        tpinfo.binarypoint = 0.0;
        % 70 72
        if eq(wlen, 1.0)
            tpinfo.sltype = 'boolean';
        else
            tpinfo.isnative = 0.0;
            tpinfo.sltype = horzcat('ufix', num2str(wlen));
        end
    case 'tp_signed'
        % 78 81
        % 79 81
        wlen = hT.WordLength;
        % 81 83
        tpinfo.wordsize = wlen;
        tpinfo.issigned = 1.0;
        tpinfo.binarypoint = 0.0;
        % 85 87
        switch wlen
        case 8.0
            tpinfo.sltype = 'int8';
        case 16.0
            tpinfo.sltype = 'int16';
        case 32.0
            tpinfo.sltype = 'int32';
        otherwise
            tpinfo.isnative = 0.0;
            tpinfo.sltype = horzcat('sfix', num2str(wlen));
        end
    case 'tp_unsigned'
        % 98 101
        % 99 101
        wlen = hT.WordLength;
        % 101 103
        tpinfo.wordsize = wlen;
        tpinfo.issigned = 0.0;
        tpinfo.binarypoint = 0.0;
        % 105 107
        switch wlen
        case 8.0
            tpinfo.sltype = 'uint8';
        case 16.0
            tpinfo.sltype = 'uint16';
        case 32.0
            tpinfo.sltype = 'uint32';
        otherwise
            tpinfo.isnative = 0.0;
            tpinfo.sltype = horzcat('ufix', num2str(wlen));
        end
    case 'tp_sfixpt'
        % 118 121
        % 119 121
        tpinfo.isnative = 0.0;
        % 121 123
        wlen = hT.WordLength;
        flen = hT.FractionLength;
        % 124 126
        tpinfo.wordsize = wlen;
        tpinfo.issigned = 1.0;
        tpinfo.binarypoint = flen;
        % 128 130
        if gt(flen, 0.0)
            tpinfo.sltype = horzcat('sfix', num2str(wlen), '_E', num2str(flen));
        else
            if lt(flen, 0.0)
                tpinfo.sltype = horzcat('sfix', num2str(wlen), '_En', num2str(uminus(flen)));
            else
                tpinfo.sltype = horzcat('sfix', num2str(wlen));
            end
        end
    case 'tp_ufixpt'
        tpinfo.isnative = 0.0;
        % 140 142
        wlen = hT.WordLength;
        flen = hT.FractionLength;
        % 143 145
        tpinfo.wordsize = wlen;
        tpinfo.issigned = 0.0;
        tpinfo.binarypoint = flen;
        % 147 149
        if gt(flen, 0.0)
            tpinfo.sltype = horzcat('ufix', num2str(wlen), '_E', num2str(flen));
        else
            if lt(flen, 0.0)
                tpinfo.sltype = horzcat('ufix', num2str(wlen), '_En', num2str(uminus(flen)));
            else
                tpinfo.sltype = horzcat('ufix', num2str(wlen));
            end
        end
    case 'tp_complex'
        hRealT = hT.BaseType;
        tpinfo = pirgetdatatypeinfo(hRealT);
        tpinfo.iscomplex = 1.0;
    case 'tp_array'
        % 162 165
        % 163 165
        numdims = hT.numberofDimensions;
        if gt(numdims, 2.0)
            error('pirgetdatatypeinfo: Cannot support matrices with more than 2 dimensions');
        end
        % 168 170
        hBT = hT.BaseType;
        tpinfo = pirgetdatatypeinfo(hBT);
        % 171 173
        tpinfo.numdims = numdims;
        tpinfo.dims = hT.Dimensions;
        tpinfo.isscalar = 0.0;
        if isequal(prod(double(tpinfo.dims)), max(double(tpinfo.dims)))
            tpinfo.isvector = 1.0;
            tpinfo.ismatrix = 0.0;
        else
            tpinfo.isvector = 0.0;
            tpinfo.ismatrix = 1.0;
        end
        % 182 184
        d = tpinfo.dims;
        if eq(tpinfo.numdims, 1.0)
            tpinfo.vector = horzcat(d, 0.0);
        else
            tpinfo.vector = d;
        end
    case 'tp_record'
        % 190 194
        % 191 194
        % 192 194
        numMembers = hT.numberofMembers;
        % 194 196
        if lt(numMembers, 1.0)
            error('pirgetdatatypeinfo: invalid record type with no members');
        end
        % 198 203
        % 199 203
        % 200 203
        % 201 203
        hBT = hT.MemberTypes(1.0);
        tpinfo = pirgetdatatypeinfo(hBT);
        tpinfo.dims = numMembers;
        tpinfo.isscalar = 0.0;
        tpinfo.isvector = 1.0;
        tpinfo.ismatrix = 0.0;
        tpinfo.vector = horzcat(numMembers, 0.0);
    otherwise
        % 210 213
        % 211 213
        error('pirgetdatatypeinfo: unhandled data-type %s ', className);
        % 213 215
    end
end
