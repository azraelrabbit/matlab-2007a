function generateholdinterphdl(filterobj)
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
    addinputreg = hdlgetparameter('filter_registered_input');
    hdlentitysignalsinit;
    hdlsetparameter('filter_excess_latency', 0.0);
    % 17 19
    phases = filterobj.interpolationfactor;
    % 19 21
    if not(addinputreg)
        addinputreg = true;
        hdlsetparameter('filter_excess_latency', plus(hdlgetparameter('filter_excess_latency'), phases));
    end
    % 24 26
    switch lower(class(filterobj))
    case 'mfilt.holdinterp'
        arithtype = get(filterobj, 'Arithmetic');
        switch arithtype
        case 'double'
            arithisdouble = true;
        case 'fixed'
            arithisdouble = false;
        otherwise
            error(generatemsgid('unsupportedarithmetic'), 'HDL generation for this object with Arithmetic (%s) is not supported.', arithtype);
            % 35 38
            % 36 38
        end
        structure = class(filterobj);
    otherwise
        error(generatemsgid('unsupportedarch'), 'Object class (%s) is not supported by generateholdinterphdl.', class(filterobj));
        % 41 44
        % 42 44
    end
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    if arithisdouble
        [inputsize, inputbp, inputsigned, inputvtype, inputsltype] = setportfordouble;
        [reginputsize, reginputbp, reginputsigned, reginputvtype, reginputsltype] = setfordouble;
        [outputsize, outputbp, outputsigned, outputvtype, outputsltype] = setportfordouble;
        [castsize, castbp, castsigned, castvtype, castsltype] = setfordouble;
        [outputrounding, productrounding, sumrounding] = deal('floor');
        [outputsaturation, productsaturation, sumsaturation] = deal(false);
    else
        [inputsigned, outputsigned, productsigned, sumsigned] = deal(true);
        % 58 60
        inputsize = get(filterobj, 'InputWordLength');
        inputbp = get(filterobj, 'InputFracLength');
        if eq(hdlgetparameter('filter_input_type_std_logic'), 1.0)
            [inputvtype, inputsltype] = hdlgetporttypesfromsizes(inputsize, inputbp, inputsigned);
        else
            [inputvtype, inputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        end
        [reginputvtype, reginputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        % 67 69
        outputsize = get(filterobj, 'OutputWordLength');
        outputbp = get(filterobj, 'OutputFracLength');
        if eq(hdlgetparameter('filter_output_type_std_logic'), 1.0)
            [outputvtype, outputsltype] = hdlgetporttypesfromsizes(outputsize, outputbp, outputsigned);
        else
            [outputvtype, outputsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        end
        [castvtype, castsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
    end
    % 77 79
    nname = hdlgetparameter('filter_name');
    if isempty(nname)
        nname = 'filter';
    end
    % 82 84
    disp(sprintf('%s', hdlcodegenmsgs(1.0)));
    % 84 87
    % 85 87
    hdl_entity_comment = hdlentitycomment(nname, hdlgetparameter('rcs_cvs_tag'), info(filterobj), hdlgetparameter('comment_char'));
    % 87 90
    % 88 90
    indentedcomment = horzcat('  ', hdlgetparameter('comment_char'), ' ');
    % 90 93
    % 91 93
    hdl_arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdl_arch_typedefs = horzcat(indentedcomment, 'Type Definitions\n');
    hdl_arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdl_arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdl_arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdl_arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    % 98 100
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
            % 125 128
            % 126 128
        end
    end
    % 129 135
    % 130 135
    % 131 135
    % 132 135
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
    % 208 210
    disp(sprintf('%s', hdlcodegenmsgs(2.0)));
    disp(sprintf('%s', hdlcodegenmsgs(3.0)));
    disp(sprintf('%s', hdlcodegenmsgs(4.0)));
    % 212 223
    % 213 223
    % 214 223
    % 215 223
    % 216 223
    % 217 223
    % 218 223
    % 219 223
    % 220 223
    % 221 223
    if eq(phases, 1.0)
        [countervtype, countersltype] = hdlgettypesfromsizes(1.0, 0.0, 0.0);
        [tempname, counter_out] = hdlnewsignal('cur_count', 'filter', -1.0, 0.0, 0.0, countervtype, countersltype);
        hdl_arch_constants = horzcat(hdl_arch_constants, makehdlconstantdecl(counter_out, hdlconstantvalue(0.0, 1.0, 0.0, 0.0)));
    else
        % 227 230
        % 228 230
        decodeval = minus(phases, 1.0);
        % 230 232
        countsize = max(2.0, ceil(log2(phases)));
        [countervtype, countersltype] = hdlgettypesfromsizes(countsize, 0.0, 0.0);
        [tempname, counter_out] = hdlnewsignal('cur_count', 'filter', -1.0, 0.0, 0.0, countervtype, countersltype);
        hdlregsignal(counter_out);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(counter_out));
        [tempprocessbody, ce_out_temp] = hdlcounter(counter_out, phases, 'ce_output', 1.0, 0.0, decodeval);
        % 237 239
        hdladdclockenablesignal(ce_out_temp);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_temp));
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
    end
    % 242 244
    if eq(multiclock, 0.0)
        if eq(phases, 1.0)
            ce_out_reg = clken;
            ce_out_temp = clken;
        else
            % 248 253
            % 249 253
            % 250 253
            % 251 253
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Generation ------------------\n\n');
            % 253 258
            % 254 258
            % 255 258
            % 256 258
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ------------------ CE Output Register ------------------\n\n');
            % 258 262
            % 259 262
            % 260 262
            [tempname, ce_out_reg] = hdlnewsignal('ce_out_reg', 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
            hdlregsignal(ce_out_reg);
            hdladdclockenablesignal(ce_out_reg);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(ce_out_reg));
            % 265 268
            % 266 268
            temp_enable = hdlgetcurrentclockenable;
            hdlsetcurrentclockenable([]);
            [tempprocessbody, tempsignal] = hdlunitdelay(ce_out_temp, ce_out_reg, 'ce_output_register', 0.0);
            % 270 272
            hdlsetcurrentclockenable(temp_enable);
            % 272 275
            % 273 275
            if not(isempty(tempsignal))
                hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(tempsignal));
            end
            hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempprocessbody);
        end
        % 279 281
        [tempbody, tempsignals] = hdlfinalassignment(ce_out_reg, entity_ceoutput);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    end
    % 284 290
    % 285 290
    % 286 290
    % 287 290
    % 288 290
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
    % 300 302
    if eq(addinputreg, 1.0)
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ---------------- Input Registers ----------------\n\n');
        % 303 305
        delayvtype = reginputvtype;
        delaysltype = reginputsltype;
        % 306 308
        [uname, inputregister] = hdlnewsignal('inputregister', 'filter', -1.0, 0.0, 0.0, delayvtype, delaysltype);
        % 308 310
        hdlregsignal(inputregister);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(inputregister));
        % 311 313
        [tapbody, tapsignals] = hdlunitdelay(entity_input, inputregister, horzcat('Input_Register', hdlgetparameter('clock_process_label')), 0.0);
        % 313 315
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tapbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tapsignals);
    else
        inputregister = entity_input;
    end
    % 319 322
    % 320 322
    if eq(multiclock, 0.0)
        hdlsetcurrentclockenable(saved_ce);
    else
        % 324 326
        hdlsetcurrentclockenable(saved_ce);
        hdlsetcurrentclock(saved_clk);
        hdlsetcurrentreset(saved_rst);
    end
    % 329 331
    cast_result = inputregister;
    % 331 336
    % 332 336
    % 333 336
    % 334 336
    if eq(hdlgetparameter('filter_registered_output'), 1.0)
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, indentedcomment, '  ---------------- Output Registers ----------------\n\n');
        % 337 339
        [outputregname, outputreg] = hdlnewsignal('output_register', 'filter', -1.0, 0.0, 0.0, castvtype, castsltype);
        hdlregsignal(outputreg);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(outputreg));
        [tempbody, tempsignals] = hdlunitdelay(cast_result, outputreg, horzcat('Output_Register', hdlgetparameter('clock_process_label')), 0.0);
        % 342 344
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
        final_result = outputreg;
    else
        final_result = cast_result;
    end
    % 349 351
    [tempbody, tempsignals] = hdlfinalassignment(final_result, entity_output);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    % 353 363
    % 354 363
    % 355 363
    % 356 363
    % 357 363
    % 358 363
    % 359 363
    % 360 363
    % 361 363
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        hdl_entity_library = horzcat(hdl_entity_library, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n\n');
    else
        hdl_entity_library = horzcat(hdl_entity_library, '\n');
    end
    % 367 369
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix')));
        % 370 373
        % 371 373
        archfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix')));
        % 373 376
        % 374 376
        opentype = 'w';
    else
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('filename_suffix')));
        archfilename = entityfilename;
        opentype = 'a';
    end
    % 381 383
    entityfid = fopen(entityfilename, 'w');
    % 383 385
    if eq(entityfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', entityfilename);
    end
    % 387 389
    hdl_entity = horzcat(hdl_entity_comment, hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_ports, hdl_entity_portdecls, hdl_entity_end);
    % 389 397
    % 390 397
    % 391 397
    % 392 397
    % 393 397
    % 394 397
    % 395 397
    fprintf(entityfid, hdl_entity);
    fclose(entityfid);
    % 398 400
    archfid = fopen(archfilename, opentype);
    % 400 402
    if eq(archfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', archfilename);
    end
    % 404 406
    hdl_arch = horzcat(hdl_arch_comment, hdl_arch_decl, hdl_arch_component_decl, hdl_arch_component_config, hdl_arch_functions, hdl_arch_typedefs, hdl_arch_constants, hdl_arch_signals, hdl_arch_begin, hdl_arch_body_component_instances, hdl_arch_body_blocks, hdl_arch_body_output_assignments, hdl_arch_end);
    % 406 419
    % 407 419
    % 408 419
    % 409 419
    % 410 419
    % 411 419
    % 412 419
    % 413 419
    % 414 419
    % 415 419
    % 416 419
    % 417 419
    fprintf(archfid, hdl_arch);
    fclose(archfid);
    disp(sprintf('%s', hdlcodegenmsgs(7.0, hdlfilterlatency(filterobj))));
end
function [size, bp, signed, vtype, sltype] = setfordouble
    % 423 425
    size = 0.0;
    bp = 0.0;
    signed = true;
    vtype = 'real';
    sltype = 'double';
end
function [size, bp, signed, vtype, sltype] = setportfordouble
    % 431 434
    % 432 434
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
