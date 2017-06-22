function hdlcode = emit(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    decomposition = this.getDecomposition();
    % 9 11
    hdlcode = hdlcodeinit;
    bfp = hC.SimulinkHandle;
    name = hdllegalname(get_param(bfp, 'Name'));
    % 13 16
    % 14 16
    if gt(length(hC.OutputPorts), 1.0) && strcmpi(hdlsignalsltype(hC.OutputPort(2.0).getSignal), 'double')
        error(hdlcodererrormsgid('UnhandledDoubleIndex'), 'The cascade implementation of Min/Max does not support double-precision Index output ports.  Please select another implementation architecture.');
        % 17 19
    end
    % 19 21
    if gt(length(hC.InputPorts), 1.0)
        error(hdlcodererrormsgid('TooManyInputs'), 'MinMax block with cascade implementation requires a single vector as input.');
        % 22 24
    end
    % 24 26
    body = '';
    signals = '';
    consts = '';
    % 28 30
    if strcmp(this.block, 'built-in/MinMax')
        modestring = get_param(bfp, 'Function');
        fcn_string = 'Value';
        rnd = get_param(bfp, 'RndMeth');
        sat = strcmpi(get_param(bfp, 'DoSatur'), 'on');
    else
        if strcmp(this.Blocks, 'dspstat3/Minimum')
            modestring = 'min';
            fcn_string = get_param(bfp, 'fcn');
            rnd = 'Floor';
            sat = false;
        else
            if strcmp(this.Blocks, 'dspstat3/Maximum')
                modestring = 'max';
                fcn_string = get_param(bfp, 'fcn');
                rnd = 'Floor';
                sat = false;
            else
                modestring = 'unknown';
                fcn_string = 'unknown';
                rnd = 'Floor';
                sat = false;
            end
        end
    end
    userData = this.getHDLUserData(hC);
    Up = userData.decompose_vector(1.0);
    Down = 1.0;
    Phase = 0.0;
    % 58 61
    % 59 61
    if not(isempty(Up))
        hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
        % 62 65
        % 63 65
        baseratecontext = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
        original_clken = hdlgetcurrentclockenable;
        if gt(Up, 2.0)
            this.beginClockBundleContext(hC.Owner, hC, hS, Up, Down, Phase);
        end
        % 69 72
        % 70 72
        In1_vld = original_clken;
    else
        In1_vld = 'NotUsed';
    end
    % 75 78
    % 76 78
    if any(strcmpi(modestring, {'min','max'}))
        % 78 80
        in = hC.InputPorts(1.0).getSignal;
        out = hC.OutputPorts(1.0).getSignal;
        idx = 0.0;
        % 82 85
        % 83 85
        config.invectsize = max(hdlsignalvector(in));
        config.cmplx = hdlsignalcomplex(in);
        config.sltype = hdlsignalsltype(in);
        config.vtype = hdlblockdatatype(config.sltype);
        config.decomposition = decomposition;
        % 89 91
        if all(eq(config.invectsize, 0.0))
            invect = in;
        else
            invect = hdlexpandvectorsignal(in);
        end
        % 95 97
        if strcmpi(fcn_string, 'Value and Index')
            idx = hC.OutputPorts(2.0).getSignal;
            [body, signals, consts] = implement_cascade(invect, out, In1_vld, idx, modestring, name, config, rnd, sat);
        else
            if strcmpi(fcn_string, 'Index')
                idx = out;
                [idxname, out] = hdlnewsignal(horzcat('out', modestring), 'block', -1.0, 0.0, 0.0, config.vtype, config.sltype);
                signals = horzcat(signals, makehdlsignaldecl(out));
                [tmpbody, tmpsignals, consts] = implement_cascade(invect, out, In1_vld, idx, modestring, name, config, rnd, sat);
                signals = horzcat(signals, tmpsignals);
                body = horzcat(body, tmpbody);
            else
                if strcmpi(fcn_string, 'Value')
                    [body, signals, consts] = implement_cascade(invect, out, In1_vld, idx, modestring, name, config, rnd, sat);
                else
                    if strcmpi(fcn_string, 'Running')
                        error(hdlcodererrormsgid('unsupportblock'), 'This block function mode (%s) for hdlminmaxblock is not supported', fcn_string);
                    else
                        error(hdlcodererrormsgid('unsupportblock'), 'This block function mode (%s) for hdlminmaxblock is not supported', fcn_string);
                        % 115 117
                    end
                end
            end
        end
    else
        error(hdlcodererrormsgid('unsupportblock'), 'This block mode (%s) for hdlminmaxblock is not supported', modestring);
    end
    if gt(Up, 1.0)
        this.endClockBundleContext(baseratecontext);
    end
    % 126 128
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_signals = signals;
    hdlcode.arch_constants = consts;
end
function [body, signals, consts] = implement_cascade(invect, out, In1_vld, idx, modestring, name, config, rnd, sat)
    % 132 137
    % 133 137
    % 134 137
    % 135 137
    body = '';
    signals = '';
    consts = '';
    % 139 141
    if lt(config.invectsize, 2.0)
        decompose_vector = 1.0;
    else
        decompose_vector = hdlcascadedecompose(config.invectsize, config.decomposition);
    end
    % 145 148
    % 146 148
    if ge(config.invectsize, 2.0)
        tmpout = handle(0.0);
        for cloop=2.0:length(decompose_vector)
            [idxname, tmpout(cloop)] = hdlnewsignal(horzcat(modestring, 'out_', num2str(decompose_vector(cloop))), 'block', -1.0, 0.0, 0.0, config.vtype, config.sltype);
            signals = horzcat(signals, makehdlsignaldecl(tmpout(cloop)));
        end % for
        tmpout(1.0) = out;
        % 154 157
        % 155 157
        tmpidx = handle(0.0);
        for cloop=2.0:length(decompose_vector)
            [idxvtype, idxsltype] = hdlgettypesfromsizes(plus(decompose_vector(cloop), 1.0), 0.0, 0.0);
            [idxname, tmpidx(cloop)] = hdlnewsignal(horzcat(modestring, 'idx_', num2str(decompose_vector(cloop))), 'block', -1.0, 0.0, 0.0, idxvtype, idxsltype);
            signals = horzcat(signals, makehdlsignaldecl(tmpidx(cloop)));
        end % for
        % 162 165
        % 163 165
        tmpidxout = handle(idx);
        if gt(length(tmpidx), 0.0)
            for cloop=2.0:length(tmpidx)
                tmpidxout = horzcat(tmpidxout, tmpidx(cloop));
            end % for
        end
        % 170 175
        % 171 175
        % 172 175
        % 173 175
        tmpidxin = [];
        if gt(length(tmpidx), 0.0)
            % 176 178
            [tmpvtype, tmpsltype] = hdlgettypesfromsizes(decompose_vector(length(decompose_vector)), 0.0, 0.0);
            [incsz, incbp, incsi] = hdlgetsizesfromtype(tmpsltype);
            [tempname, tempidx] = hdlnewsignal('zero', 'block', -1.0, 0.0, 0.0, tmpvtype, tmpsltype);
            consts = horzcat(consts, makehdlconstantdecl(tempidx, hdlconstantvalue(0.0, incsz, incbp, incsi)));
            % 181 184
            % 182 184
            [dummyname, dummyidx] = hdlnewsignal('dummy', 'block', -1.0, 0.0, 0.0, tmpvtype, tmpsltype);
            signals = horzcat(signals, makehdlsignaldecl(dummyidx));
            body = horzcat(body, hdlsignalassignment(tempidx, dummyidx));
            % 186 188
            for cloop=2.0:length(tmpidx)
                tmpidxin = horzcat(tmpidxin, tmpidx(cloop));
            end % for
            tmpidxin = horzcat(tmpidxin, dummyidx);
        end
    else
        tmpidxin = [];
        tmpidxout(1.0) = handle(idx);
        tmpout(1.0) = out;
    end
    % 197 199
    first_element = 1.0;
    for cloop=1.0:length(decompose_vector)
        invect_1 = [];
        if eq(cloop, length(decompose_vector))
            last_element = minus(plus(decompose_vector(cloop), first_element), 1.0);
            for i=first_element:last_element
                invect_1 = horzcat(invect_1, invect(minus(plus(cloop, i), 1.0)));
            end % for
        else
            last_element = minus(plus(decompose_vector(cloop), first_element), 2.0);
            for i=first_element:last_element
                invect_1 = horzcat(invect_1, invect(minus(plus(cloop, i), 1.0)));
            end % for
            invect_1 = horzcat(invect_1, tmpout(plus(cloop, 1.0)));
        end
        if eq(config.decomposition, 0.0)
            sufix = '';
        else
            sufix = horzcat('_', num2str(decompose_vector(cloop)));
        end
        body = horzcat(body, hdlgetparameter('comment_char'), '********************* Stage', sufix, ' Input ', modestring, ' implementation ********************', '\n');
        if eq(length(tmpidxin), 0.0)
            Hierarchy = 'top';
            [tmpbody, tmpsignals, tmpconsts] = local_minmax_1comp(invect_1, In1_vld, tmpidxin, tmpout(cloop), tmpidxout(cloop), modestring, name, Hierarchy, config, sufix, rnd, sat);
        else
            if eq(cloop, 1.0)
                Hierarchy = 'top';
            else
                Hierarchy = 'blk';
            end
            [tmpbody, tmpsignals, tmpconsts] = local_minmax_1comp(invect_1, In1_vld, tmpidxin(cloop), tmpout(cloop), tmpidxout(cloop), modestring, name, Hierarchy, config, sufix, rnd, sat);
        end
        body = horzcat(body, tmpbody);
        signals = horzcat(signals, tmpsignals);
        consts = horzcat(signals, tmpconsts);
        first_element = minus(plus(first_element, decompose_vector(cloop)), 2.0);
    end % for
end
function [body, signals, consts] = local_minmax_1comp(invect, In1_vld, idxin, out, idxout, modestring, name, Hierarchy, config, sufix, rnd, sat)
    % 237 242
    % 238 242
    % 239 242
    % 240 242
    invectsize = config.invectsize;
    cmplx = config.cmplx;
    sltype = config.sltype;
    vtype = config.vtype;
    % 245 249
    % 246 249
    % 247 249
    bdt = hdlgetparameter('base_data_type');
    % 249 251
    comment = horzcat('\n', '  ', hdlgetparameter('comment_char'), ' ', modestring, '_block', sufix, ': ');
    body = '';
    signals = '';
    consts = '';
    % 254 257
    % 255 257
    if strcmpi(modestring, 'min')
        compareop = '<';
    else
        if strcmpi(modestring, 'max')
            compareop = '>';
        end
    end
    if lt(length(invect), 2.0)
        idxsltype = hdlsignalsltype(idxout);
        idxvtype = hdlsignalvtype(idxout);
        signals = horzcat(signals, comment, 'Signal/Constant Declaration ', '\n');
        [incsz, incbp, incsi] = hdlgetsizesfromtype(idxsltype);
        [idxname, unsigned_1] = hdlnewsignal(horzcat('unsigned_1', sufix), 'block', -1.0, 0.0, 0.0, idxvtype, idxsltype);
        consts = horzcat(consts, makehdlconstantdecl(unsigned_1, hdlconstantvalue(1.0, incsz, incbp, incsi)));
        body = horzcat(body, hdldatatypeassignment(invect(1.0), out, rnd, sat));
        body = horzcat(body, hdldatatypeassignment(unsigned_1, idxout, 'Floor', 0.0));
    else
        if eq(length(invect), 2.0)
            max_cnt = 1.0;
            cnt_sz = 2.0;
            [cntvtype, cntsltype] = hdlgettypesfromsizes(cnt_sz, 0.0, 0.0);
            signals = horzcat(signals, comment, 'Signal/Constant Declaration ', '\n');
            [incsz, incbp, incsi] = hdlgetsizesfromtype(cntsltype);
            [idxname, unsigned_1] = hdlnewsignal(horzcat('unsigned_1', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
            consts = horzcat(consts, makehdlconstantdecl(unsigned_1, hdlconstantvalue(1.0, incsz, incbp, incsi)));
            [idxname, unsigned_2] = hdlnewsignal(horzcat('unsigned_2', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
            consts = horzcat(consts, makehdlconstantdecl(unsigned_2, hdlconstantvalue(2.0, incsz, incbp, incsi)));
            [idxname, nxt_value] = hdlnewsignal(horzcat('next', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            signals = horzcat(signals, makehdlsignaldecl(nxt_value));
            [idxname, tmp_out] = hdlnewsignal(horzcat('tmp_out', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            signals = horzcat(signals, makehdlsignaldecl(tmp_out));
            [idxname, compare_true] = hdlnewsignal(horzcat('compare_true', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(compare_true));
            body = horzcat(body, comment, 'Determine the ', modestring, ' between the two inputs', '\n');
            body = horzcat(body, hdlrelop(invect(1.0), invect(2.0), compare_true, compareop));
            body = horzcat(body, hdlmux(horzcat(invect(1.0), invect(2.0)), nxt_value, compare_true, {'='}, 1.0, 'when-else'));
            body = horzcat(body, hdlunitdelay(nxt_value, tmp_out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
            body = horzcat(body, hdldatatypeassignment(tmp_out, out, rnd, sat));
            if ne(idxout, 0.0)
                [idxname, Index] = hdlnewsignal(horzcat('Index', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(Index));
                [idxname, tmp_idx] = hdlnewsignal(horzcat('tmp_idx', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(tmp_idx));
                body = horzcat(body, comment, 'Determine the index of the ', modestring, '\n');
                body = horzcat(body, hdlmux(horzcat(unsigned_1, unsigned_2), Index, compare_true, {'='}, 1.0, 'when-else'));
                body = horzcat(body, hdlunitdelay(Index, tmp_idx, horzcat(hdluniqueprocessname, '_update_index', sufix), 0.0));
                body = horzcat(body, hdldatatypeassignment(tmp_idx, idxout, 'Floor', 0.0));
            end
        else
            % 305 309
            % 306 309
            % 307 309
            max_cnt = minus(length(invect), 1.0);
            cnt_sz = plus(ceil(log2(length(invect))), 1.0);
            % 310 313
            % 311 313
            [cntvtype, cntsltype] = hdlgettypesfromsizes(cnt_sz, 0.0, 0.0);
            % 313 318
            % 314 318
            % 315 318
            % 316 318
            signals = horzcat(signals, comment, 'Signal/Constant Declaration ', '\n');
            [incsz, incbp, incsi] = hdlgetsizesfromtype(cntsltype);
            [idxname, unsigned_1] = hdlnewsignal(horzcat('unsigned_1', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
            consts = horzcat(consts, makehdlconstantdecl(unsigned_1, hdlconstantvalue(1.0, incsz, incbp, incsi)));
            [idxname, unsigned_2] = hdlnewsignal(horzcat('unsigned_2', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
            consts = horzcat(consts, makehdlconstantdecl(unsigned_2, hdlconstantvalue(2.0, incsz, incbp, incsi)));
            if ne(idxout, 0.0)
                idxsltype = hdlsignalsltype(idxout);
                idxvtype = hdlsignalvtype(idxout);
                if all(eq(invect, 0.0))
                    idxvect = 0.0;
                else
                    idxvect = zeros(1.0, length(invect));
                end
                idxsizes = hdlsignalsizes(idxout);
            end
            % 333 337
            % 334 337
            % 335 337
            signals = horzcat(signals, comment, 'Constant Declaration ', '\n');
            [idxname, std_0] = hdlnewsignal(horzcat('std_0', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            consts = horzcat(consts, makehdlconstantdecl(std_0, hdlconstantvalue(0.0, 1.0, 0.0, 0.0)));
            [idxname, std_1] = hdlnewsignal(horzcat('std_1', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            consts = horzcat(consts, makehdlconstantdecl(std_1, hdlconstantvalue(1.0, 1.0, 0.0, 0.0)));
            % 341 343
            [incsz, incbp, incsi] = hdlgetsizesfromtype(cntsltype);
            [idxname, end_cnt] = hdlnewsignal(horzcat('end_cnt', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
            consts = horzcat(consts, makehdlconstantdecl(end_cnt, hdlconstantvalue(max_cnt, incsz, incbp, incsi)));
            % 345 350
            % 346 350
            % 347 350
            % 348 350
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
            % 360 362
            if ne(idxout, 0.0)
                signals = horzcat(signals, comment, ' ', 'index related signal Declaration', '\n');
                [idxname, Index] = hdlnewsignal(horzcat('Index', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(Index));
                [idxname, tmp_idx] = hdlnewsignal(horzcat('tmp_idx', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(tmp_idx));
                [idxname, cntAddOne] = hdlnewsignal(horzcat('cntAddOne', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(cntAddOne));
                [idxname, cntAddTwo] = hdlnewsignal(horzcat('cntAddTwo', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(cntAddTwo));
                % 371 373
                [idxname, pre_indx] = hdlnewsignal(horzcat('pre_indx', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(pre_indx));
                [idxname, cur_indx] = hdlnewsignal(horzcat('cur_indx', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(cur_indx));
                [idxname, nxt_indx] = hdlnewsignal(horzcat('nxt_indx', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                signals = horzcat(signals, makehdlsignaldecl(nxt_indx));
                if ne(idxin, 0.0)
                    [idxname, add_tmp2] = hdlnewsignal(horzcat('add_tmp2', sufix), 'block', -1.0, 0.0, 0.0, cntvtype, cntsltype);
                    signals = horzcat(signals, makehdlsignaldecl(add_tmp2));
                end
            end
            % 383 385
            signals = horzcat(signals, comment, ' ', modestring, ' related signal Declaration', '\n');
            [idxname, pre_value] = hdlnewsignal(horzcat('pre_', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            signals = horzcat(signals, makehdlsignaldecl(pre_value));
            [idxname, cur_value] = hdlnewsignal(horzcat('cur_value', sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            signals = horzcat(signals, makehdlsignaldecl(cur_value));
            [idxname, nxt_value] = hdlnewsignal(horzcat('next', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            signals = horzcat(signals, makehdlsignaldecl(nxt_value));
            [idxname, tmp_out] = hdlnewsignal(horzcat('tmp_out', modestring, sufix), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            signals = horzcat(signals, makehdlsignaldecl(tmp_out));
            % 393 396
            % 394 396
            if eq(Hierarchy, 'top')
                signals = horzcat(signals, comment, 'Status (rdy) related Signal Declaration', '\n');
                [idxname, rdy_cond] = hdlnewsignal(horzcat('rdy_cond', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(rdy_cond));
                [idxname, nxt_rdy] = hdlnewsignal(horzcat('nxt_rdy', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(nxt_rdy));
                [idxname, rdy_tmp] = hdlnewsignal(horzcat('rdy_tmp', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(rdy_tmp));
                [idxname, rdy_reg] = hdlnewsignal(horzcat('rdy_reg', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(rdy_reg));
                [idxname, rdy] = hdlnewsignal(horzcat('rdy', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(rdy));
            end
            % 408 411
            % 409 411
            [idxname, In_vld] = hdlnewsignal(horzcat('In_vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(In_vld));
            body = horzcat(body, hdlsignalassignment(In1_vld, In_vld));
            % 413 416
            % 414 416
            [idxname, outvld_tmp] = hdlnewsignal(horzcat('outvld_tmp', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(outvld_tmp));
            if eq(Hierarchy, 'top')
                [idxname, out_vld] = hdlnewsignal(horzcat('out_vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
                signals = horzcat(signals, makehdlsignaldecl(out_vld));
            end
            % 421 424
            % 422 424
            signals = horzcat(signals, comment, 'Misc Signal Declaration', '\n');
            [idxname, invld_and_not_cntenb] = hdlnewsignal(horzcat('invld_and_not_cntenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(invld_and_not_cntenb));
            % 426 428
            [idxname, not_in1vld] = hdlnewsignal(horzcat('not_in1vld', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(not_in1vld));
            % 429 431
            [idxname, invld_or_cntenb] = hdlnewsignal(horzcat('invld_or_cntenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(invld_or_cntenb));
            % 432 434
            [idxname, compare_true] = hdlnewsignal(horzcat('compare_true', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(compare_true));
            % 435 437
            [idxname, cnt_clkenb] = hdlnewsignal(horzcat('cnt_clkenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(cnt_clkenb));
            % 438 440
            [idxname, update_clkenb] = hdlnewsignal(horzcat('update_clkenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(update_clkenb));
            % 441 443
            [idxname, Index_clkenb] = hdlnewsignal(horzcat('Index_clkenb', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(Index_clkenb));
            % 444 446
            [idxname, idxclken_tmp] = hdlnewsignal(horzcat('idxclken_tmp', sufix), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            signals = horzcat(signals, makehdlsignaldecl(idxclken_tmp));
            % 447 452
            % 448 452
            % 449 452
            % 450 452
            if ne(idxout, 0.0)
                oldcbs = hdlgetparameter('cast_before_sum');
                hdlsetparameter('cast_before_sum', 0.0);
                [tmpbody_1, tmpsignals_1] = hdladd(cnt, unsigned_1, cntAddOne, 'Floor', 0.0);
                signals = horzcat(signals, tmpsignals_1);
                body = horzcat(body, tmpbody_1);
                [tmpbody_1, tmpsignals_1] = hdladd(cntAddOne, unsigned_1, cntAddTwo, 'Floor', 0.0);
                signals = horzcat(signals, tmpsignals_1);
                body = horzcat(body, tmpbody_1);
                hdlsetparameter('cast_before_sum', oldcbs);
            end
            % 462 464
            primary_clken = hdlgetcurrentclockenable;
            % 464 466
            body = horzcat(body, comment, 'Input vector expansion (Demux)', '\n');
            body = horzcat(body, hdlmux(invect(2.0:end), cur_value, cnt, {'=='}, [], 'when-else', [], 0.0:max_cnt));
            % 467 470
            % 468 470
            body = horzcat(body, comment, 'Choosing between new input data or saved value ', '\n');
            body = horzcat(body, hdlmux(horzcat(invect(1.0), out), pre_value, invld_and_not_cntenb, {'='}, 1.0, 'when-else'));
            % 471 473
            if ne(idxout, 0.0)
                % 473 475
                body = horzcat(body, comment, 'Input vector expansion index', '\n');
                body = horzcat(body, hdlsignalassignment(cntAddTwo, cur_indx));
                % 476 479
                % 477 479
                body = horzcat(body, comment, 'Choosing between new index or saved index ', '\n');
                body = horzcat(body, hdlmux(horzcat(cntAddOne, tmp_idx), pre_indx, invld_and_not_cntenb, {'='}, 1.0, 'when-else'));
            end
            % 481 485
            % 482 485
            % 483 485
            body = horzcat(body, comment, 'Counter', '\n');
            % 485 487
            body = horzcat(body, hdlbitop(horzcat(In_vld, cnt_enb), invld_or_cntenb, 'OR'));
            body = horzcat(body, hdlbitop(horzcat(primary_clken, invld_or_cntenb), cnt_clkenb, 'AND'));
            % 488 490
            hdladdclockenablesignal(cnt_clkenb);
            hdlsetcurrentclockenable(cnt_clkenb);
            [tmpbody, tmpsignalidx] = hdlcounter(cnt, plus(max_cnt, 1.0), horzcat(hdluniqueprocessname, '_counter', sufix), 1.0, 0.0, -1.0);
            body = horzcat(body, tmpbody);
            for n=1.0:length(tmpsignalidx)
                signals = horzcat(signals, makehdlsignaldecl(tmpsignalidx(n)));
            end % for
            % 496 498
            body = horzcat(body, comment, 'Counter enable', '\n');
            body = horzcat(body, hdlrelop(cnt, end_cnt, cntenb_tmp, '<'));
            body = horzcat(body, hdlunitdelay(cntenb_tmp, cnt_enb, horzcat(hdluniqueprocessname, '_counter_enb', sufix), 0.0));
            % 500 503
            % 501 503
            body = horzcat(body, comment, 'Determine the ', modestring, ' between the current and previous value', '\n');
            body = horzcat(body, hdlrelop(cur_value, pre_value, compare_true, compareop));
            body = horzcat(body, hdlmux(horzcat(cur_value, pre_value), nxt_value, compare_true, {'='}, 1.0, 'when-else'));
            hdlsetcurrentclockenable(primary_clken);
            body = horzcat(body, hdlunitdelay(nxt_value, tmp_out, horzcat(hdluniqueprocessname, '_update_value', sufix), 0.0));
            body = horzcat(body, hdldatatypeassignment(tmp_out, out, rnd, sat));
            % 508 511
            % 509 511
            if ne(idxout, 0.0)
                body = horzcat(body, comment, 'Determine the index between the current and previous index', '\n');
                body = horzcat(body, hdlmux(horzcat(cur_indx, pre_indx), nxt_indx, compare_true, {'='}, 1.0, 'when-else'));
            end
            % 514 517
            % 515 517
            body = horzcat(body, comment, 'Determine the index of the ', modestring, '\n');
            body = horzcat(body, hdlbitop(cnt_enb, not_cnt_enb, 'NOT'));
            body = horzcat(body, hdlbitop(horzcat(In_vld, not_cnt_enb), invld_and_not_cntenb, 'AND'));
            body = horzcat(body, hdlbitop(horzcat(primary_clken, invld_and_not_cntenb), idxclken_tmp, 'AND'));
            body = horzcat(body, hdlbitop(horzcat(primary_clken, compare_true), update_clkenb, 'AND'));
            if ne(idxout, 0.0)
                % 522 524
                body = horzcat(body, hdlbitop(horzcat(idxclken_tmp, update_clkenb), Index_clkenb, 'OR'));
                % 524 526
                if ne(idxin, 0.0)
                    [tmpbody_2, tmpsignals_2] = hdladd(idxin, end_cnt, add_tmp2, 'Floor', 0.0);
                    signals = horzcat(signals, tmpsignals_2);
                    body = horzcat(body, tmpbody_2);
                    body = horzcat(body, hdlmux(horzcat(add_tmp2, nxt_indx), Index, outvld_tmp, {'='}, 1.0, 'when-else'));
                else
                    body = horzcat(body, hdlsignalassignment(nxt_indx, Index));
                end
                hdlsetparameter('cast_before_sum', oldcbs);
                % 534 536
                hdladdclockenablesignal(Index_clkenb);
                hdlsetcurrentclockenable(Index_clkenb);
                body = horzcat(body, hdlunitdelay(Index, tmp_idx, horzcat(hdluniqueprocessname, '_update_index', sufix), 0.0));
                body = horzcat(body, hdldatatypeassignment(tmp_idx, idxout, 'Floor', 0.0));
            end
            % 540 544
            % 541 544
            % 542 544
            oldcbs = hdlgetparameter('cast_before_sum');
            hdlsetparameter('cast_before_sum', 0.0);
            [tmpbody, tmpsignals] = hdlsub(end_cnt, unsigned_1, cnt_dec2, 'Floor', 0.0);
            body = horzcat(body, tmpbody);
            signals = horzcat(signals, tmpsignals);
            hdlsetparameter('cast_before_sum', oldcbs);
            hdlsetcurrentclockenable(primary_clken);
            body = horzcat(body, hdlrelop(cnt, cnt_dec2, outvld_tmp, '='));
            % 551 553
            if eq(Hierarchy, 'top')
                body = horzcat(body, comment, 'Generate the output valid signal', '\n');
                body = horzcat(body, hdlunitdelay(outvld_tmp, out_vld, horzcat(hdluniqueprocessname, '_out_vld_proc', sufix), 0.0));
                % 555 558
                % 556 558
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
end
