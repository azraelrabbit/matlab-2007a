function generatecicinterphdl(filterobj)
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
    if not(strcmp(filterobj.filterstructure, 'Cascaded Integrator-Comb Interpolator'))
        error(generatemsgid('noncicinterp'), 'generatecicinterphdl called with non cicinterp filter object %s.', filterobj.filterstructure);
        % 14 16
    end
    % 16 18
    bdt = hdlgetparameter('base_data_type');
    hdlsetparameter('filter_target_language', hdlgetparameter('target_language'));
    % 19 21
    hdlentitysignalsinit;
    % 21 24
    % 22 24
    numdifferentialdelay = filterobj.differentialdelay;
    numsections = filterobj.numberofsections;
    numfactor = filterobj.interpolationfactor;
    % 26 28
    inputwordlength = filterobj.inputwordlength;
    outputwordlength = filterobj.outputwordlength;
    sectionwordlength = filterobj.sectionwordlengths;
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    inputfraclength = filterobj.inputfraclength;
    outputfraclength = filterobj.outputfraclength;
    sectionfraclength = filterobj.sectionfraclengths;
    % 39 41
    roundmode = filterobj.roundmode;
    % 41 43
    overflowmode = 0.0;
    % 43 45
    signed = true;
    % 45 49
    % 46 49
    % 47 49
    inputsize = inputwordlength;
    inputbp = inputfraclength;
    if eq(hdlgetparameter('filter_input_type_std_logic'), 1.0)
        [inputvtype, inputsltype] = hdlgetporttypesfromsizes(inputsize, inputbp, signed);
    else
        [inputvtype, inputsltype] = hdlgettypesfromsizes(inputsize, inputbp, signed);
    end
    % 55 57
    [inregvtype, inregsltype] = hdlgettypesfromsizes(inputsize, inputbp, signed);
    % 57 60
    % 58 60
    outputsize = outputwordlength;
    outputbp = outputfraclength;
    if eq(hdlgetparameter('filter_output_type_std_logic'), 1.0)
        [outputvtype, outputsltype] = hdlgetporttypesfromsizes(outputsize, outputbp, signed);
    else
        [outputvtype, outputsltype] = hdlgettypesfromsizes(outputsize, outputbp, signed);
    end
    % 66 68
    [outregvtype, outregsltype] = hdlgettypesfromsizes(outputsize, outputbp, signed);
    % 68 70
    nname = hdlgetparameter('filter_name');
    if isempty(nname)
        nname = 'filter';
    end
    % 73 75
    disp(sprintf('%s', hdlcodegenmsgs(1.0)));
    % 75 78
    % 76 78
    hdl_entity_comment = hdlentitycomment(nname, hdlgetparameter('rcs_cvs_tag'), info(filterobj), hdlgetparameter('comment_char'));
    % 78 81
    % 79 81
    indentedcomment = horzcat('  ', hdlgetparameter('comment_char'), ' ');
    % 81 84
    % 82 84
    hdl_arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdl_arch_typedefs = horzcat(indentedcomment, 'Type Definitions\n');
    hdl_arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdl_arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdl_arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdl_arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    % 89 91
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
            % 116 120
            % 117 120
            % 118 120
        end
    end
    % 121 129
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    if eq(hdlgetparameter('clockinputs'), 1.0)
        multiclock = 0.0;
    else
        multiclock = 1.0;
    end
    % 133 135
    [clkuname, clk] = hdlnewsignal(hdlgetparameter('clockname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 135 137
    hdladdinportsignal(clk);
    hdladdclocksignal(clk);
    hdlsetcurrentclock(clk);
    % 139 141
    [clkenuname, clken] = hdlnewsignal(hdlgetparameter('clockenablename'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 141 143
    hdladdinportsignal(clken);
    hdladdclockenablesignal(clken);
    hdlsetcurrentclockenable(clken);
    [rstuname, reset] = hdlnewsignal(hdlgetparameter('resetname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 146 148
    hdladdinportsignal(reset);
    hdladdresetsignal(reset);
    hdlsetcurrentreset(reset);
    [inuname, entity_input] = hdlnewsignal(hdlgetparameter('filter_input_name'), 'filter', -1.0, 0.0, 0.0, inputvtype, inputsltype);
    % 151 154
    % 152 154
    hdladdinportsignal(entity_input);
    % 154 156
    if eq(multiclock, 1.0)
        [clk1uname, clk1] = hdlnewsignal(horzcat(hdlgetparameter('clockname'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 157 160
        % 158 160
        hdladdinportsignal(clk1);
        hdladdclocksignal(clk1);
        [clken1uname, clken1] = hdlnewsignal(horzcat(hdlgetparameter('clockenablename'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 162 165
        % 163 165
        hdladdinportsignal(clken1);
        hdladdclockenablesignal(clken1);
        [rst1uname, reset1] = hdlnewsignal(horzcat(hdlgetparameter('resetname'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 167 170
        % 168 170
        hdladdinportsignal(reset1);
        hdladdresetsignal(reset1);
    else
        clk1 = 0.0;
        clken1 = 0.0;
        reset1 = 0.0;
    end
    % 176 178
    [outuname, entity_output] = hdlnewsignal(hdlgetparameter('filter_output_name'), 'filter', -1.0, 0.0, 0.0, outputvtype, outputsltype);
    % 178 181
    % 179 181
    hdladdoutportsignal(entity_output);
    if eq(multiclock, 0.0)
        [outuname, entity_ceoutput] = hdlnewsignal(hdlgetparameter('clockenableoutputname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 183 185
        hdladdoutportsignal(entity_ceoutput);
    end
    % 186 188
    [hdl_entity_ports, hdl_entity_portdecls] = hdlentityports;
    % 188 190
    hdladdtoentitylist('filter', nname, hdl_entity_ports, hdlentityportnames);
    % 190 198
    % 191 198
    % 192 198
    % 193 198
    % 194 198
    % 195 198
    % 196 198
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        hdl_arch_comment = hdl_entity_comment;
    else
        hdl_arch_comment = hdldefarchheader(nname);
    end
    % 202 210
    % 203 210
    % 204 210
    % 205 210
    % 206 210
    % 207 210
    % 208 210
    disp(sprintf('%s', hdlcodegenmsgs(2.0)));
    disp(sprintf('%s', hdlcodegenmsgs(3.0)));
    disp(sprintf('%s', hdlcodegenmsgs(4.0)));
    % 212 220
    % 213 220
    % 214 220
    % 215 220
    % 216 220
    % 217 220
    % 218 220
    if eq(multiclock, 0.0)
        if eq(numfactor, 1.0)
            ce_out_reg = clken;
            ce_out_temp = clken;
        else
            % 224 229
            % 225 229
            % 226 229
            % 227 229
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Generation ------------------\n\n');
            % 229 232
            % 230 232
            decodeval = 0.0;
            % 232 234
            countsize = max(2.0, ceil(log2(numfactor)));
            [countervtype, countersltype] = hdlgettypesfromsizes(countsize, 0.0, 0.0);
            [tempname, counter_out] = hdlnewsignal('cur_count', 'filter', -1.0, 0.0, 0.0, countervtype, countersltype);
            hdlregsignal(counter_out);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(counter_out));
            [tempprocessbody, ce_out_temp] = hdlcounter(counter_out, numfactor, 'ce_output', 1.0, 0.0, decodeval);
            % 239 241
            hdladdclockenablesignal(ce_out_temp);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_temp));
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
            % 243 246
            % 244 246
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Register ------------------\n\n');
            % 246 250
            % 247 250
            % 248 250
            [tempname, ce_out_reg] = hdlnewsignal('ce_out_reg', 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
            hdlregsignal(ce_out_reg);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_reg));
            % 252 255
            % 253 255
            temp_enable = hdlgetcurrentclockenable;
            hdlsetcurrentclockenable([]);
            [tempprocessbody, tempsignal] = hdlunitdelay(ce_out_temp, ce_out_reg, 'ce_output_register', 0.0);
            % 257 259
            hdl_arch_signals = horzcat(hdl_arch_signals, tempsignal);
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
            hdlsetcurrentclockenable(temp_enable);
            % 261 263
        end
        % 263 265
        [tempbody, tempsignals] = hdlfinalassignment(ce_out_reg, entity_ceoutput);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    end
    % 268 271
    % 269 271
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
    % 281 289
    % 282 289
    % 283 289
    % 284 289
    % 285 289
    % 286 289
    % 287 289
    if eq(hdlgetparameter('filter_registered_input'), 1.0)
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Input Register ------------------\n\n');
        % 290 293
        % 291 293
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  \n');
        % 293 295
        [tempname, current_input] = hdlnewsignal('input_register', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdlregsignal(current_input);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        [tempbody, tempsignals] = hdlunitdelay(entity_input, current_input, horzcat('input_reg', hdlgetparameter('clock_process_label')), 0.0);
    else
        % 299 301
        [tempname, current_input] = hdlnewsignal('input_typeconvert', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        tempbody = hdldatatypeassignment(entity_input, current_input, 'floor', 0.0);
        tempsignals = '';
    end
    % 305 307
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    % 308 315
    % 309 315
    % 310 315
    % 311 315
    % 312 315
    % 313 315
    for section=1.0:numsections
        % 315 317
        if eq(section, 1.0)
            sectioninvtype = inregvtype;
            sectioninsltype = inregsltype;
        else
            sectioninvtype = sectionvtype;
            sectioninsltype = sectionsltype;
        end
        % 323 325
        sectionsize = sectionwordlength(section);
        sectionbp = sectionfraclength(section);
        % 326 328
        [sectionvtype, sectionsltype] = hdlgettypesfromsizes(sectionsize, sectionbp, signed);
        % 328 330
        disp(sprintf(horzcat(hdlcodegenmsgs(11.0), 'Section # ', '%d : Comb'), section));
        % 330 332
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Section # ', num2str(section), ' : Comb ------------------\n\n');
        % 332 335
        % 333 335
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  -- Section ', num2str(section), ' Signals \n');
        % 335 341
        % 336 341
        % 337 341
        % 338 341
        % 339 341
        [tempname, section_in] = hdlnewsignal(horzcat('section_in', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectioninvtype, sectioninsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_in));
        % 342 344
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(current_input, section_in, roundmode, overflowmode));
        % 344 350
        % 345 350
        % 346 350
        % 347 350
        % 348 350
        if not(strcmpi(sectioninvtype, sectionvtype)) || not(strcmp(sectioninsltype, sectionsltype))
            % 350 353
            % 351 353
            [castname, cast_result] = hdlnewsignal(horzcat('section_cast', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
            % 353 355
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(cast_result));
            % 355 357
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(section_in, cast_result, roundmode, overflowmode));
        else
            % 358 360
            % 359 361
            cast_result = section_in;
        end
        % 362 368
        % 363 368
        % 364 368
        % 365 368
        % 366 368
        [tempname, sub_temp] = hdlnewsignal(horzcat('diff', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 368 370
        if eq(numdifferentialdelay, 1.0)
            % 370 372
            hdlregsignal(sub_temp);
        end
        % 373 375
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(sub_temp));
        % 375 377
        [tempname, section_out] = hdlnewsignal(horzcat('section_out', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 377 379
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_out));
        % 379 381
        [tempbody, tempsignals] = hdlfiltersub(cast_result, sub_temp, section_out, roundmode, overflowmode);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 383 389
        % 384 389
        % 385 389
        % 386 389
        % 387 389
        if eq(numdifferentialdelay, 1.0)
            [tempbody, tempsignals] = hdlunitdelay(cast_result, sub_temp, horzcat('comb_delay_section', num2str(section)), '');
        else
            % 391 393
            [tempbody, tempsignals] = hdlintdelay(cast_result, sub_temp, horzcat('comb_delay_section', num2str(section)), numdifferentialdelay);
            % 393 395
        end
        % 395 397
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 398 402
        % 399 402
        % 400 402
        if hdlgetparameter('filter_pipelined')
            hdlsetparameter('filter_excess_latency', plus(hdlgetparameter('filter_excess_latency'), numfactor));
            [tempname, pipeout] = hdlnewsignal(horzcat('cic_pipeline', num2str(section)), 'filter', -1.0, 0.0, 0.0, hdlsignalvtype(section_out), hdlsignalsltype(section_out));
            % 404 408
            % 405 408
            % 406 408
            hdlregsignal(pipeout);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(pipeout));
            [tempbody, tempsignals] = hdlunitdelay(section_out, pipeout, horzcat('cic_pipeline', hdlgetparameter('clock_process_label'), '_section', num2str(section)), 0.0);
            % 410 413
            % 411 413
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
            hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
            % 414 416
            section_out = pipeout;
            % 416 418
        end
        % 418 420
        current_input = section_out;
        % 420 422
    end % for
    % 422 428
    % 423 428
    % 424 428
    % 425 428
    % 426 428
    if gt(numfactor, 1.0)
        [uname, zeroconstant] = hdlnewsignal('zeroconst', 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 429 431
        hdl_arch_constants = horzcat(hdl_arch_constants, makehdlconstantdecl(zeroconstant, hdlconstantvalue(0.0, sectionsize, sectionbp, signed)));
        % 431 435
        % 432 435
        % 433 435
        [upsamplingname, upsampling] = hdlnewsignal('upsampling', 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 435 437
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(upsampling));
        % 437 439
        if eq(multiclock, 0.0)
            tempbody = hdlmux(horzcat(current_input, zeroconstant), upsampling, ce_out_temp, {'='}, 1.0, 'when-else');
        else
            tempbody = hdlmux(horzcat(current_input, zeroconstant), upsampling, clk1, {'='}, 1.0, 'when-else');
        end
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        % 444 446
        current_input = upsampling;
    end
    % 447 451
    % 448 451
    % 449 451
    if eq(multiclock, 0.0)
        hdlsetcurrentclockenable(saved_ce);
    else
        % 453 455
        hdlsetcurrentclockenable(saved_ce);
        hdlsetcurrentclock(saved_clk);
        hdlsetcurrentreset(saved_rst);
    end
    % 458 466
    % 459 466
    % 460 466
    % 461 466
    % 462 466
    % 463 466
    % 464 466
    for section=plus(numsections, 1.0):mtimes(2.0, numsections)
        % 466 468
        sectioninvtype = sectionvtype;
        sectioninsltype = sectionsltype;
        % 469 471
        sectionsize = sectionwordlength(section);
        sectionbp = sectionfraclength(section);
        [sectionvtype, sectionsltype] = hdlgettypesfromsizes(sectionsize, sectionbp, signed);
        % 473 475
        disp(sprintf(horzcat(hdlcodegenmsgs(11.0), 'Section # ', '%d : Integrator'), section));
        % 475 477
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Section # ', num2str(section), ' : Integrator ------------------\n\n');
        % 477 481
        % 478 481
        % 479 481
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  -- Section ', num2str(section), ' Signals \n');
        % 481 487
        % 482 487
        % 483 487
        % 484 487
        % 485 487
        [tempname, section_in] = hdlnewsignal(horzcat('section_in', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectioninvtype, sectioninsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_in));
        % 488 490
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(current_input, section_in, roundmode, overflowmode));
        % 490 496
        % 491 496
        % 492 496
        % 493 496
        % 494 496
        if not(strcmpi(sectioninvtype, sectionvtype)) || not(strcmp(sectioninsltype, sectionsltype))
            % 496 499
            % 497 499
            [castname, cast_result] = hdlnewsignal(horzcat('section_cast', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
            % 499 501
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(cast_result));
            % 501 503
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(section_in, cast_result, roundmode, overflowmode));
        else
            % 504 506
            % 505 507
            cast_result = section_in;
        end
        % 508 514
        % 509 514
        % 510 514
        % 511 514
        % 512 514
        [tempname, add_temp] = hdlnewsignal(horzcat('sum', num2str(minus(section, numsections))), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 514 516
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(add_temp));
        [tempname, section_out] = hdlnewsignal(horzcat('section_out', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 517 519
        hdlregsignal(section_out);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_out));
        % 520 522
        [tempbody, tempsignals] = hdlfilteradd(cast_result, section_out, add_temp, roundmode, overflowmode);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 524 529
        % 525 529
        % 526 529
        % 527 529
        [tempbody, tempsignals] = hdlunitdelay(add_temp, section_out, horzcat('integrator_delay_section', num2str(section)), 0.0);
        % 529 531
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 532 534
        current_input = section_out;
        % 534 536
    end % for
    % 536 541
    % 537 541
    % 538 541
    % 539 541
    if not(strcmpi(hdlsignalvtype(current_input), outregvtype)) || not(strcmp(hdlsignalsltype(current_input), outregsltype))
        % 541 544
        % 542 544
        [mcandname, conv_output] = hdlnewsignal('output_typeconvert', 'filter', -1.0, 0.0, 0.0, outregvtype, outregsltype);
        % 544 546
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(conv_output));
        % 546 549
        % 547 549
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(current_input, conv_output, roundmode, overflowmode));
        % 549 552
        % 550 552
        current_input = conv_output;
    end
    % 553 558
    % 554 558
    % 555 558
    % 556 558
    if eq(hdlgetparameter('filter_registered_output'), 1.0)
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Output Register ------------------\n\n');
        % 559 562
        % 560 562
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  \n');
        % 562 564
        [tempname, reg_output] = hdlnewsignal('output_register', 'filter', -1.0, 0.0, 0.0, outregvtype, outregsltype);
        hdlregsignal(reg_output);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(reg_output));
        [tempbody, tempsignals] = hdlunitdelay(current_input, reg_output, horzcat('output_reg', hdlgetparameter('clock_process_label')), 0.0);
        % 567 569
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    else
        reg_output = current_input;
    end
    % 573 579
    % 574 579
    % 575 579
    % 576 579
    % 577 579
    [tempbody, tempsignals] = hdlfinalassignment(reg_output, entity_output);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    % 581 591
    % 582 591
    % 583 591
    % 584 591
    % 585 591
    % 586 591
    % 587 591
    % 588 591
    % 589 591
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        hdl_entity_library = horzcat(hdl_entity_library, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n\n');
    else
        hdl_entity_library = horzcat(hdl_entity_library, '\n');
    end
    % 595 597
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix')));
        % 598 601
        % 599 601
        archfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix')));
        % 601 604
        % 602 604
        opentype = 'w';
    else
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('filename_suffix')));
        archfilename = entityfilename;
        opentype = 'a';
    end
    % 609 611
    entityfid = fopen(entityfilename, 'w');
    % 611 613
    if eq(entityfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', entityfilename);
    end
    % 615 617
    hdl_entity = horzcat(hdl_entity_comment, hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_ports, hdl_entity_portdecls, hdl_entity_end);
    % 617 625
    % 618 625
    % 619 625
    % 620 625
    % 621 625
    % 622 625
    % 623 625
    fprintf(entityfid, hdl_entity);
    fclose(entityfid);
    % 626 628
    archfid = fopen(archfilename, opentype);
    % 628 630
    if eq(archfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', archfilename);
    end
    % 632 634
    hdl_arch = horzcat(hdl_arch_comment, hdl_arch_decl, hdl_arch_component_decl, hdl_arch_component_config, hdl_arch_functions, hdl_arch_typedefs, hdl_arch_constants, hdl_arch_signals, hdl_arch_begin, hdl_arch_body_component_instances, hdl_arch_body_blocks, hdl_arch_body_output_assignments, hdl_arch_end);
    % 634 647
    % 635 647
    % 636 647
    % 637 647
    % 638 647
    % 639 647
    % 640 647
    % 641 647
    % 642 647
    % 643 647
    % 644 647
    % 645 647
    fprintf(archfid, hdl_arch);
    fclose(archfid);
    % 648 651
    % 649 651
    disp(sprintf('%s', hdlcodegenmsgs(7.0, hdlfilterlatency(filterobj))));
    % 651 653
    if hdlgetparameter('isvhdl')
        tlang = 'VHDL';
    else
        if hdlgetparameter('isverilog')
            tlang = 'Verilog';
        else
            tlang = '';
        end
    end
end
