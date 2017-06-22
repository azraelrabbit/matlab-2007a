function hdlcode = emit(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    decomposition = 1.0;
    % 8 10
    hdlcode = hdlcodeinit;
    bfp = hC.SimulinkHandle;
    % 11 13
    inputsigns = get_param(bfp, 'Inputs');
    inputsigns = strrep(inputsigns, '|', '');
    % 14 17
    % 15 17
    if not(isempty(strfind(inputsigns, '/')))
        error(hdlcodererrormsgid('unsupported'), 'Product block with these inputs (%s) is not supported.', inputsigns);
    else
        % 19 21
        if not(strcmp(inputsigns(1.0), '*'))
            % 21 23
            nval = str2double(inputsigns);
            inputsigns = repmat('*', 1.0, nval);
        end
    end
    % 26 28
    if not(strcmpi(get_param(bfp, 'Multiplication'), 'element-wise(.*)'))
        error(hdlcodererrormsgid('unsupportedmatrix'), 'Product block only supported in Element-wise(.*) mode.');
        % 29 31
    end
    % 31 33
    if gt(length(inputsigns), 1.0)
        error(hdlcodererrormsgid('TooManyInputs'), 'Product block with cascade implementation requires a single vector as input.');
        % 34 36
    end
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 42 44
    userData = this.getHDLUserData(hC);
    % 44 46
    Up = userData.decompose_vector(1.0);
    Down = 1.0;
    Phase = 0.0;
    % 48 52
    % 49 52
    % 50 52
    hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
    % 52 55
    % 53 55
    baseratecontext = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
    original_clken = hdlgetcurrentclockenable;
    if gt(Up, 2.0)
        this.beginClockBundleContext(hC.Owner, hC, hS, Up, Down, Phase);
    end
    % 59 62
    % 60 62
    In1_vld = original_clken;
    % 62 66
    % 63 66
    % 64 66
    if eq(length(in), 1.0)
        invectsize = max(hdlsignalvector(in));
        if all(eq(invectsize, 0.0))
            invect = in;
        else
            invect = hdlexpandvectorsignal(in);
        end
    else
        invect = in;
    end
    % 75 77
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        rnd = get_param(bfp, 'roundingMode');
        sat = strcmp(get_param(bfp, 'overflowMode'), 'on');
    else
        sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
        rnd = get_param(bfp, 'RndMeth');
    end
    % 83 85
    body = '';
    signals = '';
    consts = '';
    % 87 89
    outsltype = hdlsignalsltype(out);
    outvtype = hdlsignalvtype(out);
    outcmplx = hdlsignalcomplex(out);
    outrate = hdlsignalrate(out);
    % 92 94
    config.invectsize = invectsize;
    config.cmplx = outcmplx;
    config.sltype = outsltype;
    config.vtype = outvtype;
    config.decomposition = decomposition;
    config.rounding = rnd;
    config.saturation = sat;
    modestring = 'product';
    name = get_param(bfp, 'Name');
    % 102 104
    [body, signals, consts] = implement_cascade(invect, In1_vld, out, modestring, name, config);
    % 104 106
    if gt(Up, 1.0)
        this.endClockBundleContext(baseratecontext);
    end
    % 108 110
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_signals = signals;
    hdlcode.arch_constants = consts;
end
function [body, signals, constants] = implement_cascade(invect, In1_vld, out, modestring, name, config)
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    body = '';
    signals = '';
    constants = '';
    % 121 124
    % 122 124
    decompose_vector = hdlcascadedecompose(config.invectsize, config.decomposition);
    % 124 127
    % 125 127
    tmpout = handle(0.0);
    for cloop=2.0:length(decompose_vector)
        [idxname, tmpout(cloop)] = hdlnewsignal(horzcat(modestring, 'out_', num2str(decompose_vector(cloop))), 'block', -1.0, 0.0, 0.0, config.vtype, config.sltype);
        signals = horzcat(signals, makehdlsignaldecl(tmpout(cloop)));
    end % for
    tmpout(1.0) = out;
    % 132 135
    % 133 135
    resized_invect = handle(0.0);
    for cloop=1.0:length(invect)
        outvtype = hdlsignalvtype(out);
        outsltype = hdlsignalsltype(out);
        [tempsignal, resized_invect(cloop)] = hdlnewsignal(horzcat('resized_In1_', num2str(cloop)), 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
        signals = horzcat(signals, makehdlsignaldecl(resized_invect(cloop)));
        body = horzcat(body, hdldatatypeassignment(invect(cloop), resized_invect(cloop), 'floor', 'flase'));
    end % for
    % 142 144
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
        end
        if eq(config.decomposition, 0.0)
            sufix = '';
        else
            sufix = horzcat('_', num2str(decompose_vector(cloop)));
        end
        body = horzcat(body, hdlgetparameter('comment_char'), '********************* ', sufix, ' Input ', modestring, ' implementation ********************', '\n');
        if eq(config.decomposition, 0.0)
            Hierarchy = 'top';
            [tmpbody, tmpsignals, tmpconsts] = local_productofelements_1multi(invect_1, In1_vld, tmpout(cloop), modestring, name, Hierarchy, config, sufix);
        else
            if eq(cloop, 1.0)
                Hierarchy = 'top';
            else
                Hierarchy = 'blk';
            end
            [tmpbody, tmpsignals, tmpconsts] = local_productofelements_1multi(invect_1, In1_vld, tmpout(cloop), modestring, name, Hierarchy, config, sufix);
        end
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        constants = horzcat(constants, tmpconsts);
        first_element = minus(plus(first_element, decompose_vector(cloop)), 2.0);
    end % for
end
function [body, signals, constants] = local_productofelements_1multi(invect, In1_vld, out, modestring, name, Hierarchy, config, sufix)
    % 182 187
    % 183 187
    % 184 187
    % 185 187
    invectsize = config.invectsize;
    cmplx = config.cmplx;
    sltype = config.sltype;
    vtype = config.vtype;
    rnd = config.rounding;
    sat = config.saturation;
    % 192 194
    bdt = hdlgetparameter('base_data_type');
    % 194 196
    comment = horzcat('\n', '  ', hdlgetparameter('comment_char'), ' ', modestring, '_block', sufix, ': ');
    % 196 198
    body = '';
    signals = '';
    constants = '';
    % 200 206
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    max_cnt = minus(length(invect), 2.0);
    cnt_sz = ceil(log2(length(invect)));
    % 207 210
    % 208 210
    [cntvtype, cntsltype] = hdlgettypesfromsizes(cnt_sz, 0.0, 0.0);
    % 210 216
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    if eq(length(invect), 2.0)
        signals = horzcat(signals, comment, 'Signal/Constant Declaration ', '\n');
        [idxname, nxt_value] = hdlnewsignal(horzcat('next', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(nxt_value));
        [idxname, tmp_out] = hdlnewsignal(horzcat('tmp_out', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(tmp_out));
        % 221 223
        body = horzcat(body, comment, 'Determine the ', modestring, ' between the two inputs', '\n');
        [tmpbody, tmpsignals] = hdlmultiply(invect(1.0), invect(2.0), nxt_value, rnd, sat);
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        body = horzcat(body, hdlunitdelay(nxt_value, tmp_out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
        body = horzcat(body, hdldatatypeassignment(tmp_out, out, rnd, sat));
    else
        % 229 233
        % 230 233
        % 231 233
        signals = horzcat(signals, comment, 'Constant Declaration ', '\n');
        [idxname, std_0] = hdlnewsignal(horzcat('std_0', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        constants = horzcat(constants, makehdlconstantdecl(std_0, hdlconstantvalue(0.0, 1.0, 0.0, 0.0)));
        [idxname, std_1] = hdlnewsignal(horzcat('std_1', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        constants = horzcat(constants, makehdlconstantdecl(std_1, hdlconstantvalue(1.0, 1.0, 0.0, 0.0)));
        % 237 239
        [incsz, incbp, incsi] = hdlgetsizesfromtype(cntsltype);
        [idxname, end_cnt] = hdlnewsignal(horzcat('end_cnt', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
        constants = horzcat(constants, makehdlconstantdecl(end_cnt, hdlconstantvalue(max_cnt, incsz, incbp, incsi)));
        % 241 246
        % 242 246
        % 243 246
        % 244 246
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
        % 256 259
        % 257 259
        signals = horzcat(signals, comment, ' ', modestring, ' related signal Declaration', '\n');
        [idxname, pre_value] = hdlnewsignal(horzcat('pre_', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(pre_value));
        [idxname, cur_value] = hdlnewsignal(horzcat('cur_value', sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(cur_value));
        [idxname, nxt_value] = hdlnewsignal(horzcat('next', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(nxt_value));
        [idxname, tmp_out] = hdlnewsignal(horzcat('tmp_out', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        signals = horzcat(signals, makehdlsignaldecl(tmp_out));
        % 267 270
        % 268 270
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
        end
        % 282 284
        [idxname, In_vld] = hdlnewsignal(horzcat('In_vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(In_vld));
        body = horzcat(body, hdlsignalassignment(In1_vld, In_vld));
        % 286 288
        [idxname, outvld_tmp] = hdlnewsignal(horzcat('outvld_tmp', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(outvld_tmp));
        if eq(Hierarchy, 'top')
            [idxname, out_vld] = hdlnewsignal(horzcat('out_vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(out_vld));
            % 292 294
        end
        % 294 297
        % 295 297
        signals = horzcat(signals, comment, 'Misc Signal Declaration', '\n');
        [idxname, unsigned_1] = hdlnewsignal(horzcat('unsigned_1', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
        constants = horzcat(constants, makehdlconstantdecl(unsigned_1, hdlconstantvalue(1.0, incsz, incbp, incsi)));
        [idxname, invld_and_not_cntenb] = hdlnewsignal(horzcat('invld_and_not_cntenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(invld_and_not_cntenb));
        [idxname, not_in1vld] = hdlnewsignal(horzcat('not_in1vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(not_in1vld));
        [idxname, invld_or_cntenb] = hdlnewsignal(horzcat('invld_or_cntenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(invld_or_cntenb));
        % 305 307
        [idxname, cnt_clkenb] = hdlnewsignal(horzcat('cnt_clkenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
        signals = horzcat(signals, makehdlsignaldecl(cnt_clkenb));
        % 308 316
        % 309 316
        % 310 316
        % 311 316
        % 312 316
        % 313 316
        % 314 316
        primary_clken = hdlgetcurrentclockenable;
        body = horzcat(body, hdlbitop(cnt_enb, not_cnt_enb, 'NOT'));
        body = horzcat(body, hdlbitop(horzcat(In_vld, not_cnt_enb), invld_and_not_cntenb, 'AND'));
        % 318 321
        % 319 321
        body = horzcat(body, comment, 'Input vector expansion (Demux)', '\n');
        body = horzcat(body, hdlmux(horzcat(invect(1.0:minus(end, 2.0)), invect(end)), cur_value, cnt, {'=='}, [], 'when-else', [], 0.0:minus(max_cnt, 1.0)));
        % 322 325
        % 323 325
        body = horzcat(body, comment, 'Choosing between new input data or saved value ', '\n');
        body = horzcat(body, hdlmux(horzcat(invect(minus(end, 1.0)), out), pre_value, invld_and_not_cntenb, {'='}, 1.0, 'when-else'));
        % 326 329
        % 327 329
        body = horzcat(body, comment, 'Counter', '\n');
        % 329 331
        body = horzcat(body, hdlbitop(horzcat(In_vld, cnt_enb), invld_or_cntenb, 'OR'));
        body = horzcat(body, hdlbitop(horzcat(primary_clken, invld_or_cntenb), cnt_clkenb, 'AND'));
        % 332 335
        % 333 335
        hdladdclockenablesignal(cnt_clkenb);
        hdlsetcurrentclockenable(cnt_clkenb);
        [tmpbody, tmpsignalidx] = hdlcounter(cnt, plus(max_cnt, 1.0), horzcat(hdluniqueprocessname, '_counter', sufix), 1.0, 0.0, -1.0);
        body = horzcat(body, tmpbody);
        for n=1.0:length(tmpsignalidx)
            signals = horzcat(signals, makehdlsignaldecl(tmpsignalidx(n)));
        end % for
        % 341 343
        body = horzcat(body, comment, 'Counter enable', '\n');
        body = horzcat(body, hdlrelop(cnt, end_cnt, cntenb_tmp, '<'));
        body = horzcat(body, hdlunitdelay(cntenb_tmp, cnt_enb, horzcat(hdluniqueprocessname, '_counter_enb', sufix), 0.0));
        % 345 348
        % 346 348
        body = horzcat(body, comment, 'Determine the ', modestring, ' between the current and previous value', '\n');
        % 348 351
        % 349 351
        [tmpbody, tmpsignals] = hdlmultiply(cur_value, pre_value, nxt_value, rnd, sat);
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        % 353 356
        % 354 356
        body = horzcat(body, hdlunitdelay(nxt_value, tmp_out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
        body = horzcat(body, hdldatatypeassignment(tmp_out, out, rnd, sat));
        % 357 359
        hdlsetcurrentclockenable(primary_clken);
        % 359 362
        % 360 362
        oldcbs = hdlgetparameter('cast_before_sum');
        hdlsetparameter('cast_before_sum', 0.0);
        [tmpbody, tmpsignals] = hdlsub(end_cnt, unsigned_1, cnt_dec2, 'Floor', 0.0);
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        hdlsetparameter('cast_before_sum', oldcbs);
        body = horzcat(body, hdlrelop(cnt, end_cnt, outvld_tmp, '='));
        % 368 370
        if eq(Hierarchy, 'top')
            body = horzcat(body, comment, 'Generate the output valid signal', '\n');
            body = horzcat(body, hdlunitdelay(outvld_tmp, out_vld, horzcat(hdluniqueprocessname, '_out_vld_proc', sufix), 0.0));
            % 372 375
            % 373 375
            body = horzcat(body, comment, 'Generate the ready (Status) signal', '\n');
            body = horzcat(body, hdlrelop(cnt, cnt_dec2, rdy_cond, '>='));
            body = horzcat(body, hdlmux(horzcat(std_1, rdy_reg), rdy_tmp, rdy_cond, {'='}, 1.0, 'when-else'));
            body = horzcat(body, hdlmux(horzcat(std_0, rdy_tmp), nxt_rdy, In_vld, {'='}, 1.0, 'when-else'));
            body = horzcat(body, hdlunitdelay(nxt_rdy, rdy_reg, horzcat(hdluniqueprocessname, '_rdy_proc', sufix), 1.0));
            body = horzcat(body, hdlbitop(In_vld, not_in1vld, 'NOT'));
            body = horzcat(body, hdlbitop(horzcat(rdy_reg, not_in1vld), rdy, 'AND'));
        end
    end
end
