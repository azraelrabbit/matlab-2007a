function [hdlbody, hdlsignals] = hdlmultiplycsd(in, coeff, coeffptr, out, rounding, saturation)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hdlbody = '';
    hdlsignals = '';
    % 11 13
    inname = hdlsignalname(in);
    inhandle = hdlsignalhandle(in);
    invector = hdlsignalvector(in);
    invtype = hdlsignalvtype(in);
    insltype = hdlsignalsltype(in);
    [insize, inbp, insigned] = hdlwordsize(insltype);
    % 18 20
    coeffvtype = hdlsignalvtype(coeffptr);
    coeffsltype = hdlsignalsltype(coeffptr);
    [coeffsize, coeffbp, coeffsigned] = hdlwordsize(coeffsltype);
    % 22 24
    outname = hdlsignalname(out);
    outhandle = hdlsignalhandle(out);
    outvector = hdlsignalvector(out);
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 29 31
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    % 31 33
    if eq(insize, 0.0)
        error('hdlmultiplycsd called with a real input %s', name1);
    else
        if eq(insize, 1.0)
            error('hdlmultiplycsd called with a std_logic (boolean) input %s', name1);
        else
            if eq(coeff, 0.0)
                error('hdlmultiplycsd called with zero coefficient for input %s', name1);
            end
        end
    end
    hdlbody = '';
    hdlsignals = '';
    if eq(insigned, 0.0) && eq(coeffsigned, 0.0)
        resultsigned = 0.0;
    else
        resultsigned = 1.0;
    end
    if eq(coeff, 1.0)
        hdlbody = hdldatatypeassignment(in, out, rounding, saturation);
    else
        [newname, newsize] = hdlsignaltypeconvert(inname, insize, insigned, invtype, resultsigned);
        ival = floor(plus(mtimes(coeff, mpower(2.0, coeffbp)), .5));
        if lt(ival, 0.0)
            ineg = 1.0;
        else
            ineg = 0.0;
        end
        ibits = horzcat(0.0, ne(dec2bin(abs(ival), coeffsize), '0'), 0.0, 0.0);
        % 61 64
        % 62 64
        csdbits = [];
        startbit = 0.0;
        run = 0.0;
        for n=2.0:plus(coeffsize, 2.0)
            if eq(ibits(minus(n, 1.0)), 0.0) && eq(ibits(n), 1.0) && eq(ibits(plus(n, 1.0)), 0.0)
                csdbits = horzcat(csdbits, minus(plus(coeffsize, 1.0), n), minus(plus(coeffsize, 1.0), n));
            else
                if eq(ibits(minus(n, 1.0)), 0.0) && eq(ibits(n), 1.0) && eq(run, 0.0)
                    run = 1.0;
                    startbit = minus(plus(coeffsize, 2.0), n);
                else
                    if eq(ibits(minus(n, 1.0)), 1.0) && eq(ibits(n), 0.0) && eq(run, 1.0)
                        run = 0.0;
                        csdbits = horzcat(csdbits, startbit, minus(plus(coeffsize, 2.0), n));
                    end
                end
            end
        end % for
        maxshift = max(csdbits(1.0:2.0:end));
        prodsize = plus(plus(maxshift, newsize), 1.0);
        prodbp = plus(inbp, coeffbp);
        [tempvtype, tempsltype] = hdlgettypesfromsizes(prodsize, prodbp, resultsigned);
        [tempprod, tempprod_ptr] = hdlnewsignal('mulcsd_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempprod_ptr));
        if ineg
            hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempprod, ' ', assign_op, ' - (\n');
        else
            hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempprod, ' ', assign_op, ' \n');
        end
        % 92 94
        for n=1.0:2.0:length(csdbits)
            if eq(csdbits(n), csdbits(plus(n, 1.0)))
                if hdlgetparameter('isvhdl')
                    hdlbody = horzcat(hdlbody, '        ', 'resize(', newname);
                    if ne(csdbits(n), 0.0)
                        hdlbody = horzcat(hdlbody, ' & ', vhdlnzeros(csdbits(n)));
                    end
                    hdlbody = horzcat(hdlbody, ', ', num2str(prodsize), ') +\n');
                else
                    if hdlgetparameter('isverilog')
                        if ne(csdbits(n), 0.0)
                            hdlbody = horzcat(hdlbody, '        ', '$signed({', newname, ', ', hdlconstantvalue(0.0, csdbits(n), 0.0, 0.0), '})');
                        else
                            hdlbody = horzcat(hdlbody, '        ', newname);
                        end
                        hdlbody = horzcat(hdlbody, ' +\n');
                    end
                end
            else
                if hdlgetparameter('isvhdl')
                    hdlbody = horzcat(hdlbody, '        ', 'resize(', newname, ' & ', vhdlnzeros(csdbits(n)), ', ', num2str(prodsize), ') -\n');
                    hdlbody = horzcat(hdlbody, '        ', 'resize(', newname);
                    if ne(csdbits(plus(n, 1.0)), 0.0)
                        hdlbody = horzcat(hdlbody, ' & ', vhdlnzeros(csdbits(plus(n, 1.0))));
                    end
                    hdlbody = horzcat(hdlbody, ', ', num2str(prodsize), ') +\n');
                else
                    if hdlgetparameter('isverilog')
                        hdlbody = horzcat(hdlbody, '        ', '$signed({', newname, ', ', hdlconstantvalue(0.0, csdbits(n), 0.0, 0.0), '})', ' -\n');
                        % 122 124
                        if ne(csdbits(plus(n, 1.0)), 0.0)
                            hdlbody = horzcat(hdlbody, '        ', '$signed({', newname, ', ', hdlconstantvalue(0.0, csdbits(plus(n, 1.0)), 0.0, 0.0), '})');
                        else
                            % 126 128
                            hdlbody = horzcat(hdlbody, '        ', newname);
                        end
                        hdlbody = horzcat(hdlbody, ' +\n');
                    end
                end
            end
        end % for
        hdlbody = hdlbody(1.0:minus(end, 4.0));
        if ineg
            hdlbody = horzcat(hdlbody, ');\n');
        else
            hdlbody = horzcat(hdlbody, ';\n');
        end
        % 140 142
        if eq(saturation, 0.0) || strcmpi(rounding, 'floor')
            final_result = hdltypeconvert(tempprod, prodsize, prodbp, resultsigned, tempvtype, outsize, outbp, outsigned, outvtype, rounding, saturation);
        else
            % 144 146
            % 145 147
            bpdiff = minus(prodbp, outbp);
            if gt(bpdiff, 0.0)
                roundsize = plus(minus(prodsize, bpdiff), 1.0);
            else
                roundsize = plus(outsize, 1.0);
            end
            % 152 154
            [temp2vtype, temp2sltype] = hdlgettypesfromsizes(roundsize, outbp, resultsigned);
            [temp2prod, temp2prod_ptr] = hdlnewsignal('mulcsd_temp', 'block', -1.0, 0.0, 0.0, temp2vtype, temp2sltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(temp2prod_ptr));
            % 156 158
            roundedresult = hdltypeconvert(tempprod, prodsize, prodbp, resultsigned, tempvtype, roundsize, outbp, outsigned, temp2vtype, rounding, 0.0);
            % 158 161
            % 159 161
            convertedresult = hdltypeconvert(temp2prod, roundsize, outbp, resultsigned, temp2vtype, outsize, outbp, outsigned, outvtype, 'floor', 0.0);
            % 161 165
            % 162 165
            % 163 165
            hdlbody = horzcat(hdlbody, '  ', assign_prefix, temp2prod, ' ', assign_op, ' ', roundedresult, ';\n');
            % 165 167
            final_result = hdlsaturate(temp2prod, roundsize, outbp, resultsigned, temp2vtype, outsize, outbp, outsigned, outvtype, rounding, saturation, convertedresult);
            % 167 170
            % 168 170
        end
        % 170 172
        if not(strcmpi(outname, final_result))
            hdlbody = horzcat(hdlbody, '  ', assign_prefix, outname, ' ', assign_op, ' ', final_result, ';\n');
        end
        % 174 177
        % 175 177
        hdlbody = horzcat(hdlbody, '\n');
    end
end
