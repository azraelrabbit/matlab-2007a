function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlcode = hdlcodeinit;
    % 7 9
    bfp = hC.SimulinkHandle;
    % 9 11
    bfph = get_param(bfp, 'Handle');
    rnd = get_param(bfp, 'RndMeth');
    sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
    % 13 15
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    blockname = hdllegalnamersvd(get_param(bfp, 'Name'));
    % 17 19
    convtype = get_param(bfp, 'ConvertRealWorld');
    % 19 21
    isdouble = hdlsignalisdouble(horzcat(in, out));
    if any(eq(isdouble, true)) && any(eq(isdouble, false))
        warning(hdlcodererrormsgid('illegalconversion'), 'Illegal conversion to/from double and fixed-point--operation not possible in %s.', horzcat(get(bfph, 'Path'), '/', get(bfph, 'Name')));
        % 23 26
        % 24 26
    end % if
    % 26 28
    [insize, inbp, insigned] = hdlgetsizesfromtype(hdlsignalsltype(in));
    [outsize, outbp, outsigned] = hdlgetsizesfromtype(hdlsignalsltype(out));
    % 29 31
    if strcmpi(convtype, 'Real World Value (RWV)')
        hdlcode.arch_body_blocks = hdldatatypeassignment(in, out, rnd, sat);
    else
        if strcmpi(convtype, 'Stored Integer (SI)') && eq(insize, outsize) && eq(insigned, outsigned)
            [tmpvtype, tmpsltype] = hdlgettypesfromsizes(insize, 0.0, insigned);
            [tmpname, tmp] = hdlnewsignal(horzcat(blockname, '_tmp'), '', -1.0, 0.0, hdlsignalvector(in), tmpvtype, tmpsltype);
            % 36 38
            hdlcode.arch_signals = makehdlsignaldecl(tmp);
            hdlcode.arch_body_blocks = hdlsignalassignment(in, tmp);
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlsignalassignment(tmp, out));
        else
            if strcmpi(convtype, 'Stored Integer (SI)')
                if eq(outsize, 1.0)
                    [tmpvtype, tmpsltype] = hdlgettypesfromsizes(insize, outbp, outsigned);
                    [tmpname, tmp] = hdlnewsignal(horzcat(blockname, '_tmp'), '', -1.0, 0.0, hdlsignalvector(in), tmpvtype, tmpsltype);
                    % 45 47
                    hdlcode.arch_signals = makehdlsignaldecl(tmp);
                    hdlcode.arch_body_blocks = hdldatatypeassignment(in, tmp, 'floor', 0.0, '');
                    hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdldatatypeassignment(tmp, out, rnd, sat));
                else
                    % 50 52
                    [tmpvtype, tmpsltype] = hdlgettypesfromsizes(insize, outbp, insigned);
                    [tmpname, tmp] = hdlnewsignal(horzcat(blockname, '_tmp'), '', -1.0, 0.0, hdlsignalvector(in), tmpvtype, tmpsltype);
                    % 53 56
                    % 54 56
                    hdlcode.arch_signals = makehdlsignaldecl(tmp);
                    hdlcode.arch_body_blocks = hdlsignalassignment(in, tmp);
                    hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdldatatypeassignment(tmp, out, rnd, sat));
                    % 58 60
                end % if
            else
                error(hdlcodererrormsgid('unknownconversiontype'), 'Unknown conversion type in %s.', horzcat(get(bfph, 'Path'), '/', get(bfph, 'Name')));
                % 62 65
                % 63 65
            end % if
            % 65 67
        end % if
    end % if
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
