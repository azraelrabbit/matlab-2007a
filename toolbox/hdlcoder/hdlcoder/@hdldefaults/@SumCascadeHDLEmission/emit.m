function hdlcode = emit(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    decomposition = 1.0;
    % 9 10
    hdlcode = hdlcodeinit;
    bfp = hC.SimulinkHandle;
    % 12 15
    % 13 15
    % 14 15
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 17 18
    userData = this.getHDLUserData(hC);
    % 19 20
    Up = userData.decompose_vector(1.0);
    Down = 1.0;
    Phase = 0.0;
    % 23 26
    % 24 26
    % 25 26
    hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
    % 27 29
    % 28 29
    baseratecontext = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
    original_clken = hdlgetcurrentclockenable;
    if gt(Up, 2.0)
        this.beginClockBundleContext(hC.Owner, hC, hS, Up, Down, Phase);
    end % if
    % 34 36
    % 35 36
    In1_vld = original_clken;
    % 37 39
    % 38 39
    if eq(length(in), 1.0)
        invectsize = max(hdlsignalvector(in));
        if all(eq(invectsize, 0.0))
            invect = in;
        else
            invect = hdlexpandvectorsignal(in);
        end % if
    else
        invect = in;
    end % if
    % 49 52
    % 50 52
    % 51 52
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        rnd = get_param(bfp, 'roundingMode');
        sat = strcmp(get_param(bfp, 'overflowMode'), 'on');
    else
        sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
        rnd = get_param(bfp, 'RndMeth');
    end % if
    % 59 60
    body = '';
    signals = '';
    consts = '';
    % 63 64
    outsltype = hdlsignalsltype(out);
    outvtype = hdlsignalvtype(out);
    outcmplx = hdlsignalcomplex(out);
    outrate = hdlsignalrate(out);
    % 68 69
    config.invectsize = invectsize;
    config.cmplx = outcmplx;
    config.sltype = outsltype;
    config.vtype = outvtype;
    config.decomposition = 1.0;
    config.rounding = rnd;
    config.saturation = sat;
    modestring = 'Sum';
    name = get_param(bfp, 'Name');
    % 78 79
    [body, signals, consts] = implement_cascade(invect, In1_vld, out, modestring, name, config);
    % 80 81
    if gt(Up, 1.0)
        this.endClockBundleContext(baseratecontext);
    end % if
    % 84 85
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_signals = signals;
    hdlcode.arch_constants = consts;
end % function
function [body, signals, constants] = implement_cascade(invect, In1_vld, out, modestring, name, config)
    % 90 94
    % 91 94
    % 92 94
    % 93 94
    body = '';
    signals = '';
    constants = '';
    % 97 99
    % 98 99
    decompose_vector = hdlcascadedecompose(config.invectsize, config.decomposition);
    % 100 102
    % 101 102
    tmpout = handle(0.0);
    for cloop=2.0:length(decompose_vector)
        [idxname, tmpout(cloop)] = hdlnewsignal(horzcat(modestring, 'out_', num2str(decompose_vector(cloop))), 'block', -1.0, 0.0, 0.0, config.vtype, config.sltype);
        signals = horzcat(signals, makehdlsignaldecl(tmpout(cloop)));
    end % for
    tmpout(1.0) = out;
    % 108 110
    % 109 110
    resized_invect = handle(0.0);
    for cloop=1.0:length(invect)
        insltype = hdlsignalsltype(invect(cloop));
        outvtype = hdlsignalvtype(out);
        outsltype = hdlsignalsltype(out);
        [insize, inbp, insigned] = hdlwordsize(insltype);
        [outsize, outbp, outsigned] = hdlwordsize(outsltype);
        if eq(insize, outsize) && eq(inbp, outbp)
            resized_invect(cloop) = invect(cloop);
        else
            [tempsignal, resized_invect(cloop)] = hdlnewsignal(horzcat('resized_In1_', num2str(cloop)), 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
            signals = horzcat(signals, makehdlsignaldecl(resized_invect(cloop)));
            body = horzcat(body, hdldatatypeassignment(invect(cloop), resized_invect(cloop), 'floor', 'flase'));
        end % if
        % 124 125
    end % for
    % 126 127
    first_element = 1.0;
    for cloop=1.0:length(decompose_vector)
        invect_1 = [];
        if eq(cloop, length(decompose_vector))
            last_element = minus(plus(decompose_vector(cloop), first_element), 1.0);
            for i=first_element:last_element
                invect_1 = horzcat(invect_1, resized_invect(minus(plus(cloop, i), 1.0)));
            end % for
        else
            last_element = minus(plus(decompose_vector(cloop), first_element), 2.0);
            for i=first_element:last_element
                invect_1 = horzcat(invect_1, resized_invect(minus(plus(cloop, i), 1.0)));
            end % for
            invect_1 = horzcat(invect_1, tmpout(plus(cloop, 1.0)));
        end % if
        if eq(config.decomposition, 0.0)
            sufix = '';
        else
            sufix = horzcat('_', num2str(decompose_vector(cloop)));
        end % if
        body = horzcat(body, hdlgetparameter('comment_char'), '********************* ', sufix, ' Input ', modestring, ' implementation ********************', '\n');
        if eq(config.decomposition, 0.0)
            Hierarchy = 'top';
            [tmpbody, tmpsignals, tmpconsts] = local_productofelements_1multi(invect_1, In1_vld, tmpout(cloop), modestring, name, Hierarchy, config, sufix);
        else
            if eq(cloop, 1.0)
                Hierarchy = 'top';
            else
                Hierarchy = 'blk';
            end % if
            [tmpbody, tmpsignals, tmpconsts] = local_productofelements_1multi(invect_1, In1_vld, tmpout(cloop), modestring, name, Hierarchy, config, sufix);
        end % if
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        constants = horzcat(constants, tmpconsts);
        first_element = minus(plus(first_element, decompose_vector(cloop)), 2.0);
    end % for
end % function
function [body, signals, constants] = local_productofelements_1multi(invect, In1_vld, out, modestring, name, Hierarchy, config, sufix)
    % 166 170
    % 167 170
    % 168 170
    % 169 170
    invectsize = config.invectsize;
    cmplx = config.cmplx;
    sltype = config.sltype;
    vtype = config.vtype;
    rounding = config.rounding;
    saturation = config.saturation;
    % 176 177
    bdt = hdlgetparameter('base_data_type');
    % 178 179
    comment = horzcat('\n', '  ', hdlgetparameter('comment_char'), ' ', modestring, '_block', sufix, ': ');
    % 180 181
    body = '';
    signals = '';
    constants = '';
    % 184 189
    % 185 189
    % 186 189
    % 187 189
    % 188 189
    max_cnt = minus(length(invect), 2.0);
    cnt_sz = ceil(log2(length(invect)));
    % 191 193
    % 192 193
    [cntvtype, cntsltype] = hdlgettypesfromsizes(cnt_sz, 0.0, 0.0);
    % 194 199
    % 195 199
    % 196 199
    % 197 199
    % 198 199
    if eq(length(invect), 2.0)
        signals = horzcat(signals, comment, 'Signal/Constant Declaration ', '\n');
        [idxname, nxt_value] = hdlnewsignal(horzcat('next', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(nxt_value));
        [idxname, tmp_out] = hdlnewsignal(horzcat('tmp_out', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(tmp_out));
        % 205 206
        body = horzcat(body, comment, 'Determine the ', modestring, ' between the two inputs', '\n');
        oldcbs = hdlgetparameter('cast_before_sum');
        [tmpbody, tmpsignals] = hdladd(invect(1.0), invect(2.0), nxt_value, rounding, saturation);
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        if eq(Hierarchy, 'top')
            body = horzcat(body, hdlunitdelay(nxt_value, tmp_out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
            body = horzcat(body, hdldatatypeassignment(tmp_out, out, rounding, saturation));
        else
            body = horzcat(body, hdlunitdelay(nxt_value, out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
        end % if
    else
        % 218 221
        % 219 221
        % 220 221
        signals = horzcat(signals, comment, 'Constant Declaration ', '\n');
        [idxname, std_0] = hdlnewsignal(horzcat('std_0', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        constants = horzcat(constants, makehdlconstantdecl(std_0, hdlconstantvalue(0.0, 1.0, 0.0, 0.0)));
        [idxname, std_1] = hdlnewsignal(horzcat('std_1', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        constants = horzcat(constants, makehdlconstantdecl(std_1, hdlconstantvalue(1.0, 1.0, 0.0, 0.0)));
        % 226 227
        [incsz, incbp, incsi] = hdlgetsizesfromtype(cntsltype);
        [idxname, end_cnt] = hdlnewsignal(horzcat('end_cnt', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
        constants = horzcat(constants, makehdlconstantdecl(end_cnt, hdlconstantvalue(max_cnt, incsz, incbp, incsi)));
        % 230 234
        % 231 234
        % 232 234
        % 233 234
        signals = horzcat(signals, comment, 'Counter Signal Declaration', '\n');
        [idxname, cnt_enb] = hdlnewsignal(horzcat('cnt_enb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(cnt_enb));
        [idxname, cntenb_tmp] = hdlnewsignal(horzcat('cntenb_tmp', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(cntenb_tmp));
        [idxname, not_cnt_enb] = hdlnewsignal(horzcat('not_cnt_enb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(not_cnt_enb));
        [idxname, cnt] = hdlnewsignal(horzcat('cnt', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
        signals = horzcat(signals, makehdlsignaldecl(cnt));
        [idxname, cnt_dec2] = hdlnewsignal(horzcat('cnt_dec2', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
        signals = horzcat(signals, makehdlsignaldecl(cnt_dec2));
        % 245 247
        % 246 247
        signals = horzcat(signals, comment, ' ', modestring, ' related signal Declaration', '\n');
        [idxname, pre_value] = hdlnewsignal(horzcat('pre_', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(pre_value));
        [idxname, cur_value] = hdlnewsignal(horzcat('cur_value', sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(cur_value));
        [idxname, nxt_value] = hdlnewsignal(horzcat('next', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(nxt_value));
        % 254 256
        % 255 256
        if eq(Hierarchy, 'top')
            signals = horzcat(signals, comment, 'Status (rdy) related Signal Declaration', '\n');
            [idxname, rdy_cond] = hdlnewsignal(horzcat('rdy_cond', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(rdy_cond));
            [idxname, nxt_rdy] = hdlnewsignal(horzcat('nxt_rdy', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(nxt_rdy));
            [idxname, rdy_tmp] = hdlnewsignal(horzcat('rdy_tmp', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(rdy_tmp));
            [inxname, rdy_reg] = hdlnewsignal(horzcat('rdy_reg', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(rdy_reg));
            [inxname, rdy] = hdlnewsignal(horzcat('rdy', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(rdy));
            [idxname, tmp_out] = hdlnewsignal(horzcat('tmp_out', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            signals = horzcat(signals, makehdlsignaldecl(tmp_out));
        end % if
        % 271 272
        [idxname, In_vld] = hdlnewsignal(horzcat('In_vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(In_vld));
        body = horzcat(body, hdlsignalassignment(In1_vld, In_vld));
        % 275 276
        [idxname, outvld_tmp] = hdlnewsignal(horzcat('outvld_tmp', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(outvld_tmp));
        if eq(Hierarchy, 'top')
            [idxname, out_vld] = hdlnewsignal(horzcat('out_vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(out_vld));
            % 281 282
        end % if
        % 283 285
        % 284 285
        signals = horzcat(signals, comment, 'Misc Signal Declaration', '\n');
        [idxname, unsigned_1] = hdlnewsignal(horzcat('unsigned_1', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
        constants = horzcat(constants, makehdlconstantdecl(unsigned_1, hdlconstantvalue(1.0, incsz, incbp, incsi)));
        [idxname, invld_and_not_cntenb] = hdlnewsignal(horzcat('invld_and_not_cntenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(invld_and_not_cntenb));
        [idxname, not_in1vld] = hdlnewsignal(horzcat('not_in1vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(not_in1vld));
        [idxname, invld_or_cntenb] = hdlnewsignal(horzcat('invld_or_cntenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(invld_or_cntenb));
        % 294 295
        [idxname, cnt_clkenb] = hdlnewsignal(horzcat('cnt_clkenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(cnt_clkenb));
        % 297 304
        % 298 304
        % 299 304
        % 300 304
        % 301 304
        % 302 304
        % 303 304
        primary_clken = hdlgetcurrentclockenable;
        body = horzcat(body, hdlbitop(cnt_enb, not_cnt_enb, 'NOT'));
        body = horzcat(body, hdlbitop(horzcat(In1_vld, not_cnt_enb), invld_and_not_cntenb, 'AND'));
        % 307 309
        % 308 309
        body = horzcat(body, comment, 'Input vector expansion (Demux)', '\n');
        body = horzcat(body, hdlmux(horzcat(invect(1.0:minus(end, 2.0)), invect(end)), cur_value, cnt, {'=='}, [], 'when-else', [], 0.0:minus(max_cnt, 1.0)));
        % 311 313
        % 312 313
        body = horzcat(body, comment, 'Choosing between new input data or saved value ', '\n');
        body = horzcat(body, hdlmux(horzcat(invect(minus(end, 1.0)), out), pre_value, invld_and_not_cntenb, {'='}, 1.0, 'when-else'));
        % 315 317
        % 316 317
        body = horzcat(body, comment, 'Counter', '\n');
        % 318 319
        body = horzcat(body, hdlbitop(horzcat(In1_vld, cnt_enb), invld_or_cntenb, 'OR'));
        body = horzcat(body, hdlbitop(horzcat(primary_clken, invld_or_cntenb), cnt_clkenb, 'AND'));
        % 321 323
        % 322 323
        hdladdclockenablesignal(cnt_clkenb);
        hdlsetcurrentclockenable(cnt_clkenb);
        [tmpbody, tmpsignalidx] = hdlcounter(cnt, plus(max_cnt, 1.0), horzcat(hdluniqueprocessname, '_counter', sufix), 1.0, 0.0, -1.0);
        body = horzcat(body, tmpbody);
        for n=1.0:length(tmpsignalidx)
            signals = horzcat(signals, makehdlsignaldecl(tmpsignalidx(n)));
        end % for
        % 330 331
        body = horzcat(body, comment, 'Counter enable', '\n');
        body = horzcat(body, hdlrelop(cnt, end_cnt, cntenb_tmp, '<'));
        body = horzcat(body, hdlunitdelay(cntenb_tmp, cnt_enb, horzcat(hdluniqueprocessname, '_counter_enb', sufix), 0.0));
        % 334 336
        % 335 336
        body = horzcat(body, comment, 'Determine the ', modestring, ' between the current and previous value', '\n');
        oldcbs = hdlgetparameter('cast_before_sum');
        hdlsetparameter('cast_before_sum', 0.0);
        [tmpbody, tmpsignals] = hdladd(cur_value, pre_value, nxt_value, rounding, saturation);
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        hdlsetparameter('cast_before_sum', oldcbs);
        if eq(Hierarchy, 'top')
            body = horzcat(body, hdlunitdelay(nxt_value, tmp_out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
            body = horzcat(body, hdldatatypeassignment(tmp_out, out, rounding, saturation));
        else
            body = horzcat(body, hdlunitdelay(nxt_value, out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
        end % if
        % 349 350
        hdlsetcurrentclockenable(primary_clken);
        % 351 353
        % 352 353
        oldcbs = hdlgetparameter('cast_before_sum');
        hdlsetparameter('cast_before_sum', 0.0);
        [tmpbody, tmpsignals] = hdlsub(end_cnt, unsigned_1, cnt_dec2, 'Floor', 0.0);
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        hdlsetparameter('cast_before_sum', oldcbs);
        body = horzcat(body, hdlrelop(cnt, end_cnt, outvld_tmp, '='));
        % 360 361
        if eq(Hierarchy, 'top')
            body = horzcat(body, comment, 'Generate the output valid signal', '\n');
            body = horzcat(body, hdlunitdelay(outvld_tmp, out_vld, horzcat(hdluniqueprocessname, '_out_vld_proc', sufix), 0.0));
            % 364 366
            % 365 366
            body = horzcat(body, comment, 'Generate the ready (Status) signal', '\n');
            body = horzcat(body, hdlrelop(cnt, cnt_dec2, rdy_cond, '>='));
            body = horzcat(body, hdlmux(horzcat(std_1, rdy_reg), rdy_tmp, rdy_cond, {'='}, 1.0, 'when-else'));
            body = horzcat(body, hdlmux(horzcat(std_0, rdy_tmp), nxt_rdy, In1_vld, {'='}, 1.0, 'when-else'));
            body = horzcat(body, hdlunitdelay(nxt_rdy, rdy_reg, horzcat(hdluniqueprocessname, '_rdy_proc', sufix), 1.0));
            body = horzcat(body, hdlbitop(In1_vld, not_in1vld, 'NOT'));
            body = horzcat(body, hdlbitop(horzcat(rdy_reg, not_in1vld), rdy, 'AND'));
        end % if
    end % if
end % function
