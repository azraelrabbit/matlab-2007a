function generatedelayhdl(filterobj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(strcmp(lower(class(filterobj)), 'dfilt.delay'))
        error(generatemsgid('nondelay'), 'generatedelayhdl called with non-delay filter object %s.', filterstructure(filterobj));
        % 9 11
    end
    % 11 13
    bdt = hdlgetparameter('base_data_type');
    hdlsetparameter('filter_target_language', hdlgetparameter('target_language'));
    % 14 16
    hdlentitysignalsinit;
    % 16 18
    arithtype = get(filterobj, 'Arithmetic');
    switch arithtype
    case 'double'
        arithisdouble = true;
    case 'fixed'
        arithisdouble = false;
    otherwise
        error(generatemsgid('unsupportedarithmetic'), 'HDL generation for this object with Arithmetic (%s) is not supported.', arithtype);
        % 25 28
        % 26 28
    end
    structure = class(filterobj);
    % 29 31
    latency = filterobj.latency;
    % 31 33
    if arithisdouble
        % 33 35
        [inputsize, inputbp, inputsigned, inputvtype, inputsltype] = setportfordouble;
        [inregsize, inregbp, inregsigned, inregvtype, inregsltype] = setfordouble;
        [outputsize, outputbp, outputsigned, outputvtype, outputsltype] = setportfordouble;
        [outregsize, outregbp, outregsigned, outregvtype, outregsltype] = setfordouble;
    else
        % 39 41
        % 40 43
        % 41 43
        [inputsigned, outputsigned, inregsigned, outregsigned] = deal(true);
        % 43 46
        % 44 46
        inputsize = get(filterobj, 'InputWordLength');
        inputbp = get(filterobj, 'InputFracLength');
        if eq(hdlgetparameter('filter_input_type_std_logic'), 1.0)
            [inputvtype, inputsltype] = hdlgetporttypesfromsizes(inputsize, inputbp, inputsigned);
        else
            [inputvtype, inputsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        end
        [inregvtype, inregsltype] = hdlgettypesfromsizes(inputsize, inputbp, inputsigned);
        % 53 55
        outputsize = get(filterobj, 'OutputWordLength');
        outputbp = get(filterobj, 'OutputFracLength');
        if eq(hdlgetparameter('filter_output_type_std_logic'), 1.0)
            [outputvtype, outputsltype] = hdlgetporttypesfromsizes(outputsize, outputbp, outputsigned);
        else
            [outputvtype, outputsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        end
        [outregvtype, outregsltype] = hdlgettypesfromsizes(outputsize, outputbp, outputsigned);
        % 62 64
    end
    % 64 66
    nname = hdlgetparameter('filter_name');
    % 66 68
    if isempty(nname)
        nname = 'filter';
    end
    % 70 72
    disp(sprintf('%s', hdlcodegenmsgs(1.0)));
    % 72 75
    % 73 75
    hdl_entity_comment = hdlentitycomment(nname, hdlgetparameter('rcs_cvs_tag'), info(filterobj), hdlgetparameter('comment_char'));
    % 75 78
    % 76 78
    indentedcomment = horzcat('  ', hdlgetparameter('comment_char'), ' ');
    % 78 81
    % 79 81
    hdl_arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdl_arch_typedefs = horzcat(indentedcomment, 'Type Definitions\n');
    hdl_arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdl_arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdl_arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdl_arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    % 86 88
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
            % 113 117
            % 114 117
            % 115 117
        end
    end
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    [clkuname, clk] = hdlnewsignal(hdlgetparameter('clockname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 123 125
    hdladdinportsignal(clk);
    hdladdclocksignal(clk);
    hdlsetcurrentclock(clk);
    % 127 129
    [clkenuname, clken] = hdlnewsignal(hdlgetparameter('clockenablename'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 129 131
    hdladdinportsignal(clken);
    hdladdclockenablesignal(clken);
    hdlsetcurrentclockenable(clken);
    [rstuname, reset] = hdlnewsignal(hdlgetparameter('resetname'), 'filter', -1.0, 0.0, 0.0, bdt, 'boolean');
    % 134 136
    hdladdinportsignal(reset);
    hdladdresetsignal(reset);
    hdlsetcurrentreset(reset);
    [inuname, entity_input] = hdlnewsignal(hdlgetparameter('filter_input_name'), 'filter', -1.0, 0.0, 0.0, inputvtype, inputsltype);
    % 139 142
    % 140 142
    hdladdinportsignal(entity_input);
    % 142 144
    [outuname, entity_output] = hdlnewsignal(hdlgetparameter('filter_output_name'), 'filter', -1.0, 0.0, 0.0, outputvtype, outputsltype);
    % 144 146
    hdladdoutportsignal(entity_output);
    % 146 148
    [hdl_entity_ports, hdl_entity_portdecls] = hdlentityports;
    % 148 150
    hdladdtoentitylist('filter', nname, hdl_entity_ports, hdlentityportnames);
    % 150 158
    % 151 158
    % 152 158
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        hdl_arch_comment = hdl_entity_comment;
    else
        hdl_arch_comment = hdldefarchheader(nname);
    end
    % 162 170
    % 163 170
    % 164 170
    % 165 170
    % 166 170
    % 167 170
    % 168 170
    disp(sprintf('%s', hdlcodegenmsgs(2.0)));
    disp(sprintf('%s', hdlcodegenmsgs(3.0)));
    disp(sprintf('%s', hdlcodegenmsgs(4.0)));
    % 172 174
    if eq(hdlgetparameter('filter_registered_input'), 1.0)
        [tempname, current_input] = hdlnewsignal('input_register', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdlregsignal(current_input);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        [tempbody, tempsignals] = hdlunitdelay(entity_input, current_input, horzcat('input_reg', hdlgetparameter('clock_process_label')), 0.0);
    else
        % 179 181
        [tempname, current_input] = hdlnewsignal('input_typeconvert', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(current_input));
        tempbody = hdldatatypeassignment(entity_input, current_input, 'floor', 0.0);
        tempsignals = '';
    end
    % 185 187
    hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    % 188 190
    if ne(latency, 0.0)
        [delayreg, delayinput] = hdlnewsignal('delayout_reg', 'filter', -1.0, 0.0, 0.0, inregvtype, inregsltype);
        if eq(latency, 1.0)
            hdlregsignal(delayinput);
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(delayinput));
            [delaybody, delaysignals] = hdlunitdelay(current_input, delayinput, 'delay_reg_process', 0.0);
        else
            % 196 198
            hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(delayinput));
            [delaybody, delaysignals] = hdlintdelay(current_input, delayinput, 'delay_reg_process', latency, 0.0);
            % 199 201
        end
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, delaybody);
        hdl_arch_signals = horzcat(hdl_arch_signals, delaysignals);
        current_output = delayinput;
    else
        current_output = current_input;
    end
    % 207 209
    if eq(hdlgetparameter('filter_registered_output'), 1.0)
        [tempname, final_output] = hdlnewsignal('output_register', 'filter', -1.0, 0.0, 0.0, outregvtype, outregsltype);
        hdlregsignal(final_output);
        hdl_arch_signals = horzcat(hdl_arch_signals, makehdlsignaldecl(final_output));
        [tempbody, tempsignals] = hdlunitdelay(current_output, final_output, horzcat('output_reg', hdlgetparameter('clock_process_label')), 0.0);
        % 213 215
        hdl_arch_body_blocks = horzcat(hdl_arch_body_blocks, tempbody);
        hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    else
        final_output = current_output;
    end
    % 219 222
    % 220 222
    [tempbody, tempsignals] = hdlfinalassignment(final_output, entity_output);
    hdl_arch_signals = horzcat(hdl_arch_signals, tempsignals);
    hdl_arch_body_output_assignments = horzcat(hdl_arch_body_output_assignments, tempbody);
    % 224 234
    % 225 234
    % 226 234
    % 227 234
    % 228 234
    % 229 234
    % 230 234
    % 231 234
    % 232 234
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        hdl_entity_library = horzcat(hdl_entity_library, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n\n');
    else
        hdl_entity_library = horzcat(hdl_entity_library, '\n');
    end
    % 238 240
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix')));
        % 241 244
        % 242 244
        archfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix')));
        % 244 247
        % 245 247
        opentype = 'w';
    else
        entityfilename = fullfile(hdlgetparameter('codegendir'), horzcat(nname, hdlgetparameter('filename_suffix')));
        archfilename = entityfilename;
        opentype = 'a';
    end
    % 252 254
    entityfid = fopen(entityfilename, 'w');
    % 254 256
    if eq(entityfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', entityfilename);
    end
    % 258 260
    hdl_entity = horzcat(hdl_entity_comment, hdl_entity_library, hdl_entity_package, hdl_entity_decl, hdl_entity_ports, hdl_entity_portdecls, hdl_entity_end);
    % 260 268
    % 261 268
    % 262 268
    % 263 268
    % 264 268
    % 265 268
    % 266 268
    fprintf(entityfid, hdl_entity);
    fclose(entityfid);
    % 269 271
    archfid = fopen(archfilename, opentype);
    % 271 273
    if eq(archfid, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', archfilename);
    end
    % 275 277
    hdl_arch = horzcat(hdl_arch_comment, hdl_arch_decl, hdl_arch_component_decl, hdl_arch_component_config, hdl_arch_functions, hdl_arch_typedefs, hdl_arch_constants, hdl_arch_signals, hdl_arch_begin, hdl_arch_body_component_instances, hdl_arch_body_blocks, hdl_arch_body_output_assignments, hdl_arch_end);
    % 277 290
    % 278 290
    % 279 290
    % 280 290
    % 281 290
    % 282 290
    % 283 290
    % 284 290
    % 285 290
    % 286 290
    % 287 290
    % 288 290
    fprintf(archfid, hdl_arch);
    fclose(archfid);
    disp(sprintf('%s', hdlcodegenmsgs(7.0)));
end
function [size, bp, signed, vtype, sltype] = setfordouble
    % 294 296
    size = 0.0;
    bp = 0.0;
    signed = true;
    vtype = 'real';
    sltype = 'double';
end
function [size, bp, signed, vtype, sltype] = setportfordouble
    % 302 305
    % 303 305
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
