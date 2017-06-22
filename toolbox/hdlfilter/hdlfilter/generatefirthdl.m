function generatefirthdl(filterobj)
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
    switch lower(class(filterobj))
    case 'dfilt.dffirt'
        arithtype = get(filterobj, 'Arithmetic');
        switch arithtype
        case 'double'
            arithisdouble = true;
        case 'fixed'
            arithisdouble = false;
        otherwise
            error(generatemsgid('unsupportedarithmetic'), 'HDL generation for this object with Arithmetic (%s) is not supported.', arithtype);
            % 26 29
            % 27 29
        end
        structure = class(filterobj);
        coeffs = coefficients(filterobj);
        coeffs = coeffs{1.0};
        firlen = length(coeffs);
        internalstructure = 'firt';
    otherwise
        error(generatemsgid('unsupportedarch'), 'Object class (%s) is not supported by generatefirthdl.', class(filterobj));
        % 36 39
        % 37 39
    end
    % 39 41
    oddtaps = mod(firlen, 2.0);
    szfirlen = size(firlen);
    % 42 44
    if ne(szfirlen(1.0), 1.0) || ne(szfirlen(2.0), 1.0)
        error(generatemsgid('multisectionfir'), horzcat('HDL code generation is not supported for multisection ', upper(structure), ' filters.'));
        % 45 47
    end
    % 47 49
    if eq(firlen, 1.0)
        error(generatemsgid('zero_order'), 'Cannot generate HDL for a zero order FIRT.');
    end
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    inputrounding = 'round';
    inputsaturation = true;
    % 60 62
    if arithisdouble
        [coeffsvsize, coeffsvbp, coeffssigned, coeffsvtype, coeffssltype] = setfordouble;
        [inputsize, inputbp, inputsigned, inputvtype, inputsltype] = setportfordouble;
        [reginputsize, reginputbp, reginputsigned, reginputvtype, reginputsltype] = setfordouble;
        [storagesize, storagebp, storagesigned, storagevtype, storagesltype] = setfordouble;
        [outputsize, outputbp, outputsigned, outputvtype, outputsltype] = setportfordouble;
        [castsize, castbp, castsigned, castvtype, castsltype] = setfordouble;
        [productsize, productbp, productsigned, productvtype, productsltype] = setfordouble;
        [sumsize, sumbp, sumsigned, sumvtype, sumsltype] = setfordouble;
        [outputrounding, productrounding, sumrounding] = deal('floor');
        [outputsaturation, productsaturation, sumsaturation] = deal(false);
    else
        filtersettings = get(filterobj);
        % 74 76
        coeffssigned = filtersettings.Signed;
        % 76 78
        [inputsigned, outputsigned, productsigned, sumsigned] = deal(true);
        % 78 80
        switch lower(get(filterobj, 'OverflowMode'))
        case 'saturate'
            [outputsaturation, productsaturation, sumsaturation] = deal(true);
        otherwise
            [outputsaturation, productsaturation, sumsaturation] = deal(false);
        end
        % 85 87
        rmode = get(filterobj, 'RoundMode');
        [outputrounding, productrounding, sumrounding] = deal(rmode);
        % 88 90
        coeffsvsize = filtersettings.CoeffWordLength;
        coeffsvbp = filtersettings.NumFracLength;
        [coeffsvtype, coeffssltype] = hdlgettypesfromsizes(coeffsvsize, coeffsvbp, coeffssigned);
        % 92 94
        inputsize = filtersettings.InputWordLength;
        inputbp = filtersettings.InputFracLength;
        if eq(hdlgetparameter('filter_input_type_std_logic'), 1.0)
            [inputvtype, inputsltype] = hdlgetporttypesfromsizes(inputsize, inputbp, inputsigned);
        else
            [inputvtype, inputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        end
        reginputsize = filtersettings.InputWordLength;
        reginputbp = filtersettings.InputFracLength;
        [reginputvtype, reginputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        % 103 105
        outputsize = filtersettings.OutputWordLength;
        outputbp = filtersettings.OutputFracLength;
        if eq(hdlgetparameter('filter_output_type_std_logic'), 1.0)
            [outputvtype, outputsltype] = hdlgetporttypesfromsizes(outputsize, outputbp, outputsigned);
        else
            [outputvtype, outputsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        end
        castsize = outputsize;
        castbp = outputbp;
        castsigned = outputsigned;
        [castvtype, castsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        % 115 117
        productsize = filtersettings.ProductWordLength;
        productbp = filtersettings.ProductFracLength;
        [productvtype, productsltype] = hdlgettypesfromsizes(productsize, productbp, productsigned);
        sumsize = filtersettings.AccumWordLength;
        sumbp = filtersettings.AccumFracLength;
        [sumvtype, sumsltype] = hdlgettypesfromsizes(sumsize, sumbp, sumsigned);
        % 122 124
        storagesize = filtersettings.StateWordLength;
        storagebp = filtersettings.StateFracLength;
        storagesigned = sumsigned;
        [storagevtype, storagesltype] = hdlgettypesfromsizes(storagesize, storagebp, storagesigned);
    end
    % 128 131
    % 129 131
    if not(isreal(coeffs))
        error(generatemsgid('complexnotsupported'), 'Complex filters are not supported!');
    end
    % 133 136
    % 134 136
    sym = signalpolyutils('symmetrytest', coeffs);
    % 136 138
    nname = hdlgetparameter('filter_name');
    if isempty(nname)
        nname = 'filter';
    end
    % 141 143
    disp(sprintf('%s', hdlcodegenmsgs(1.0)));
    % 143 146
    % 144 146
    hdl_entity_comment = hdlentitycomment(nname, hdlgetparameter('rcs_cvs_tag'), info(filterobj), hdlgetparameter('comment_char'));
    % 146 149
    % 147 149
    indentedcomment = horzcat('  ', hdlgetparameter('comment_char'), ' ');
    % 149 152
    % 150 152
    hdl_arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdl_arch_typedefs = horzcat(indentedcomment, 'Type Definitions\n');
    hdl_arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdl_arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdl_arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdl_arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    % 157 159
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
            % 184 187
            % 185 187
        end
    end
    % 188 194
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    [clkuname, clk] = hdlnewsignal(hdlgetparameter('clockname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 194 196
    hdladdinportsignal(clk);
    hdladdclocksignal(clk);
    hdlsetcurrentclock(clk);
    % 198 200
    [clkenuname, clken] = hdlnewsignal(hdlgetparameter('clockenablename'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 200 202
    hdladdinportsignal(clken);
    hdladdclockenablesignal(clken);
    hdlsetcurrentclockenable(clken);
    [rstuname, reset] = hdlnewsignal(hdlgetparameter('resetname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 205 207
    hdladdinportsignal(reset);
    hdladdresetsignal(reset);
    hdlsetcurrentreset(reset);
    [inuname, entity_input] = hdlnewsignal(hdlgetparameter('filter_input_name'), 'filter', -1.0, 0.0, 0.0, inputvtype, inputsltype);
    % 210 213
    % 211 213
    hdladdinportsignal(entity_input);
    % 213 215
    [outuname, entity_output] = hdlnewsignal(hdlgetparameter('filter_output_name'), 'filter', -1.0, 0.0, 0.0, outputvtype, outputsltype);
    % 215 217
    hdladdoutportsignal(entity_output);
    % 217 219
    [hdl_entity_ports, hdl_entity_portdecls] = hdlentityports;
    % 219 221
    hdladdtoentitylist('filter', nname, hdl_entity_ports, hdlentityportnames);
    % 221 229
    % 222 229
    % 223 229
    % 224 229
    % 225 229
    % 226 229
    % 227 229
    disp(sprintf('%s', hdlcodegenmsgs(2.0)));
    disp(sprintf('%s', hdlcodegenmsgs(3.0)));
    disp(sprintf('%s', hdlcodegenmsgs(4.0)));
    % 231 237
    % 232 237
    % 233 237
    % 234 237
    % 235 237
    hdlsetparameter('filter_excess_latency', 0.0);
    % 237 243
    % 238 243
    % 239 243
    % 240 243
    % 241 243
    coeff_len = length(coeffs);
    % 243 245
    coeffs_table = [];
    for n=1.0:coeff_len
        coeffname = hdllegalnamersvd(horzcat(hdlgetparameter('filter_coeff_name'), num2str(n)));
        [uname, ptr] = hdlnewsignal(coeffname, 'filter', -1.0, 0.0, 0.0, coeffsvtype, coeffssltype);
        coeffs_table = horzcat(coeffs_table, ptr);
        hdl_arch_constants = horzcat(hdl_arch_constants, makehdlconstantdecl(ptr, hdlconstantvalue(coeffs(n), coeffsvsize, coeffsvbp, coeffssigned)));
        % 250 253
        % 251 253
    end % for
    % 253 259
    % 254 259
    % 255 259
    % 256 259
    % 257 259
    if eq(hdlgetparameter('filter_registered_input'), 1.0)
        [uname, reginput] = hdlnewsignal('inputreg', 'filter', -1.0, 0.0, 0.0, reginputvtype, reginputsltype);
        hdlregsignal(reginput);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(reginput));
        % 262 264
        [tempbody, tempsignals] = hdlunitdelay(entity_input, reginput, horzcat('input_reg', hdlgetparameter('clock_process_label')), 0.0);
        % 264 266
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    else
        if not(strcmpi(reginputvtype, inputvtype)) || not(strcmp(reginputsltype, inputsltype))
            % 269 271
            [uname, entity_input_type_conv] = hdlnewsignal(horzcat(inuname, '_regtype'), 'filter', -1.0, 0.0, 0.0, reginputvtype, reginputsltype);
            % 271 273
            hdlregsignal(entity_input_type_conv);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(entity_input_type_conv));
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(entity_input, entity_input_type_conv, inputrounding, inputsaturation));
            % 275 279
            % 276 279
            % 277 279
            reginput = entity_input_type_conv;
        else
            % 280 282
            reginput = entity_input;
        end
    end
    % 284 286
    delaylen = minus(firlen, 1.0);
    % 286 290
    % 287 290
    % 288 290
    if hdlgetparameter('isvhdl')
        hdl_arch_typedefs = horzcat(hdl_arch_typedefs, '  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF ', storagevtype, '; -- ', storagesltype, '\n');
        % 291 294
        % 292 294
        delay_vector_vtype = horzcat('delay_pipeline_type(0 TO ', num2str(minus(delaylen, 1.0)), ')');
    else
        delay_vector_vtype = storagevtype;
    end
    % 297 299
    [uname, delay_pipe_out] = hdlnewsignal('delay_pipeline', 'filter', -1.0, 0.0, horzcat(delaylen, 0.0), delay_vector_vtype, storagesltype);
    hdlregsignal(delay_pipe_out);
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(delay_pipe_out));
    % 301 303
    if strcmpi(storagesltype, sumsltype)
        [uname, sumvector_out] = hdlnewsignal('sumvector', 'filter', -1.0, 0.0, horzcat(delaylen, 0.0), delay_vector_vtype, storagesltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(sumvector_out));
        % 305 307
        delay_pipe_in = sumvector_out;
    else
        % 308 310
        if hdlgetparameter('isvhdl')
            hdl_arch_typedefs = horzcat(hdl_arch_typedefs, '  TYPE sum_vector_type IS ARRAY (NATURAL range <>) OF ', sumvtype, '; -- ', sumsltype, '\n');
            % 311 314
            % 312 314
            sum_vector_vtype = horzcat('sum_vector_type(0 TO ', num2str(minus(delaylen, 1.0)), ')');
        else
            sum_vector_vtype = sumvtype;
        end
        [uname, sumvector_out] = hdlnewsignal('sumvector', 'filter', -1.0, 0.0, horzcat(delaylen, 0.0), sum_vector_vtype, sumsltype);
        % 318 320
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(sumvector_out));
        % 320 322
        [uname, delay_pipe_in] = hdlnewsignal('delay_pipeline_in', 'filter', -1.0, 0.0, horzcat(delaylen, 0.0), delay_vector_vtype, storagesltype);
        % 322 324
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(delay_pipe_in));
        % 324 326
        tempbody = hdldatatypeassignment(sumvector_out, delay_pipe_in, sumrounding, sumsaturation);
        % 326 328
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    end
    % 329 331
    [tempbody, tempsignals] = hdlunitdelay(delay_pipe_in, delay_pipe_out, horzcat('Delay_Pipeline', hdlgetparameter('clock_process_label')), 0.0);
    % 331 334
    % 332 334
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    % 335 337
    delaylist = hdlexpandvectorsignal(delay_pipe_out);
    sumlist = hdlexpandvectorsignal(sumvector_out);
    % 338 345
    % 339 345
    % 340 345
    % 341 345
    % 342 345
    % 343 345
    optimcoeffs = coeffs;
    if hdlgetparameter('bit_true_to_filter')
        % 346 348
        if eq(productsize, plus(coeffsvsize, inputsize)) && eq(productbp, plus(coeffsvbp, inputbp))
            [pu, fidx, polymap] = unique(abs(optimcoeffs));
        else
            [pu, fidx, polymap] = unique(optimcoeffs);
        end
    else
        [pu, fidx, polymap] = unique(abs(optimcoeffs));
    end
    % 355 357
    optimcoeffs(setdiff(1.0:length(optimcoeffs), fidx)) = 0.0;
    % 357 359
    prodlist = [];
    for n=1.0:length(coeffs_table)
        coeffn = coeffs_table(n);
        [prodout, prodbody, prodsignals, prodtempsignals] = hdlcoeffmultiply(reginput, optimcoeffs(n), coeffn, horzcat('product', num2str(n)), productvtype, productsltype, productrounding, productsaturation);
        % 362 367
        % 363 367
        % 364 367
        % 365 367
        prodlist = horzcat(prodlist, prodout);
        % 367 369
        hdl_arch_signals = horzcat(hdl_arch_signals, prodsignals, prodtempsignals);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, prodbody);
    end % for
    % 371 377
    % 372 377
    % 373 377
    % 374 377
    % 375 377
    if hdlgetparameter('filter_pipelined')
        hdlsetparameter('filter_excess_latency', plus(hdlgetparameter('filter_excess_latency'), 1.0));
        % 378 380
        pipeout = zeros(1.0, length(prodlist));
        for n=1.0:length(prodlist)
            if ne(prodlist(n), 0.0)
                [tempname, temppipe] = hdlnewsignal(horzcat('product_pipeline', num2str(n)), 'filter', -1.0, 0.0, 0.0, hdlsignalvtype(prodlist(n)), hdlsignalsltype(prodlist(n)));
                % 383 387
                % 384 387
                % 385 387
                hdlregsignal(temppipe);
                pipeout(n) = temppipe;
                hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(temppipe));
            end
        end % for
        % 391 393
        [tempbody, tempsignals] = hdlunitdelay(prodlist(ne(prodlist, 0.0)), pipeout(ne(pipeout, 0.0)), horzcat('product_pipeline', hdlgetparameter('clock_process_label'), num2str(n)), zeros(1.0, length(prodlist(ne(prodlist, 0.0)))));
        % 393 396
        % 394 396
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 397 399
        prodlist = pipeout;
    end
    % 400 402
    tmp = prodlist(fidx);
    tmpc = optimcoeffs(fidx);
    prodlist = tmp(polymap);
    tmpc = tmpc(polymap);
    minuslist = find(ne(tmpc, coeffs));
    for n=minuslist
        if ne(prodlist(n), 0.0)
            [uname, minusprod] = hdlnewsignal(horzcat('negproduct', num2str(n)), 'filter', -1.0, 0.0, 0.0, productvtype, productsltype);
            % 409 411
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(minusprod));
            [tempbody, tempsignals] = hdlfilterunaryminus(prodlist(n), minusprod, productrounding, productsaturation);
            % 412 414
            hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
            prodlist(n) = minusprod;
        end
    end % for
    % 418 424
    % 419 424
    % 420 424
    % 421 424
    % 422 424
    [uname, final_result] = hdlnewsignal('finalsum', 'filter', -1.0, 0.0, 0.0, sumvtype, sumsltype);
    hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(final_result));
    % 425 428
    % 426 428
    if ne(prodlist(1.0), 0.0)
        [tempbody, tempsignals] = hdlfilteradd(prodlist(1.0), delaylist(1.0), final_result, sumrounding, sumsaturation);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    else
        tempbody = hdldatatypeassignment(delaylist(1.0), final_result, sumrounding, sumsaturation);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    end
    % 435 437
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
    % 449 451
    if ne(prodlist(end), 0.0)
        tempbody = hdldatatypeassignment(prodlist(end), sumlist(end), sumrounding, sumsaturation);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    else
        [uname, constzero] = hdlnewsignal('constzero', 'filter', -1.0, 0.0, 0.0, sumvtype, sumsltype);
        hdl_arch_constants = horzcat(hdl_arch_constants, makehdlconstantdecl(constzero, hdlconstantvalue(0.0, sumsize, 0.0, sumsigned)));
        % 456 458
        tempbody = hdldatatypeassignment(constzero, sumlist(end), 'floor', 0.0);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    end
    % 460 464
    % 461 464
    % 462 464
    if not(strcmpi(outputvtype, sumvtype)) || not(strcmp(outputsltype, sumsltype)) || any(ne(horzcat(outputsize, outputbp, outputsigned), horzcat(sumsize, sumbp, sumsigned))) || not(strcmpi(outputrounding, sumrounding)) || ne(outputsaturation, sumsaturation)
        % 464 470
        % 465 470
        % 466 470
        % 467 470
        % 468 470
        [castname, cast_result] = hdlnewsignal('output_typeconvert', 'filter', -1.0, 0.0, 0.0, castvtype, castsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(cast_result));
        % 471 473
        tempbody = hdldatatypeassignment(final_result, cast_result, outputrounding, outputsaturation);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    else
        cast_result = final_result;
    end
    % 477 482
    % 478 482
    % 479 482
    % 480 482
    if eq(hdlgetparameter('filter_registered_output'), 1.0)
        [outputregname, outputreg] = hdlnewsignal('output_register', 'filter', -1.0, 0.0, 0.0, castvtype, castsltype);
        hdlregsignal(outputreg);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(outputreg));
        [tempbody, tempsignals] = hdlunitdelay(cast_result, outputreg, horzcat('output_register', hdlgetparameter('clock_process_label')), 0.0);
        % 486 488
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        final_result = outputreg;
    else
        final_result = cast_result;
    end
    % 493 495
    [tempbody, tempsignals] = hdlfinalassignment(final_result, entity_output);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    % 497 507
    % 498 507
    % 499 507
    % 500 507
    % 501 507
    % 502 507
    % 503 507
    % 504 507
    % 505 507
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        hdl_entity_library = horzcat(hdl_entity_library, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n\n');
    else
        hdl_entity_library = horzcat(hdl_entity_library, '\n');
    end
    % 511 513
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix')));
        % 514 517
        % 515 517
        archfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix')));
        % 517 520
        % 518 520
        opentype = 'w';
    else
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('filename_suffix')));
        archfilename = entityfilename;
        opentype = 'a';
    end
    % 525 527
    entityfid = fopen(entityfilename, 'w');
    % 527 529
    if eq(entityfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', entityfilename);
    end
    % 531 533
    hdl_entity = horzcat(hdl_entity_comment, hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_ports, hdl_entity_portdecls, hdl_entity_end);
    % 533 541
    % 534 541
    % 535 541
    % 536 541
    % 537 541
    % 538 541
    % 539 541
    fprintf(entityfid, hdl_entity);
    fclose(entityfid);
    % 542 544
    archfid = fopen(archfilename, opentype);
    if eq(archfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', archfilename);
    end
    % 547 549
    hdl_arch = horzcat(hdl_arch_comment, hdl_arch_decl, hdl_arch_component_decl, hdl_arch_component_config, hdl_arch_functions, hdl_arch_typedefs, hdl_arch_constants, hdl_arch_signals, hdl_arch_begin, hdl_arch_body_component_instances, hdl_arch_body_blocks, hdl_arch_body_output_assignments, hdl_arch_end);
    % 549 562
    % 550 562
    % 551 562
    % 552 562
    % 553 562
    % 554 562
    % 555 562
    % 556 562
    % 557 562
    % 558 562
    % 559 562
    % 560 562
    fprintf(archfid, hdl_arch);
    fclose(archfid);
    disp(sprintf('%s', hdlcodegenmsgs(7.0)));
end
function [size, bp, signed, vtype, sltype] = setfordouble
    % 566 568
    size = 0.0;
    bp = 0.0;
    signed = true;
    vtype = 'real';
    sltype = 'double';
end
function [size, bp, signed, vtype, sltype] = setportfordouble
    % 574 577
    % 575 577
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
