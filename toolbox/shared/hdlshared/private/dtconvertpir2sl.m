function [sldt, sldtprops] = dtconvertpir2sl(hT)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    className = hT.getClassName;
    % 16 18
    sldt.native = '';
    sldt.viadialog = '';
    % 19 21
    sldtprops.iscomplex = 0.0;
    sldtprops.isscalar = 1.0;
    sldtprops.isvector = 0.0;
    sldtprops.numberofDimensions = 1.0;
    sldtprops.dims = 1.0;
    sldtprops.dimensionstr = '[1]';
    % 26 42
    % 27 42
    % 28 42
    % 29 42
    % 30 42
    % 31 42
    % 32 42
    % 33 42
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    sldtprops.isnative = 1.0;
    % 42 45
    % 43 45
    switch className
    case 'tp_single'
        % 46 48
        sldt.native = 'single';
        sldt.viadialog = 'fixdt(''single'')';
    case 'tp_double'
        % 50 52
        sldt.native = 'double';
        sldt.viadialog = 'fixdt(''double'')';
    case 'tp_boolean'
        % 54 56
        sldt.native = 'boolean';
        sldt.viadialog = 'fixdt(''boolean'')';
    case 'tp_logic'
        % 58 60
        wlen = hT.WordLength;
        flen = 0.0;
        % 61 63
        if eq(wlen, 1.0)
            sldt.native = 'boolean';
            sldt.viadialog = 'fixdt(''boolean'')';
        else
            sldtprops.isnative = 0.0;
            fixDt = horzcat('ufix', num2str(wlen));
            sldt.native = fixDt;
            sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
        end
        % 72 74
    case 'tp_signed'
        % 73 75
        wlen = hT.WordLength;
        flen = 0.0;
        % 76 78
        switch wlen
        case 8.0
            sldt.native = 'int8';
            sldt.viadialog = 'fixdt(''int8'')';
        case 16.0
            sldt.native = 'int16';
            sldt.viadialog = 'fixdt(''int8'')';
        case 32.0
            sldt.native = 'int32';
            sldt.viadialog = 'fixdt(''int32'')';
        otherwise
            sldtprops.isnative = 0.0;
            fixDt = horzcat('sfix', num2str(wlen));
            sldt.native = fixDt;
            sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
        end
    case 'tp_unsigned'
        % 94 96
        wlen = hT.WordLength;
        flen = 0.0;
        % 97 99
        switch wlen
        case 8.0
            sldt.native = 'uint8';
            sldt.viadialog = 'fixdt(''uint8'')';
        case 16.0
            sldt.native = 'uint16';
            sldt.viadialog = 'fixdt(''uint16'')';
        case 32.0
            sldt.native = 'uint32';
            sldt.viadialog = 'fixdt(''uint32'')';
        otherwise
            sldtprops.isnative = 0.0;
            fixDt = horzcat('ufix', num2str(wlen));
            sldt.native = fixDt;
            sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
        end
    case 'tp_sfixpt'
        % 115 118
        % 116 118
        sldtprops.isnative = 0.0;
        % 118 120
        wlen = hT.WordLength;
        flen = hT.FractionLength;
        % 121 123
        if gt(flen, 0.0)
            fixDt = horzcat('sfix', num2str(wlen), '_E', num2str(flen));
            sldt.native = fixDt;
            sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
        else
            if lt(flen, 0.0)
                fixDt = horzcat('sfix', num2str(wlen), '_En', num2str(uminus(flen)));
                sldt.native = fixDt;
                sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
            else
                fixDt = horzcat('sfix', num2str(wlen));
                sldt.native = fixDt;
                sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
            end
        end
    case 'tp_ufixpt'
        sldtprops.isnative = 0.0;
        % 139 141
        wlen = hT.WordLength;
        flen = hT.FractionLength;
        % 142 144
        if gt(flen, 0.0)
            fixDt = horzcat('ufix', num2str(wlen), '_E', num2str(flen));
            sldt.native = fixDt;
            sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
        else
            if lt(flen, 0.0)
                fixDt = horzcat('ufix', num2str(wlen), '_En', num2str(uminus(flen)));
                sldt.native = fixDt;
                sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
            else
                fixDt = horzcat('ufix', num2str(wlen));
                sldt.native = fixDt;
                sldt.viadialog = horzcat('fixdt(''', fixDt, ''')');
            end
        end
    case 'tp_complex'
        hRT = hT.BaseType;
        [sldt, sldtprops] = dtconvertpir2sl(hRT);
        % 161 163
        sldtprops.iscomplex = 1.0;
    case 'tp_array'
        % 164 167
        % 165 167
        numdims = hT.numberofDimensions;
        % 167 169
        if gt(numdims, 2.0)
            error('Cannot support matrices with more than 2 dimensions');
        end
        % 171 173
        hBT = hT.BaseType;
        [sldt, sldtprops] = dtconvertpir2sl(hBT);
        % 174 176
        sldtprops.isscalar = 0.0;
        sldtprops.isvector = 1.0;
        sldtprops.numberofDimensions = numdims;
        % 178 180
        dims = hT.Dimensions;
        % 180 182
        sldtprops.dims = dims;
        sldtprops.dimensionstr = horzcat('[', num2str(dims), ']');
    case 'tp_record'
        % 184 194
        % 185 194
        % 186 194
        % 187 194
        % 188 194
        % 189 194
        % 190 194
        % 191 194
        % 192 194
        numMembers = hT.numberofMembers;
        % 194 196
        if lt(numMembers, 1.0)
            error('dtconvertpir2sl: invalid record type with no members');
        end
        % 198 201
        % 199 201
        hBT = hT.MemberTypes(1.0);
        [sldt, sldtprops] = dtconvertpir2sl(hBT);
        % 202 205
        % 203 205
        sldtprops.dims = horzcat(1.0, numMembers);
        sldtprops.dimensionstr = horzcat('[', num2str(sldtprops.dims), ']');
    otherwise
        % 207 210
        % 208 210
        error('dtconvertpir2sl: unhandled data-type %s ', className);
        % 210 212
    end
    % 212 214
end
