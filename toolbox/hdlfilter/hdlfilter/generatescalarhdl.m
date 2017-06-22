function generatescalarhdl(filterobj)
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
    if not(isscalar(filterobj)) || not(strcmp(lower(class(filterobj)), 'dfilt.scalar'))
        error(generatemsgid('nonscalar'), 'generatescalarhdl called with non-scalar filter object %s.', filterstructure(filterobj));
        % 14 16
    end
    % 16 18
    bdt = hdlgetparameter('base_data_type');
    hdlsetparameter('filter_target_language', hdlgetparameter('target_language'));
    % 19 21
    hdlentitysignalsinit;
    % 21 23
    arithtype = get(filterobj, 'Arithmetic');
    switch arithtype
    case 'double'
        arithisdouble = true;
    case 'fixed'
        arithisdouble = false;
    otherwise
        error(generatemsgid('unsupportedarithmetic'), 'HDL generation for this object with Arithmetic (%s) is not supported.', arithtype);
        % 30 33
        % 31 33
    end
    structure = class(filterobj);
    gain = filterobj.gain;
    % 35 37
    inputrounding = 'round';
    inputsaturation = true;
    inregrounding = 'round';
    inregsaturation = true;
    % 40 42
    if arithisdouble
        [coeffsize, coeffbp, coeffsigned, coeffvtype, coeffsltype] = setfordouble;
        [inputsize, inputbp, inputsigned, inputvtype, inputsltype] = setportfordouble;
        [inregsize, inregbp, inregsigned, inregvtype, inregsltype] = setfordouble;
        [outputsize, outputbp, outputsigned, outputvtype, outputsltype] = setportfordouble;
        [outregsize, outregbp, outregsigned, outregvtype, outregsltype] = setfordouble;
        [outputsaturation, outregsaturation] = deal(false);
        [outputrounding, outregrounding] = deal('floor');
    else
        % 50 54
        % 51 54
        % 52 54
        coeffsigned = get(filterobj, 'Signed');
        [inputsigned, outputsigned, inregsigned, outregsigned] = deal(true);
        % 55 57
        switch lower(get(filterobj, 'OverflowMode'))
        case 'saturate'
            satmode = true;
        otherwise
            satmode = false;
        end
        [outputsaturation, outregsaturation] = deal(satmode);
        % 63 65
        rmode = get(filterobj, 'RoundMode');
        [outputrounding, outregrounding] = deal(rmode);
        % 66 69
        % 67 69
        coeffsize = get(filterobj, 'CoeffWordLength');
        coeffbp = get(filterobj, 'CoeffFracLength');
        % 70 72
        [coeffvtype, coeffsltype] = hdlgettypesfromsizes(coeffsize, coeffbp, coeffsigned);
        % 72 75
        % 73 75
        inputsize = get(filterobj, 'InputWordLength');
        inputbp = get(filterobj, 'InputFracLength');
        if eq(hdlgetparameter('filter_input_type_std_logic'), 1.0)
            [inputvtype, inputsltype] = hdlgetporttypesfromsizes(inputsize, inputbp, inputsigned);
        else
            [inputvtype, inputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        end
        [inregvtype, inregsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        % 82 84
        outputsize = get(filterobj, 'OutputWordLength');
        outputbp = get(filterobj, 'OutputFracLength');
        if eq(hdlgetparameter('filter_output_type_std_logic'), 1.0)
            [outputvtype, outputsltype] = hdlgetporttypesfromsizes(outputsize, outputbp, outputsigned);
        else
            [outputvtype, outputsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        end
        [outregvtype, outregsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        % 91 93
    end
    % 93 95
    nname = hdlgetparameter('filter_name');
    % 95 97
    if isempty(nname)
        nname = 'filter';
    end
    % 99 101
    disp(sprintf('%s', hdlcodegenmsgs(1.0)));
    % 101 104
    % 102 104
    hdl_entity_comment = hdlentitycomment(nname, hdlgetparameter('rcs_cvs_tag'), info(filterobj), hdlgetparameter('comment_char'));
    % 104 107
    % 105 107
    indentedcomment = horzcat('  ', hdlgetparameter('comment_char'), ' ');
    % 107 110
    % 108 110
    hdl_arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdl_arch_typedefs = horzcat(indentedcomment, 'Type Definitions\n');
    hdl_arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdl_arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdl_arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdl_arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    % 115 117
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
            % 142 146
            % 143 146
            % 144 146
        end
    end
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    [clkuname, clk] = hdlnewsignal(hdlgetparameter('clockname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 152 154
    hdladdinportsignal(clk);
    hdladdclocksignal(clk);
    hdlsetcurrentclock(clk);
    % 156 158
    [clkenuname, clken] = hdlnewsignal(hdlgetparameter('clockenablename'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 158 160
    hdladdinportsignal(clken);
    hdladdclockenablesignal(clken);
    hdlsetcurrentclockenable(clken);
    [rstuname, reset] = hdlnewsignal(hdlgetparameter('resetname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 163 165
    hdladdinportsignal(reset);
    hdladdresetsignal(reset);
    hdlsetcurrentreset(reset);
    [inuname, entity_input] = hdlnewsignal(hdlgetparameter('filter_input_name'), 'filter', -1.0, 0.0, 0.0, inputvtype, inputsltype);
    % 168 171
    % 169 171
    hdladdinportsignal(entity_input);
    % 171 173
    [outuname, entity_output] = hdlnewsignal(hdlgetparameter('filter_output_name'), 'filter', -1.0, 0.0, 0.0, outputvtype, outputsltype);
    % 173 175
    hdladdoutportsignal(entity_output);
    % 175 177
    [hdl_entity_ports, hdl_entity_portdecls] = hdlentityports;
    % 177 179
    hdladdtoentitylist('filter', nname, hdl_entity_ports, hdlentityportnames);
    % 179 187
    % 180 187
    % 181 187
    % 182 187
    % 183 187
    % 184 187
    % 185 187
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        hdl_arch_comment = hdl_entity_comment;
    else
        hdl_arch_comment = hdldefarchheader(nname);
    end
    % 191 199
    % 192 199
    % 193 199
    % 194 199
    % 195 199
    % 196 199
    % 197 199
    disp(sprintf('%s', hdlcodegenmsgs(2.0)));
    disp(sprintf('%s', hdlcodegenmsgs(3.0)));
    disp(sprintf('%s', hdlcodegenmsgs(4.0)));
    % 201 203
    if eq(hdlgetparameter('filter_registered_input'), 1.0)
        [tempname, current_input] = hdlnewsignal('input_register', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdlregsignal(current_input);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        [tempbody, tempsignals] = hdlunitdelay(entity_input, current_input, horzcat('input_reg', hdlgetparameter('clock_process_label')), 0.0);
    else
        % 208 210
        [tempname, current_input] = hdlnewsignal('input_typeconvert', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        tempbody = hdldatatypeassignment(entity_input, current_input, 'floor', 0.0);
        tempsignals = '';
    end
    % 214 216
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    % 217 222
    % 218 222
    % 219 222
    % 220 222
    if eq(coeffsize, 0.0)
        firstscaleint = gain;
        if eq(firstscaleint, 0.0)
            error(generatemsgid('scaleerror'), 'Scale value %f is beyond the range of the filter input.', gain);
            % 225 228
            % 226 228
        end
    else
        firstscaleint = floor(plus(mtimes(gain, mpower(2.0, inputbp)), .5));
        if eq(firstscaleint, 0.0)
            error(generatemsgid('scaleerror'), 'Scale value %f is beyond the range of the filter input.', gain);
        else
            % 233 235
            if gt(abs(firstscaleint), mpower(2.0, minus(inputsize, 1.0)))
                warning(generatemsgid('scalewarn'), 'Scale value %f is beyond the range of the filter input.', gain);
            else
                % 237 239
                if lt(abs(firstscaleint), mpower(2.0, minus(inputsize, hdlgetparameter('filter_scalewarnbits'))))
                    warning(generatemsgid('scalewarn'), 'Scale value %f has less than %d significant bits.', gain, hdlgetparameter('filter_scalewarnbits'));
                    % 240 243
                    % 241 243
                end
            end
        end
    end
    [uname, scaleconstant] = hdlnewsignal('scaleconst', 'filter', -1.0, 0.0, 0.0, coeffvtype, coeffsltype);
    hdl_arch_constants = horzcat(hdl_arch_constants, makehdlconstantdecl(scaleconstant, hdlconstantvalue(gain, coeffsize, coeffbp, coeffsigned)));
    % 248 252
    % 249 252
    % 250 252
    [scaled_output, tempbody, tempsignals, moresignals] = hdlcoeffmultiply(current_input, gain, scaleconstant, 'scaleout', outregvtype, outregsltype, outputrounding, outputsaturation);
    % 252 258
    % 253 258
    % 254 258
    % 255 258
    % 256 258
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals, moresignals);
    % 259 261
    if eq(hdlgetparameter('filter_registered_output'), 1.0)
        current_output = scaled_output;
        [tempname, scaled_output] = hdlnewsignal('output_register', 'filter', -1.0, 0.0, 0.0, outregvtype, outregsltype);
        hdlregsignal(scaled_output);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(scaled_output));
        [tempbody, tempsignals] = hdlunitdelay(current_output, scaled_output, horzcat('output_reg', hdlgetparameter('clock_process_label')), 0.0);
        % 266 268
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    else
        current_output = scaled_output;
    end
    % 272 275
    % 273 275
    [tempbody, tempsignals] = hdlfinalassignment(scaled_output, entity_output);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    % 277 287
    % 278 287
    % 279 287
    % 280 287
    % 281 287
    % 282 287
    % 283 287
    % 284 287
    % 285 287
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        hdl_entity_library = horzcat(hdl_entity_library, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n\n');
    else
        hdl_entity_library = horzcat(hdl_entity_library, '\n');
    end
    % 291 293
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix')));
        % 294 297
        % 295 297
        archfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix')));
        % 297 300
        % 298 300
        opentype = 'w';
    else
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('filename_suffix')));
        archfilename = entityfilename;
        opentype = 'a';
    end
    % 305 307
    entityfid = fopen(entityfilename, 'w');
    % 307 309
    if eq(entityfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', entityfilename);
    end
    % 311 313
    hdl_entity = horzcat(hdl_entity_comment, hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_ports, hdl_entity_portdecls, hdl_entity_end);
    % 313 321
    % 314 321
    % 315 321
    % 316 321
    % 317 321
    % 318 321
    % 319 321
    fprintf(entityfid, hdl_entity);
    fclose(entityfid);
    % 322 324
    archfid = fopen(archfilename, opentype);
    % 324 326
    if eq(archfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', archfilename);
    end
    % 328 330
    hdl_arch = horzcat(hdl_arch_comment, hdl_arch_decl, hdl_arch_component_decl, hdl_arch_component_config, hdl_arch_functions, hdl_arch_typedefs, hdl_arch_constants, hdl_arch_signals, hdl_arch_begin, hdl_arch_body_component_instances, hdl_arch_body_blocks, hdl_arch_body_output_assignments, hdl_arch_end);
    % 330 343
    % 331 343
    % 332 343
    % 333 343
    % 334 343
    % 335 343
    % 336 343
    % 337 343
    % 338 343
    % 339 343
    % 340 343
    % 341 343
    fprintf(archfid, hdl_arch);
    fclose(archfid);
    disp(sprintf('%s', hdlcodegenmsgs(7.0)));
end
function [size, bp, signed, vtype, sltype] = setfordouble
    % 347 349
    size = 0.0;
    bp = 0.0;
    signed = true;
    vtype = 'real';
    sltype = 'double';
end
function [size, bp, signed, vtype, sltype] = setportfordouble
    % 355 358
    % 356 358
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
