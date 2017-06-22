function generatecicdecimhdl(filterobj)
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
    if not(strcmp(filterobj.filterstructure, 'Cascaded Integrator-Comb Decimator'))
        error(generatemsgid('noncicdecim'), 'generatecicdecimhdl called with non cicdecim filter object %s.', filterobj.filterstructure);
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
    numfactor = filterobj.decimationfactor;
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
    if eq(hdlgetparameter('clockinputs'), 1.0)
        multiclock = 0.0;
    else
        multiclock = 1.0;
    end
    % 139 141
    [clkuname, clk] = hdlnewsignal(hdlgetparameter('clockname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 141 143
    hdladdinportsignal(clk);
    hdladdclocksignal(clk);
    hdlsetcurrentclock(clk);
    % 145 147
    [clkenuname, clken] = hdlnewsignal(hdlgetparameter('clockenablename'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 147 149
    hdladdinportsignal(clken);
    hdladdclockenablesignal(clken);
    hdlsetcurrentclockenable(clken);
    [rstuname, reset] = hdlnewsignal(hdlgetparameter('resetname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 152 154
    hdladdinportsignal(reset);
    hdladdresetsignal(reset);
    hdlsetcurrentreset(reset);
    [inuname, entity_input] = hdlnewsignal(hdlgetparameter('filter_input_name'), 'filter', -1.0, 0.0, 0.0, inputvtype, inputsltype);
    % 157 160
    % 158 160
    hdladdinportsignal(entity_input);
    % 160 162
    if eq(multiclock, 1.0)
        [clk1uname, clk1] = hdlnewsignal(horzcat(hdlgetparameter('clockname'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 163 166
        % 164 166
        hdladdinportsignal(clk1);
        hdladdclocksignal(clk1);
        [clken1uname, clken1] = hdlnewsignal(horzcat(hdlgetparameter('clockenablename'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 168 171
        % 169 171
        hdladdinportsignal(clken1);
        hdladdclockenablesignal(clken1);
        [rst1uname, reset1] = hdlnewsignal(horzcat(hdlgetparameter('resetname'), '1'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 173 176
        % 174 176
        hdladdinportsignal(reset1);
        hdladdresetsignal(reset1);
    else
        clk1 = 0.0;
        clken1 = 0.0;
        reset1 = 0.0;
    end
    % 182 184
    [outuname, entity_output] = hdlnewsignal(hdlgetparameter('filter_output_name'), 'filter', -1.0, 0.0, 0.0, outputvtype, outputsltype);
    % 184 187
    % 185 187
    hdladdoutportsignal(entity_output);
    if eq(multiclock, 0.0)
        [outuname, entity_ceoutput] = hdlnewsignal(hdlgetparameter('clockenableoutputname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
        % 189 191
        hdladdoutportsignal(entity_ceoutput);
    end
    % 192 194
    [hdl_entity_ports, hdl_entity_portdecls] = hdlentityports;
    % 194 196
    hdladdtoentitylist('filter', nname, hdl_entity_ports, hdlentityportnames);
    % 196 204
    % 197 204
    % 198 204
    % 199 204
    % 200 204
    % 201 204
    % 202 204
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        hdl_arch_comment = hdl_entity_comment;
    else
        hdl_arch_comment = hdldefarchheader(nname);
    end
    % 208 216
    % 209 216
    % 210 216
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    disp(sprintf('%s', hdlcodegenmsgs(2.0)));
    disp(sprintf('%s', hdlcodegenmsgs(3.0)));
    disp(sprintf('%s', hdlcodegenmsgs(4.0)));
    % 218 225
    % 219 225
    % 220 225
    % 221 225
    % 222 225
    % 223 225
    if eq(multiclock, 0.0)
        % 225 229
        % 226 229
        % 227 229
        if eq(numfactor, 1.0)
            ce_out_reg = clken;
            ce_out_temp = clken;
        else
            % 232 234
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Generation ------------------\n\n');
            % 234 238
            % 235 238
            % 236 238
            if eq(hdlgetparameter('filter_registered_input'), 1.0)
                decodeval = 1.0;
            else
                decodeval = 0.0;
            end
            % 242 244
            countsize = max(2.0, ceil(log2(numfactor)));
            [countervtype, countersltype] = hdlgettypesfromsizes(countsize, 0.0, 0.0);
            [tempname, counter_out] = hdlnewsignal('cur_count', 'filter', -1.0, 0.0, 0.0, countervtype, countersltype);
            hdlregsignal(counter_out);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(counter_out));
            [tempprocessbody, ce_out_temp] = hdlcounter(counter_out, numfactor, 'ce_output', 1.0, 0.0, decodeval);
            % 249 251
            hdladdclockenablesignal(ce_out_temp);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_temp));
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
            % 253 255
            if hdlgetparameter('filter_pipelined') && gt(numsections, 1.0)
                % 255 257
                saved_ce = hdlgetcurrentclockenable;
                hdlsetcurrentclockenable(ce_out_temp);
                [tempname, ce_delayline] = hdlnewsignal('ce_delayline', 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
                % 259 263
                % 260 263
                % 261 263
                [tempbody, tempsignals] = hdlintdelay(clken, ce_delayline, 'ce_delay', minus(numsections, 1.0));
                hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_delayline));
                hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
                hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
                % 266 268
                hdlsetcurrentclockenable(saved_ce);
                % 268 270
                [tempname, ce_internal] = hdlnewsignal('ce_gated', 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
                hdladdclockenablesignal(ce_internal);
                hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_internal));
                temp_body = hdllogop(horzcat(ce_delayline, ce_out_temp), ce_internal, 'AND');
                hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, temp_body);
            else
                % 275 277
                ce_internal = ce_out_temp;
            end
            % 278 280
            if eq(hdlgetparameter('filter_registered_output'), 1.0)
                hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Register ------------------\n\n');
                % 281 285
                % 282 285
                % 283 285
                [tempname, ce_out_reg] = hdlnewsignal('ce_out_reg', 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
                hdlregsignal(ce_out_reg);
                hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_reg));
                % 287 290
                % 288 290
                saved_ce = hdlgetcurrentclockenable;
                hdlsetcurrentclockenable([]);
                [tempprocessbody, tempsignal] = hdlunitdelay(ce_internal, ce_out_reg, 'ce_output_register', 0.0);
                hdl_arch_signals = horzcat(hdl_arch_signals, tempsignal);
                hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
                hdlsetcurrentclockenable(saved_ce);
            else
                % 296 298
                % 297 299
                ce_out_reg = ce_internal;
            end
        end
        % 301 303
        [tempbody, tempsignals] = hdlfinalassignment(ce_out_reg, entity_ceoutput);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
        % 305 307
    end
    % 307 315
    % 308 315
    % 309 315
    % 310 315
    % 311 315
    % 312 315
    % 313 315
    if eq(hdlgetparameter('filter_registered_input'), 1.0)
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Input Register ------------------\n\n');
        % 316 319
        % 317 319
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  \n');
        % 319 321
        [tempname, current_input] = hdlnewsignal('input_register', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdlregsignal(current_input);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        [tempbody, tempsignals] = hdlunitdelay(entity_input, current_input, horzcat('input_reg', hdlgetparameter('clock_process_label')), 0.0);
    else
        % 325 327
        [tempname, current_input] = hdlnewsignal('input_typeconvert', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        tempbody = hdldatatypeassignment(entity_input, current_input, 'floor', 0.0);
        tempsignals = '';
    end
    % 331 333
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    % 334 342
    % 335 342
    % 336 342
    % 337 342
    % 338 342
    % 339 342
    % 340 342
    for section=1.0:numsections
        if eq(section, 1.0)
            sectioninvtype = inregvtype;
            sectioninsltype = inregsltype;
        else
            sectioninvtype = sectionvtype;
            sectioninsltype = sectionsltype;
        end
        % 349 351
        sectionsize = sectionwordlength(section);
        sectionbp = sectionfraclength(section);
        [sectionvtype, sectionsltype] = hdlgettypesfromsizes(sectionsize, sectionbp, signed);
        % 353 355
        disp(sprintf(horzcat(hdlcodegenmsgs(11.0), 'Section # ', '%d : Integrator'), section));
        % 355 357
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Section # ', num2str(section), ' : Integrator ------------------\n\n');
        % 357 360
        % 358 360
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  -- Section ', num2str(section), ' Signals \n');
        % 360 366
        % 361 366
        % 362 366
        % 363 366
        % 364 366
        [tempname, section_in] = hdlnewsignal(horzcat('section_in', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectioninvtype, sectioninsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_in));
        % 367 369
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(current_input, section_in, roundmode, overflowmode));
        % 369 375
        % 370 375
        % 371 375
        % 372 375
        % 373 375
        if not(strcmpi(sectioninvtype, sectionvtype)) || not(strcmp(sectioninsltype, sectionsltype))
            % 375 378
            % 376 378
            [castname, cast_result] = hdlnewsignal(horzcat('section_cast', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
            % 378 380
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(cast_result));
            % 380 382
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(section_in, cast_result, roundmode, overflowmode));
        else
            % 383 385
            % 384 386
            cast_result = section_in;
        end
        % 387 393
        % 388 393
        % 389 393
        % 390 393
        % 391 393
        [tempname, add_temp] = hdlnewsignal(horzcat('sum', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 393 395
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(add_temp));
        [tempname, section_out] = hdlnewsignal(horzcat('section_out', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 396 398
        hdlregsignal(section_out);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_out));
        % 399 401
        [tempbody, tempsignals] = hdlfilteradd(cast_result, section_out, add_temp, roundmode, overflowmode);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 403 408
        % 404 408
        % 405 408
        % 406 408
        [tempbody, tempsignals] = hdlunitdelay(add_temp, section_out, horzcat('integrator_delay_section', num2str(section)), 0.0);
        % 408 410
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 411 413
        current_input = section_out;
        % 413 415
    end % for
    % 415 418
    % 416 418
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
    % 428 436
    % 429 436
    % 430 436
    % 431 436
    % 432 436
    % 433 436
    % 434 436
    for section=plus(numsections, 1.0):mtimes(2.0, numsections)
        % 436 438
        sectioninvtype = sectionvtype;
        sectioninsltype = sectionsltype;
        % 439 441
        sectionsize = sectionwordlength(section);
        sectionbp = sectionfraclength(section);
        [sectionvtype, sectionsltype] = hdlgettypesfromsizes(sectionsize, sectionbp, signed);
        % 443 445
        disp(sprintf(horzcat(hdlcodegenmsgs(11.0), 'Section # ', '%d : Comb'), section));
        % 445 447
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Section # ', num2str(section), ' : Comb ------------------\n\n');
        % 447 450
        % 448 450
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  -- Section ', num2str(section), ' Signals \n');
        % 450 456
        % 451 456
        % 452 456
        % 453 456
        % 454 456
        [tempname, section_in] = hdlnewsignal(horzcat('section_in', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectioninvtype, sectioninsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_in));
        % 457 459
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(current_input, section_in, roundmode, overflowmode));
        % 459 465
        % 460 465
        % 461 465
        % 462 465
        % 463 465
        if not(strcmpi(sectioninvtype, sectionvtype)) || not(strcmp(sectioninsltype, sectionsltype))
            % 465 468
            % 466 468
            [castname, cast_result] = hdlnewsignal(horzcat('section_cast', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
            % 468 470
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(cast_result));
            % 470 472
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(section_in, cast_result, roundmode, overflowmode));
        else
            % 473 475
            % 474 476
            cast_result = section_in;
        end
        % 477 483
        % 478 483
        % 479 483
        % 480 483
        % 481 483
        [tempname, sub_temp] = hdlnewsignal(horzcat('diff', num2str(minus(section, numsections))), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 483 485
        if eq(numdifferentialdelay, 1.0)
            % 485 487
            hdlregsignal(sub_temp);
        end
        % 488 490
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(sub_temp));
        % 490 492
        [tempname, section_out] = hdlnewsignal(horzcat('section_out', num2str(section)), 'filter', -1.0, 0.0, 0.0, sectionvtype, sectionsltype);
        % 492 494
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(section_out));
        % 494 496
        [tempbody, tempsignals] = hdlfiltersub(cast_result, sub_temp, section_out, roundmode, overflowmode);
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 498 504
        % 499 504
        % 500 504
        % 501 504
        % 502 504
        if eq(numdifferentialdelay, 1.0)
            [tempbody, tempsignals] = hdlunitdelay(cast_result, sub_temp, horzcat('comb_delay_section', num2str(section)), '');
        else
            % 506 508
            [tempbody, tempsignals] = hdlintdelay(cast_result, sub_temp, horzcat('comb_delay_section', num2str(section)), numdifferentialdelay);
            % 508 510
        end
        % 510 512
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        % 513 517
        % 514 517
        % 515 517
        if hdlgetparameter('filter_pipelined') && ne(section, mtimes(numsections, 2.0))
            hdlsetparameter('filter_excess_latency', plus(hdlgetparameter('filter_excess_latency'), numfactor));
            [tempname, pipeout] = hdlnewsignal(horzcat('cic_pipeline', num2str(section)), 'filter', -1.0, 0.0, 0.0, hdlsignalvtype(section_out), hdlsignalsltype(section_out));
            % 519 523
            % 520 523
            % 521 523
            hdlregsignal(pipeout);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(pipeout));
            [tempbody, tempsignals] = hdlunitdelay(section_out, pipeout, horzcat('cic_pipeline', hdlgetparameter('clock_process_label'), '_section', num2str(section)), 0.0);
            % 525 528
            % 526 528
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
            hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
            % 529 531
            section_out = pipeout;
            % 531 533
        end
        % 533 535
        current_input = section_out;
        % 535 537
    end % for
    % 537 542
    % 538 542
    % 539 542
    % 540 542
    if not(strcmpi(hdlsignalvtype(current_input), outregvtype)) || not(strcmp(hdlsignalsltype(current_input), outregsltype))
        % 542 545
        % 543 545
        [mcandname, conv_output] = hdlnewsignal('output_typeconvert', 'filter', -1.0, 0.0, 0.0, outregvtype, outregsltype);
        % 545 547
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(conv_output));
        % 547 550
        % 548 550
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, hdldatatypeassignment(current_input, conv_output, roundmode, overflowmode));
        % 550 553
        % 551 553
        current_input = conv_output;
    end
    % 554 559
    % 555 559
    % 556 559
    % 557 559
    if eq(hdlgetparameter('filter_registered_output'), 1.0)
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ Output Register ------------------\n\n');
        % 560 563
        % 561 563
        hdl_arch_signals = horzcat(hdl_arch_signals, indentedcomment, '  \n');
        % 563 565
        [tempname, reg_output] = hdlnewsignal('output_register', 'filter', -1.0, 0.0, 0.0, outregvtype, outregsltype);
        hdlregsignal(reg_output);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(reg_output));
        [tempbody, tempsignals] = hdlunitdelay(current_input, reg_output, horzcat('output_reg', hdlgetparameter('clock_process_label')), 0.0);
        % 568 570
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    else
        reg_output = current_input;
    end
    % 574 577
    % 575 577
    if eq(multiclock, 0.0)
        hdlsetcurrentclockenable(saved_ce);
    else
        % 579 581
        hdlsetcurrentclockenable(saved_ce);
        hdlsetcurrentclock(saved_clk);
        hdlsetcurrentreset(saved_rst);
    end
    % 584 590
    % 585 590
    % 586 590
    % 587 590
    % 588 590
    [tempbody, tempsignals] = hdlfinalassignment(reg_output, entity_output);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    % 592 602
    % 593 602
    % 594 602
    % 595 602
    % 596 602
    % 597 602
    % 598 602
    % 599 602
    % 600 602
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        % 602 604
        hdl_entity_library = horzcat(hdl_entity_library, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n\n');
    else
        hdl_entity_library = horzcat(hdl_entity_library, '\n');
    end
    % 607 609
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix')));
        % 610 613
        % 611 613
        archfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix')));
        % 613 616
        % 614 616
        opentype = 'w';
    else
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('filename_suffix')));
        archfilename = entityfilename;
        opentype = 'a';
    end
    % 621 623
    entityfid = fopen(entityfilename, 'w');
    % 623 625
    if eq(entityfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', entityfilename);
    end
    % 627 629
    hdl_entity = horzcat(hdl_entity_comment, hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_ports, hdl_entity_portdecls, hdl_entity_end);
    % 629 637
    % 630 637
    % 631 637
    % 632 637
    % 633 637
    % 634 637
    % 635 637
    fprintf(entityfid, hdl_entity);
    fclose(entityfid);
    % 638 640
    archfid = fopen(archfilename, opentype);
    % 640 642
    if eq(archfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', archfilename);
    end
    % 644 646
    hdl_arch = horzcat(hdl_arch_comment, hdl_arch_decl, hdl_arch_component_decl, hdl_arch_component_config, hdl_arch_functions, hdl_arch_typedefs, hdl_arch_constants, hdl_arch_signals, hdl_arch_begin, hdl_arch_body_component_instances, hdl_arch_body_blocks, hdl_arch_body_output_assignments, hdl_arch_end);
    % 646 659
    % 647 659
    % 648 659
    % 649 659
    % 650 659
    % 651 659
    % 652 659
    % 653 659
    % 654 659
    % 655 659
    % 656 659
    % 657 659
    fprintf(archfid, hdl_arch);
    fclose(archfid);
    % 660 663
    % 661 663
    disp(sprintf('%s', hdlcodegenmsgs(7.0, hdlfilterlatency(filterobj))));
    % 663 665
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
