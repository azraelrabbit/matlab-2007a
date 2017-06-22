function newvhdltype = vhdlvectorblockdatatype(complexity, isvector, vhdltype, sltype)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(isvector(2.0), 0.0) || eq(isvector(1.0), 1.0) || eq(isvector(2.0), 1.0)
        veclen = max(isvector);
        switch vhdltype
        case {'bit'}
            % 10 12
            newvhdltype = sprintf('bit_vector(0 TO %d)', minus(veclen, 1.0));
        case {'std_logic'}
            % 13 15
            newvhdltype = sprintf('std_logic_vector(0 TO %d)', minus(veclen, 1.0));
        case {'std_ulogic'}
            % 16 18
            newvhdltype = sprintf('std_ulogic_vector(0 TO %d)', minus(veclen, 1.0));
        case {'real'}
            prototypedef = sprintf('  TYPE %-32s IS ARRAY (NATURAL RANGE <>) OF %s;\n', horzcat(hdlgetparameter('vector_prefix'), sltype), vhdltype);
            % 20 22
            newvhdltype = sprintf('%s%s(0 TO %d)', hdlgetparameter('vector_prefix'), sltype, minus(veclen, 1.0));
            vhdlpackageaddtypedef(prototypedef);
        otherwise
            [st, fi, token] = regexp(vhdltype, '\((\d*) DOWNTO');
            sigwidth = num2str(plus(str2double(vhdltype(token{1.0}(1.0):token{1.0}(2.0))), 1.0));
            if strcmp(vhdltype(1.0:4.0), 'sign')
                prototypedef = sprintf('  TYPE %-32s IS ARRAY (NATURAL RANGE <>) OF %s;\n', horzcat(hdlgetparameter('vector_prefix'), 'signed', sigwidth), vhdltype);
                % 28 30
                newvhdltype = sprintf('%s%s%s(0 TO %d)', hdlgetparameter('vector_prefix'), 'signed', sigwidth, minus(veclen, 1.0));
            else
                prototypedef = sprintf('  TYPE %-32s IS ARRAY (NATURAL RANGE <>) OF %s;\n', horzcat(hdlgetparameter('vector_prefix'), 'unsigned', sigwidth), vhdltype);
                % 32 34
                newvhdltype = sprintf('%s%s%s(0 TO %d)', hdlgetparameter('vector_prefix'), 'unsigned', sigwidth, minus(veclen, 1.0));
            end % if
            vhdlpackageaddtypedef(prototypedef);
        end % switch
    else
        % 38 40
        error('Matrix data types are not supported at this time!');
    end % if
