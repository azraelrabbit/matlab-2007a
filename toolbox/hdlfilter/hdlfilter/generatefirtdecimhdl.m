function generatefirtdecimhdl(filterobj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(builtin('license', 'checkout', 'Filter_Design_HDL_Coder'))
        error(generatemsgid('nolicenseavailable'), 'Unable to check out a license for the Filter Design HDL Coder.');
        % 9 11
    end
    % 11 13
    bdt = hdlgetparameter('base_data_type');
    hdlsetparameter('filter_target_language', hdlgetparameter('target_language'));
    hdlentitysignalsinit;
    % 15 17
    phases = filterobj.decimationfactor;
    % 17 19
    switch lower(class(filterobj))
    case 'mfilt.firtdecim'
        arithtype = get(filterobj, 'Arithmetic');
        switch arithtype
        case 'double'
            arithisdouble = true;
        case 'fixed'
            arithisdouble = false;
        otherwise
            error(generatemsgid('unsupportedarithmetic'), 'HDL generation for this object with Arithmetic (%s) is not supported.', arithtype);
            % 28 31
            % 29 31
        end
        structure = class(filterobj);
        coeffs = coefficients(filterobj);
        coeffs = coeffs{1.0};
        firlen = length(coeffs);
        polycoeffs = polyphase(filterobj);
    otherwise
        error(generatemsgid('unsupportedarch'), 'Object class (%s) is not supported by generatefirtdecimhdl.', class(filterobj));
        % 38 41
        % 39 41
    end
    % 41 43
    oddtaps = mod(firlen, 2.0);
    szfirlen = size(firlen);
    % 44 46
    if ne(szfirlen(1.0), 1.0) || ne(szfirlen(2.0), 1.0)
        error(generatemsgid('multisectionfir'), horzcat('HDL code generation is not supported for multisection ', upper(structure), ' filters.'));
        % 47 49
    end
    % 49 51
    if eq(firlen, 1.0)
        error(generatemsgid('zero_order'), 'Cannot generate HDL for a zero order FIRTDECIM.');
    end
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    if arithisdouble
        [coeffsvsize, coeffsvbp, coeffssigned, coeffsvtype, coeffssltype] = setfordouble;
        [inputsize, inputbp, inputsigned, inputvtype, inputsltype] = setportfordouble;
        [reginputsize, reginputbp, reginputsigned, reginputvtype, reginputsltype] = setfordouble;
        [storagesize, storagebp, storagesigned, storagevtype, storagesltype] = setfordouble;
        [outputsize, outputbp, outputsigned, outputvtype, outputsltype] = setportfordouble;
        [castsize, castbp, castsigned, castvtype, castsltype] = setfordouble;
        [productsize, productbp, productsigned, productvtype, productsltype] = setfordouble;
        [sumsize, sumbp, sumsigned, sumvtype, sumsltype] = setfordouble;
        [polysumsize, polysumbp] = setfordouble;
        [polysumvtype, polysumsltype] = hdlgettypesfromsizes(polysumsize, polysumbp, sumsigned);
        [outputrounding, productrounding, sumrounding] = deal('floor');
        [outputsaturation, productsaturation, sumsaturation] = deal(false);
    else
        coeffssigned = get(filterobj, 'Signed');
        % 74 76
        [inputsigned, outputsigned, productsigned, sumsigned] = deal(true);
        % 76 78
        switch lower(get(filterobj, 'OverflowMode'))
        case 'saturate'
            [outputsaturation, productsaturation, sumsaturation] = deal(true);
        otherwise
            [outputsaturation, productsaturation, sumsaturation] = deal(false);
        end
        % 83 85
        rmode = get(filterobj, 'RoundMode');
        [outputrounding, productrounding, sumrounding] = deal(rmode);
        % 86 88
        coeffsvsize = get(filterobj, 'CoeffWordLength');
        coeffsvbp = get(filterobj, 'NumFracLength');
        [coeffsvtype, coeffssltype] = hdlgettypesfromsizes(coeffsvsize, coeffsvbp, coeffssigned);
        % 90 92
        inputsize = get(filterobj, 'InputWordLength');
        inputbp = get(filterobj, 'InputFracLength');
        if eq(hdlgetparameter('filter_input_type_std_logic'), 1.0)
            [inputvtype, inputsltype] = hdlgetporttypesfromsizes(inputsize, inputbp, inputsigned);
        else
            [inputvtype, inputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        end
        [reginputvtype, reginputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        % 99 101
        outputsize = get(filterobj, 'OutputWordLength');
        outputbp = get(filterobj, 'OutputFracLength');
        if eq(hdlgetparameter('filter_output_type_std_logic'), 1.0)
            [outputvtype, outputsltype] = hdlgetporttypesfromsizes(outputsize, outputbp, outputsigned);
        else
            [outputvtype, outputsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        end
        [castvtype, castsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        % 108 110
        productsize = get(filterobj, 'ProductWordLength');
        productbp = get(filterobj, 'ProductFracLength');
        [productvtype, productsltype] = hdlgettypesfromsizes(productsize, productbp, productsigned);
        sumsize = get(filterobj, 'AccumWordLength');
        sumbp = get(filterobj, 'AccumFracLength');
        [sumvtype, sumsltype] = hdlgettypesfromsizes(sumsize, sumbp, sumsigned);
        polysumsize = get(filterobj, 'PolyAccWordLength');
        polysumbp = get(filterobj, 'PolyAccFracLength');
        [polysumvtype, polysumsltype] = hdlgettypesfromsizes(polysumsize, polysumbp, sumsigned);
        % 118 120
        storagesize = get(filterobj, 'StateWordLength');
        storagebp = get(filterobj, 'StateFracLength');
        storagesigned = sumsigned;
        [storagevtype, storagesltype] = hdlgettypesfromsizes(storagesize, storagebp, storagesigned);
    end
    % 124 127
    % 125 127
    if not(isreal(coeffs))
        error(generatemsgid('complexnotsupported'), 'Complex filters are not supported!');
    end
    % 129 131
    nname = hdlgetparameter('filter_name');
    if isempty(nname)
        nname = 'filter';
    end
    % 134 136
    disp(sprintf('%s', hdlcodegenmsgs(1.0)));
    % 136 139
    % 137 139
    hdl_entity_comment = hdlentitycomment(nname, hdlgetparameter('rcs_cvs_tag'), info(filterobj), hdlgetparameter('comment_char'));
    % 139 142
    % 140 142
    indentedcomment = horzcat('  ', hdlgetparameter('comment_char'), ' ');
    % 142 145
    % 143 145
    hdl_arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdl_arch_typedefs = horzcat(indentedcomment, 'Type Definitions\n');
    hdl_arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdl_arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdl_arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdl_arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    % 150 152
    if hdlgetparameter('isverilog')
        hdl_arch_decl = '';
        hdl_arch_comment = '';
        hdl_arch_end = horzcat('endmodule', indentedcomment, nname, '\n');
        hdl_arch_component_decl = '';
        hdl_arch_component_config = '';
        hdl_arch_begin = '';
        hdl_arch_body_component_instances = '';
        hdl_entity_library = '';
        hdl_entity_package = hdlverilogtimescale;
        hdl_entity_decl = horzcat('module ', nname, ' ');
        hdl_entity_end = '';
    else
        if hdlgetparameter('isvhdl')
            hdl_arch_decl = horzcat('ARCHITECTURE rtl OF ', nname, ' IS\n');
            if eq(hdlgetparameter('split_entity_arch'), 1.0)
                hdl_arch_comment = hdl_entity_comment;
            else
                hdl_arch_comment = hdldefarchheader(nname);
            end
            hdl_arch_end = 'END rtl;\n';
            hdl_arch_component_decl = '';
            hdl_arch_component_config = '';
            hdl_arch_begin = '\n\nBEGIN\n';
            hdl_arch_body_component_instances = '';
            [hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_end] = vhdlentityinit(nname);
            % 177 180
            % 178 180
        end
    end
    % 181 187
    % 182 187
    % 183 187
    % 184 187
    % 185 187
    if eq(hdlgetparameter('clockinputs'), 1.0)
        multiclock = 0.0;
    else
        multiclock = 1.0;
    end
    % 191 193
    [clkuname, clk] = hdlnewsignal(hdlgetparameter('clockname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 193 195
    hdladdinportsignal(clk);
    hdladdclocksignal(clk);
    hdlsetcurrentclock(clk);
    % 197 199
    [clkenuname, clken] = hdlnewsignal(hdlgetparameter('clockenablename'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 199 201
    hdladdinportsignal(clken);
    hdladdclockenablesignal(clken);
    hdlsetcurrentclockenable(clken);
    [rstuname, reset] = hdlnewsignal(hdlgetparameter('resetname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 204 206
    hdladdinportsignal(reset);
    hdladdresetsignal(reset);
    hdlsetcurrentreset(reset);
    [inuname, entity_input] = hdlnewsignal(hdlgetparameter('filter_input_name'), 'filter', -1.0, 0.0, 0.0, inputvtype, inputsltype);
    % 209 212
    % 210 212
    hdladdinportsignal(entity_input);
    % 212 214
    if eq(multiclock, 1.0)
        [clk1uname, clk1] = hdlnewsignal(horzcat(hdlgetparameter('clockname'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 215 218
        % 216 218
        hdladdinportsignal(clk1);
        hdladdclocksignal(clk1);
        [clken1uname, clken1] = hdlnewsignal(horzcat(hdlgetparameter('clockenablename'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 220 223
        % 221 223
        hdladdinportsignal(clken1);
        hdladdclockenablesignal(clken1);
        [rst1uname, reset1] = hdlnewsignal(horzcat(hdlgetparameter('resetname'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 225 228
        % 226 228
        hdladdinportsignal(reset1);
        hdladdresetsignal(reset1);
    else
        clk1 = 0.0;
        clken1 = 0.0;
        reset1 = 0.0;
    end
    % 234 236
    [outuname, entity_output] = hdlnewsignal(hdlgetparameter('filter_output_name'), 'filter', -1.0, 0.0, 0.0, outputvtype, outputsltype);
    % 236 239
    % 237 239
    hdladdoutportsignal(entity_output);
    if eq(multiclock, 0.0)
        [outuname, entity_ceoutput] = hdlnewsignal(hdlgetparameter('clockenableoutputname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 241 243
        hdladdoutportsignal(entity_ceoutput);
    end
    % 244 246
    [hdl_entity_ports, hdl_entity_portdecls] = hdlentityports;
    % 246 248
    hdladdtoentitylist('filter', nname, hdl_entity_ports, hdlentityportnames);
    % 248 256
    % 249 256
    % 250 256
    % 251 256
    % 252 256
    % 253 256
    % 254 256
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        hdl_arch_comment = hdl_entity_comment;
    else
        hdl_arch_comment = hdldefarchheader(nname);
    end
    % 260 262
    disp(sprintf('%s', hdlcodegenmsgs(2.0)));
    disp(sprintf('%s', hdlcodegenmsgs(3.0)));
    disp(sprintf('%s', hdlcodegenmsgs(4.0)));
    % 264 270
    % 265 270
    % 266 270
    % 267 270
    % 268 270
    hdlsetparameter('filter_excess_latency', 0.0);
    % 270 277
    % 271 277
    % 272 277
    % 273 277
    % 274 277
    % 275 277
    if eq(hdlgetparameter('filter_registered_input'), 1.0)
        decodeval = 1.0;
    else
        decodeval = 0.0;
    end
    % 281 284
    % 282 284
    countsize = max(2.0, ceil(log2(phases)));
    [countvt, countslt] = hdlgettypesfromsizes(countsize, 0.0, 0.0);
    % 285 287
    [tempname, counter_out] = hdlnewsignal('cur_count', 'filter', -1.0, 0.0, 0.0, countvt, countslt);
    hdlregsignal(counter_out);
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(counter_out));
    [tempprocessbody, ce_out_temp] = hdlcounter(counter_out, phases, 'ce_output', 1.0, 0.0, decodeval);
    hdladdclockenablesignal(ce_out_temp);
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_temp));
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
    % 293 295
    if eq(multiclock, 0.0)
        % 295 299
        % 296 299
        % 297 299
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Generation ------------------\n\n');
        % 299 306
        % 300 306
        % 301 306
        % 302 306
        % 303 306
        % 304 306
        if eq(hdlgetparameter('filter_registered_output'), 1.0)
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Register ------------------\n\n');
            % 307 311
            % 308 311
            % 309 311
            [tempname, ce_out_reg] = hdlnewsignal('ce_out_reg', 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
            hdlregsignal(ce_out_reg);
            hdladdclockenablesignal(ce_out_reg);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_reg));
            % 314 317
            % 315 317
            temp_enable = hdlgetcurrentclockenable;
            hdlsetcurrentclockenable([]);
            [tempprocessbody, tempsignal] = hdlunitdelay(ce_out_temp, ce_out_reg, 'ce_output_register', 0.0);
            hdlsetcurrentclockenable(temp_enable);
            % 320 322
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
            hdl_arch_signals = horzcat(hdl_arch_signals, tempsignal);
        else
            % 324 326
            ce_out_reg = ce_out_temp;
        end
        % 327 329
        [tempbody, tempsignals] = hdlfinalassignment(ce_out_reg, entity_ceoutput);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    end
    % 332 338
    % 333 338
    % 334 338
    % 335 338
    % 336 338
    coeffs_table = zeros(size(polycoeffs));
    for n=1.0:size(polycoeffs, 1.0)
        for m=1.0:size(polycoeffs, 2.0)
            coeffname = hdllegalnamersvd(horzcat(hdlgetparameter('filter_coeff_name'), 'phase', num2str(n), '_', num2str(m)));
            % 341 343
            [uname, ptr] = hdlnewsignal(coeffname, 'filter', -1.0, 0.0, 0.0, coeffsvtype, coeffssltype);
            coeffs_table(n, m) = ptr;
            hdl_arch_constants = horzcat(hdl_arch_constants, makehdlconstantdecl(ptr, hdlconstantvalue(polycoeffs(n, m), coeffsvsize, coeffsvbp, coeffssigned)));
            % 345 348
            % 346 348
        end % for
    end % for
    % 349 355
    % 350 355
    % 351 355
    % 352 355
    % 353 355
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ---------------- Input Registers ----------------\n\n');
    % 355 357
    if eq(hdlgetparameter('filter_registered_input'), 0.0)
        inputlen = minus(phases, 1.0);
        phasecount = mod(-1.0, phases);
    else
        inputlen = phases;
        phasecount = 0.0;
    end
    % 363 365
    if hdlgetparameter('isvhdl') && gt(inputlen, 1.0)
        hdl_arch_typedefs = horzcat(hdl_arch_typedefs, '  TYPE input_pipeline_type IS ARRAY (NATURAL range <>) OF ', reginputvtype, '; -- ', reginputsltype, '\n');
        % 366 369
        % 367 369
        input_vector_vtype = horzcat('input_pipeline_type(0 TO ', num2str(minus(inputlen, 1.0)), ')');
    else
        input_vector_vtype = reginputvtype;
    end
    % 372 374
    if eq(inputlen, 1.0)
        invectsize = 0.0;
    else
        invectsize = horzcat(inputlen, 0.0);
    end
    % 378 381
    % 379 381
    [uname, input_muxes_vect] = hdlnewsignal('input_mux', 'filter', -1.0, 0.0, invectsize, input_vector_vtype, reginputsltype);
    % 381 383
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(input_muxes_vect));
    if gt(inputlen, 1.0)
        input_muxes = hdlexpandvectorsignal(input_muxes_vect);
    else
        input_muxes = input_muxes_vect;
    end
    % 388 390
    [uname, input_pipe_out] = hdlnewsignal('input_pipeline', 'filter', -1.0, 0.0, invectsize, input_vector_vtype, reginputsltype);
    % 390 392
    hdlregsignal(input_pipe_out);
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(input_pipe_out));
    if gt(inputlen, 1.0)
        reginput = hdlexpandvectorsignal(input_pipe_out);
    else
        reginput = input_pipe_out;
    end
    % 398 400
    for n=1.0:inputlen
        tempbody = hdlmux(horzcat(entity_input, reginput(n)), input_muxes(n), counter_out, {'='}, phasecount, 'when-else');
        % 401 403
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        phasecount = mod(minus(phasecount, 1.0), phases);
    end % for
    % 405 407
    [tempbody, tempsignals] = hdlunitdelay(input_muxes_vect, input_pipe_out, horzcat('input_pipeline', hdlgetparameter('clock_process_label'), num2str(n)), 0.0);
    % 407 410
    % 408 410
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    % 411 413
    if eq(hdlgetparameter('filter_registered_input'), 0.0)
        if not(strcmpi(reginputvtype, inputvtype)) || not(strcmp(reginputsltype, inputsltype))
            [uname, entity_input_type_conv] = hdlnewsignal(horzcat(inuname, '_regtype'), 'filter', -1.0, 0.0, 0.0, reginputvtype, reginputsltype);
            % 415 417
            hdlregsignal(entity_input_type_conv);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(entity_input_type_conv));
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(entity_input, entity_input_type_conv, outputrounding, outputsaturation));
        else
            % 420 423
            % 421 423
            % 422 424
            entity_input_type_conv = entity_input;
        end
        reginput = horzcat(entity_input_type_conv, reginput);
    end
    % 427 429
    delaylen = ceil(minus(mrdivide(firlen, phases), 1.0));
    % 429 435
    % 430 435
    % 431 435
    % 432 435
    % 433 435
    polymap = zeros(size(polycoeffs));
    pu = {};
    fidx = {};
    for n=1.0:size(polycoeffs, 1.0)
        [pu{n}, fidx{n}, polymap(n, :)] = unique(polycoeffs(n, :));
        polycoeffs(n, setdiff(1.0:size(polycoeffs, 2.0), fidx{n})) = 0.0;
    end % for
    % 441 443
    prodlist = zeros(size(coeffs_table));
    for n=1.0:size(coeffs_table, 1.0)
        for m=1.0:size(coeffs_table, 2.0)
            coeffn = coeffs_table(n, m);
            [prodlist(n, m), prodbody, prodsignals, prodtempsignals] = hdlcoeffmultiply(reginput(n), polycoeffs(n, m), coeffn, horzcat('product_phase', num2str(n), '_', num2str(m)), productvtype, productsltype, productrounding, productsaturation);
            % 447 452
            % 448 452
            % 449 452
            % 450 452
            hdl_arch_signals = horzcat(hdl_arch_signals, prodsignals, prodtempsignals);
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, prodbody);
        end % for
    end % for
    % 455 461
    % 456 461
    % 457 461
    % 458 461
    % 459 461
    for n=1.0:phases
        tmp = prodlist(n, fidx{n});
        prodlist(n, :) = tmp(polymap(n, :));
    end % for
    % 464 470
    % 465 470
    % 466 470
    % 467 470
    % 468 470
    polyadd = zeros(1.0, size(prodlist, 2.0));
    for m=1.0:size(prodlist, 2.0)
        % 471 473
        last = 0.0;
        lastn = 0.0;
        for n=1.0:size(prodlist, 1.0)
            if ne(prodlist(n, m), 0.0)
                last = prodlist(n, m);
                lastn = n;
                break
            end
        end % for
        if ne(last, 0.0)
            for n=plus(lastn, 1.0):size(prodlist, 1.0)
                if ne(prodlist(n, m), 0.0)
                    [uname, polyadd(m)] = hdlnewsignal(horzcat('polyadd_', num2str(m)), 'filter', -1.0, 0.0, 0.0, polysumvtype, polysumsltype);
                    % 485 487
                    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(polyadd(m)));
                    [tempbody, tempsignals] = hdlfilteradd(last, prodlist(n, m), polyadd(m), sumrounding, sumsaturation);
                    % 488 490
                    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
                    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
                    last = polyadd(m);
                end
            end % for
            if ne(last, polyadd(m))
                if eq(last, prodlist(lastn, m))
                    [uname, polyadd(m)] = hdlnewsignal(horzcat('polyadd_', num2str(m)), 'filter', -1.0, 0.0, 0.0, polysumvtype, polysumsltype);
                    % 497 499
                    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(polyadd(m)));
                    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(last, polyadd(m), sumrounding, sumsaturation));
                else
                    % 501 503
                    polyadd(m) = last;
                end
            end
        end
    end % for
    % 507 509
    prodlist = polyadd;
    % 509 515
    % 510 515
    % 511 515
    % 512 515
    % 513 515
    if hdlgetparameter('isvhdl') && ne(delaylen, 0.0)
        hdl_arch_typedefs = horzcat(hdl_arch_typedefs, '  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF ', storagevtype, '; -- ', storagesltype, '\n');
        % 516 519
        % 517 519
        delay_vector_vtype = horzcat('delay_pipeline_type(0 TO ', num2str(minus(delaylen, 1.0)), ')');
        delayvect = horzcat(delaylen, 0.0);
    else
        if eq(delaylen, 0.0)
            delay_vector_vtype = storagevtype;
            delayvect = 0.0;
        else
            delay_vector_vtype = storagevtype;
            delayvect = horzcat(delaylen, 0.0);
        end
    end
    [uname, delay_pipe_out] = hdlnewsignal('delay_pipeline', 'filter', -1.0, 0.0, delayvect, delay_vector_vtype, storagesltype);
    hdlregsignal(delay_pipe_out);
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(delay_pipe_out));
    % 532 535
    % 533 535
    [uname, sumvector_out] = hdlnewsignal('sumvector', 'filter', -1.0, 0.0, delayvect, delay_vector_vtype, storagesltype);
    % 535 537
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(sumvector_out));
    % 537 539
    delay_pipe_in = sumvector_out;
    % 539 542
    % 540 542
    if eq(multiclock, 0.0)
        saved_ce = hdlgetcurrentclockenable;
        hdlsetcurrentclockenable(ce_out_temp);
    else
        saved_ce = hdlgetcurrentclockenable;
        saved_clk = hdlgetcurrentclock;
        saved_rst = hdlgetcurrentreset;
        hdlsetcurrentclockenable(clken1);
        hdlsetcurrentclock(clk1);
        hdlsetcurrentreset(reset1);
    end
    % 552 554
    [tempbody, tempsignals] = hdlunitdelay(delay_pipe_in, delay_pipe_out, horzcat('Delay_Pipeline', hdlgetparameter('clock_process_label')), 0.0);
    % 554 557
    % 555 557
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    % 558 560
    delaylist = hdlexpandvectorsignal(delay_pipe_out);
    sumlist = hdlexpandvectorsignal(sumvector_out);
    % 561 569
    % 562 569
    % 563 569
    % 564 569
    % 565 569
    % 566 569
    % 567 569
    [uname, final_result] = hdlnewsignal('finalsum', 'filter', -1.0, 0.0, 0.0, sumvtype, sumsltype);
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(final_result));
    % 570 572
    if gt(length(prodlist), 1.0)
        % 572 574
        if ne(prodlist(1.0), 0.0)
            [tempbody, tempsignals] = hdlfilteradd(prodlist(1.0), delaylist(1.0), final_result, sumrounding, sumsaturation);
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
            hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        else
            tempbody = hdldatatypeassignment(delaylist(1.0), final_result, sumrounding, sumsaturation);
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        end
        % 581 583
        for n=1.0:minus(delaylen, 1.0)
            prod_elem = prodlist(plus(n, 1.0));
            delay_elem = delaylist(plus(n, 1.0));
            sumout = sumlist(n);
            if ne(prod_elem, 0.0)
                [tempbody, tempsignals] = hdlfilteradd(prod_elem, delay_elem, sumout, sumrounding, sumsaturation);
                hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
                hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
            else
                tempbody = hdldatatypeassignment(delay_elem, sumout, sumrounding, sumsaturation);
                hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
            end
        end % for
    else
        tempbody = hdldatatypeassignment(sumlist(end), final_result, sumrounding, sumsaturation);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    end
    % 599 602
    % 600 602
    if ne(prodlist(end), 0.0)
        tempbody = hdldatatypeassignment(prodlist(end), sumlist(end), sumrounding, sumsaturation);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    else
        [uname, constzero] = hdlnewsignal('constzero', 'filter', -1.0, 0.0, 0.0, sumvtype, sumsltype);
        hdl_arch_constants = horzcat(hdl_arch_constants, makehdlconstantdecl(constzero, hdlconstantvalue(0.0, sumsize, 0.0, sumsigned)));
        % 607 609
        tempbody = hdldatatypeassignment(constzero, sumlist(end), 'floor', 0.0);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    end
    % 611 615
    % 612 615
    % 613 615
    if not(strcmpi(outputvtype, sumvtype)) || not(strcmp(outputsltype, sumsltype)) || any(ne(horzcat(outputsize, outputbp, outputsigned), horzcat(sumsize, sumbp, sumsigned))) || not(strcmpi(outputrounding, sumrounding)) || ne(outputsaturation, sumsaturation)
        % 615 621
        % 616 621
        % 617 621
        % 618 621
        % 619 621
        [castname, cast_result] = hdlnewsignal('output_typeconvert', 'filter', -1.0, 0.0, 0.0, castvtype, castsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(cast_result));
        % 622 624
        tempbody = hdldatatypeassignment(final_result, cast_result, outputrounding, outputsaturation);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    else
        cast_result = final_result;
    end
    % 628 633
    % 629 633
    % 630 633
    % 631 633
    if eq(hdlgetparameter('filter_registered_output'), 1.0)
        [outputregname, outputreg] = hdlnewsignal('output_register', 'filter', -1.0, 0.0, 0.0, castvtype, castsltype);
        hdlregsignal(outputreg);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(outputreg));
        [tempbody, tempsignals] = hdlunitdelay(cast_result, outputreg, horzcat('output_register', hdlgetparameter('clock_process_label')), 0.0);
        % 637 639
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        final_result = outputreg;
    else
        final_result = cast_result;
    end
    % 644 646
    [tempbody, tempsignals] = hdlfinalassignment(final_result, entity_output);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    % 648 651
    % 649 651
    if eq(multiclock, 0.0)
        hdlsetcurrentclockenable(saved_ce);
    else
        % 653 655
        hdlsetcurrentclockenable(saved_ce);
        hdlsetcurrentclock(saved_clk);
        hdlsetcurrentreset(saved_rst);
    end
    % 658 668
    % 659 668
    % 660 668
    % 661 668
    % 662 668
    % 663 668
    % 664 668
    % 665 668
    % 666 668
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        hdl_entity_library = horzcat(hdl_entity_library, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n\n');
    else
        hdl_entity_library = horzcat(hdl_entity_library, '\n');
    end
    % 672 674
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix')));
        % 675 678
        % 676 678
        archfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix')));
        % 678 681
        % 679 681
        opentype = 'w';
    else
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('filename_suffix')));
        archfilename = entityfilename;
        opentype = 'a';
    end
    % 686 688
    entityfid = fopen(entityfilename, 'w');
    % 688 690
    if eq(entityfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', entityfilename);
    end
    % 692 694
    hdl_entity = horzcat(hdl_entity_comment, hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_ports, hdl_entity_portdecls, hdl_entity_end);
    % 694 702
    % 695 702
    % 696 702
    % 697 702
    % 698 702
    % 699 702
    % 700 702
    fprintf(entityfid, hdl_entity);
    fclose(entityfid);
    % 703 705
    archfid = fopen(archfilename, opentype);
    if eq(archfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', archfilename);
    end
    % 708 710
    hdl_arch = horzcat(hdl_arch_comment, hdl_arch_decl, hdl_arch_component_decl, hdl_arch_component_config, hdl_arch_functions, hdl_arch_typedefs, hdl_arch_constants, hdl_arch_signals, hdl_arch_begin, hdl_arch_body_component_instances, hdl_arch_body_blocks, hdl_arch_body_output_assignments, hdl_arch_end);
    % 710 723
    % 711 723
    % 712 723
    % 713 723
    % 714 723
    % 715 723
    % 716 723
    % 717 723
    % 718 723
    % 719 723
    % 720 723
    % 721 723
    fprintf(archfid, hdl_arch);
    fclose(archfid);
    disp(sprintf('%s', hdlcodegenmsgs(7.0, hdlfilterlatency(filterobj))));
end
function [size, bp, signed, vtype, sltype] = setfordouble
    % 727 729
    size = 0.0;
    bp = 0.0;
    signed = true;
    vtype = 'real';
    sltype = 'double';
end
function [size, bp, signed, vtype, sltype] = setportfordouble
    % 735 738
    % 736 738
    size = 0.0;
    bp = 0.0;
    signed = true;
    if hdlgetparameter('isverilog')
        vtype = 'wire [63:0]';
    else
        vtype = 'real';
    end
    sltype = 'double';
end
