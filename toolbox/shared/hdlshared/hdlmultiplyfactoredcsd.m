function [hdlbody, hdlsignals] = hdlmultiplyfactoredcsd(in, coeff, coeffptr, out, rounding, saturation, pipelinedepth)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 6.0) || isempty(pipelinedepth)
        pipelinedepth = 0.0;
    end
    % 10 12
    if eq(pipelinedepth, 0.0)
        mustpipeline = false;
    else
        mustpipeline = true;
    end
    % 16 18
    hdlbody = '';
    hdlsignals = '';
    % 19 21
    inname = hdlsignalname(in);
    invtype = hdlsignalvtype(in);
    insltype = hdlsignalsltype(in);
    [insize, inbp, insigned] = hdlwordsize(insltype);
    % 24 26
    inbpdiff = minus(insize, inbp);
    % 26 28
    coeffvtype = hdlsignalvtype(coeffptr);
    coeffsltype = hdlsignalsltype(coeffptr);
    [coeffsize, coeffbp, coeffsigned] = hdlwordsize(coeffsltype);
    % 30 32
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    % 33 35
    if eq(insize, 0.0)
        error(hdlerrormsgid('realinput'), 'hdlmultiplyfactoredcsd called with a real input %s', inname);
    else
        if eq(insize, 1.0)
            error(hdlerrormsgid('booleaninput'), 'hdlmultiplyfactoredcsd called with a std_logic (boolean) input %s', inname);
        else
            if gt(coeffsize, 32.0)
                error(hdlerrormsgid('inputtoolarge'), 'hdlmultiplyfactoredcsd called with a coefficient more than 32-bits wide for input %s', inname);
            else
                % 43 45
                if eq(coeff, 0.0)
                    error(hdlerrormsgid('zeroinput'), 'hdlmultiplyfactoredcsd called with zero coefficient for input %s', inname);
                    % 46 48
                end
            end
        end
    end
    if eq(insigned, 0.0) && eq(coeffsigned, 0.0)
        resultsigned = 0.0;
    else
        resultsigned = 1.0;
    end
    if eq(coeff, 1.0)
        hdlbody = hdldatatypeassignment(in, out, rounding, saturation);
    else
        % 59 61
        ival = floor(plus(mtimes(coeff, mpower(2.0, coeffbp)), .5));
        if lt(ival, 0.0)
            ineg = 1.0;
        else
            ineg = 0.0;
        end
        % 66 68
        ivalfactors = factor(abs(ival));
        ivalfactors = ivalfactors(end:-1.0:1.0);
        % 69 71
        ivallog2 = ceil(log2(abs(ival)));
        finalsize = plus(insize, ivallog2);
        % 72 74
        if eq(length(ivalfactors), 1.0) || hdlispowerof2(ival) || eq(ival, minus(mpower(2.0, ivallog2), 1.0)) || eq(ival, plus(mpower(2.0, minus(ivallog2, 1.0)), 1.0))
            % 74 78
            % 75 78
            % 76 78
            [hdlbody, hdlsignals] = hdlmultiplycsd(in, coeff, coeffptr, out, rounding, saturation);
        else
            findtwos = find(eq(ivalfactors, 2.0));
            if isempty(findtwos)
                factorlength = length(ivalfactors);
                finalpowerof2 = 0.0;
            else
                factorlength = minus(findtwos(1.0), 1.0);
                finalpowerof2 = length(findtwos);
            end
            % 87 89
            lastsize = insize;
            lastbp = inbp;
            lastsignal = in;
            % 91 93
            for n=1.0:factorlength
                ppcoeffsize = ceil(log2(ivalfactors(n)));
                ppsize = min(plus(lastsize, ppcoeffsize), finalsize);
                ppbp = plus(ppcoeffsize, lastbp);
                [pphdltype, ppsltype] = hdlgettypesfromsizes(ppsize, ppbp, resultsigned);
                [uname, ppidx] = hdlnewsignal('factoredcsd_temp', 'block', -1.0, 0.0, 0.0, pphdltype, ppsltype);
                hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(ppidx));
                % 99 101
                [ppcoeffhdltype, ppcoeffsltype] = hdlgettypesfromsizes(ppcoeffsize, ppcoeffsize, 0.0);
                [uname, coeffptr] = hdlnewsignal('factoredcsd_coefftemp', 'block', -1.0, 0.0, 0.0, ppcoeffhdltype, ppcoeffsltype);
                % 102 105
                % 103 105
                [tempbody, tempsignals] = hdlmultiplycsd(lastsignal, mrdivide(ivalfactors(n), mpower(2.0, ppcoeffsize)), coeffptr, ppidx, 'floor', 0.0);
                % 105 108
                % 106 108
                if strcmpi(tempbody(minus(end, 4.0):end), '\n\n')
                    tempbody = tempbody(1.0:minus(end, 2.0));
                end
                hdlbody = horzcat(hdlbody, tempbody);
                hdlsignals = horzcat(hdlsignals, tempsignals);
                % 112 114
                lastsize = ppsize;
                lastbp = ppbp;
                % 115 117
                if mustpipeline
                    [uname, regppidx] = hdlnewsignal('factoredcsdreg_temp', 'block', -1.0, 0.0, 0.0, pphdltype, ppsltype);
                    hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(regppidx));
                    [tempbody, tempsignals] = hdlunitdelay(ppidx, regppidx, 'factoredcsdreg', []);
                    hdlbody = horzcat(hdlbody, tempbody);
                    hdlsignals = horzcat(hdlsignals, tempsignals);
                    lastsignal = regppidx;
                else
                    lastsignal = ppidx;
                end
            end % for
            % 127 129
            tempsignals = '';
            % 129 131
            ppsize = plus(plus(lastsize, finalpowerof2), 1.0);
            ppbp = minus(minus(plus(coeffbp, inbp), lastbp), finalpowerof2);
            [pphdltype, ppsltype] = hdlgettypesfromsizes(finalsize, plus(inbp, coeffbp), resultsigned);
            [uname, ppidx] = hdlnewsignal('factoredcsd_temp', 'block', -1.0, 0.0, 0.0, pphdltype, ppsltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(ppidx));
            % 135 137
            [tempbody, tempsignals] = hdlmultiplypowerof2(lastsignal, mpower(2.0, uminus(ppbp)), ppidx, 'floor', 0.0);
            hdlbody = horzcat(hdlbody, tempbody);
            hdlsignals = horzcat(hdlsignals, tempsignals);
            lastsignal = ppidx;
            % 140 142
            if mustpipeline
                [uname, finalstage] = hdlnewsignal('factoredcsd_temp', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(finalstage));
            else
                finalstage = out;
            end
            % 147 149
            if ineg
                [tempbody, tempsignals] = hdlunaryminus(lastsignal, finalstage, rounding, saturation);
            else
                tempbody = hdldatatypeassignment(lastsignal, finalstage, rounding, saturation);
            end
            hdlbody = horzcat(hdlbody, tempbody);
            hdlsignals = horzcat(hdlsignals, tempsignals);
            % 155 157
            if mustpipeline
                [tempbody, tempsignals] = hdlunitdelay(finalstage, out, 'factoredcsdreg', []);
                hdlbody = horzcat(hdlbody, tempbody);
                hdlsignals = horzcat(hdlsignals, tempsignals);
            end
            % 161 163
        end
    end
end
