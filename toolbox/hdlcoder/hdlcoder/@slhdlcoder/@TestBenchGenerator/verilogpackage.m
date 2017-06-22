function hdltbcode = verilogpackage(this, hdltbcode, tbpkgfid, tbdatafid)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    task_suffix = '_task';
    % 7 156
    % 8 156
    % 9 156
    % 10 156
    % 11 156
    % 12 156
    % 13 156
    % 14 156
    % 15 156
    % 16 156
    % 17 156
    % 18 156
    % 19 156
    % 20 156
    % 21 156
    % 22 156
    % 23 156
    % 24 156
    % 25 156
    % 26 156
    % 27 156
    % 28 156
    % 29 156
    % 30 156
    % 31 156
    % 32 156
    % 33 156
    % 34 156
    % 35 156
    % 36 156
    % 37 156
    % 38 156
    % 39 156
    % 40 156
    % 41 156
    % 42 156
    % 43 156
    % 44 156
    % 45 156
    % 46 156
    % 47 156
    % 48 156
    % 49 156
    % 50 156
    % 51 156
    % 52 156
    % 53 156
    % 54 156
    % 55 156
    % 56 156
    % 57 156
    % 58 156
    % 59 156
    % 60 156
    % 61 156
    % 62 156
    % 63 156
    % 64 156
    % 65 156
    % 66 156
    % 67 156
    % 68 156
    % 69 156
    % 70 156
    % 71 156
    % 72 156
    % 73 156
    % 74 156
    % 75 156
    % 76 156
    % 77 156
    % 78 156
    % 79 156
    % 80 156
    % 81 156
    % 82 156
    % 83 156
    % 84 156
    % 85 156
    % 86 156
    % 87 156
    % 88 156
    % 89 156
    % 90 156
    % 91 156
    % 92 156
    % 93 156
    % 94 156
    % 95 156
    % 96 156
    % 97 156
    % 98 156
    % 99 156
    % 100 156
    % 101 156
    % 102 156
    % 103 156
    % 104 156
    % 105 156
    % 106 156
    % 107 156
    % 108 156
    % 109 156
    % 110 156
    % 111 156
    % 112 156
    % 113 156
    % 114 156
    % 115 156
    % 116 156
    % 117 156
    % 118 156
    % 119 156
    % 120 156
    % 121 156
    % 122 156
    % 123 156
    % 124 156
    % 125 156
    % 126 156
    % 127 156
    % 128 156
    % 129 156
    % 130 156
    % 131 156
    % 132 156
    % 133 156
    % 134 156
    % 135 156
    % 136 156
    % 137 156
    % 138 156
    % 139 156
    % 140 156
    % 141 156
    % 142 156
    % 143 156
    % 144 156
    % 145 156
    % 146 156
    % 147 156
    % 148 156
    % 149 156
    % 150 156
    % 151 156
    % 152 156
    % 153 156
    % 154 156
    % 155 156
    hdltbcode.package_procedure = '';
    hdltbcode.package_body = '';
    procedureInputs = {'clk','reset','rdenb'};
    procedureOutputs = {'addr','nxt_addr','done'};
    for m=1.0:length(this.InportSrc)
        % 161 162
        [procedureDecl, procedureBody] = hdlprocedure(this, this.InportSrc(m));
        hdltbcode.package_procedure = horzcat(hdltbcode.package_procedure, procedureDecl);
        hdltbcode.package_body = horzcat(hdltbcode.package_body, procedureBody);
        this.InportSrc(m).procedureName = horzcat(this.InportSrc(m).loggingPortName, task_suffix);
        this.InportSrc(m).procedureInput = procedureInputs;
        this.InportSrc(m).procedureOutput = procedureOutputs;
        % 168 169
    end % for
    for m=1.0:length(this.OutportSnk)
        % 171 172
        [procedureDecl, procedureBody] = hdlprocedure(this, this.OutportSnk(m));
        hdltbcode.package_procedure = horzcat(hdltbcode.package_procedure, procedureDecl);
        hdltbcode.package_body = horzcat(hdltbcode.package_body, procedureBody);
        this.OutportSnk(m).procedureName = horzcat(this.OutportSnk(m).loggingPortName, task_suffix);
        this.OutportSnk(m).procedureInput = procedureInputs;
        this.OutportSnk(m).procedureOutput = procedureOutputs;
        % 178 179
    end % for
    % 180 190
    % 181 190
    % 182 190
    % 183 190
    % 184 190
    % 185 190
    % 186 190
    % 187 190
    % 188 190
    % 189 190
    hdltbcode_package = horzcat(hdltbcode.entity_comment, hdltbcode.package_procedure, hdltbcode.entity_package, hdltbcode.entity_decl, hdltbcode.package_body, hdltbcode.arch_constants);
    % 191 200
    % 192 200
    % 193 200
    % 194 200
    % 195 200
    % 196 200
    % 197 200
    % 198 200
    % 199 200
    fprintf(tbpkgfid, hdltbcode_package);
    % 201 203
    % 202 203
    hdltbcode.entity_comment = '';
    hdltbcode.package_procedure = '';
    hdltbcode.entity_package = '';
    hdltbcode.entity_decl = '';
    hdltbcode.package_body = '';
    hdltbcode.arch_constants = '';
    % 209 212
    % 210 212
    % 211 212
    this.hdlwriteRefData(hdltbcode, tbdatafid);
end % function
function [procedureDecl, procedureBody] = hdlprocedure(this, Src)
    % 215 230
    % 216 230
    % 217 230
    % 218 230
    % 219 230
    % 220 230
    % 221 230
    % 222 230
    % 223 230
    % 224 230
    % 225 230
    % 226 230
    % 227 230
    % 228 230
    % 229 230
    task_suffix = '_task';
    cchar = hdlgetparameter('comment_char');
    % 232 233
    if gt(Src.datalength, 1.0)
        counter_size = ceil(log2(Src.datalength));
        dataType = horzcat(' [', num2str(minus(counter_size, 1.0)), ':0] ');
        addrCond = horzcat('        if (addr == ', num2str(minus(Src.datalength, 1.0)), ')\n');
        addrAddOne = '          addr = addr + 1; \n';
        addrRstValue = '      addr = 0;\n';
        % 239 240
        nxtAddrRst = '      nxt_addr = 0;\n';
        nxtAddrCond = horzcat('    else if (nxt_addr < ', num2str(minus(Src.datalength, 1.0)), ')\n');
        nxtAddrAddOne = '      nxt_addr = addr + 1; \n';
        % 243 244
        doneCond = horzcat('    else if (addr == ', num2str(minus(Src.datalength, 1.0)), ')\n');
    else
        % 246 247
        dataType = ' ';
        addrCond = '        if (addr == 1) \n';
        addrAddOne = '            addr = 1; \n';
        addrRstValue = '      addr = 0;\n';
        % 251 252
        nxtAddrRst = '      nxt_addr = 0;\n';
        nxtAddrCond = '    else if (nxt_addr != 1)\n';
        nxtAddrAddOne = '      nxt_addr = 1;\n';
        % 255 256
        doneCond = '  else if (addr == 1)\n';
    end % if
    % 258 259
    rassertval = sprintf('%d', this.ForceResetValue);
    if eq(this.ForceResetValue, 0.0)
        reset_edge = 'negedge';
    else
        reset_edge = 'posedge';
    end % if
    % 265 266
    sp = ' ';
    dtype_space = eval(horzcat('sprintf(''%', num2str(length(dataType)), 's'',sp)'));
    % 268 269
    procedureIF = horzcat('  task ', Src.loggingPortName, task_suffix, '; \n', '    input ', dtype_space, ' clk;\n', '    input ', dtype_space, ' reset;\n', '    input ', dtype_space, ' rdenb;\n', '    inout ', dataType, ' addr;\n', '    inout ', dataType, ' nxt_addr;\n', '    output ', dtype_space, 'done;');
    % 270 277
    % 271 277
    % 272 277
    % 273 277
    % 274 277
    % 275 277
    % 276 277
    counter = horzcat('    if (reset == ', rassertval, ') \n', addrRstValue, '    else begin\n', '      if (rdenb == 1) begin\n', addrCond, '          addr = addr; \n', '        else\n', addrAddOne, '      end\n', '    end\n');
    % 278 288
    % 279 288
    % 280 288
    % 281 288
    % 282 288
    % 283 288
    % 284 288
    % 285 288
    % 286 288
    % 287 288
    nxt_addr = horzcat('    if (reset == ', rassertval, ')\n', nxtAddrRst, nxtAddrCond, nxtAddrAddOne);
    % 289 293
    % 290 293
    % 291 293
    % 292 293
    done_signal = horzcat('    if (reset == ', rassertval, ')\n', '      done = 0; \n', doneCond, '      done = 1; \n', '    else\n', '      done = 0; \n');
    % 294 300
    % 295 300
    % 296 300
    % 297 300
    % 298 300
    % 299 300
    procedureDecl = '';
    % 301 304
    % 302 304
    % 303 304
    procedureBody = horzcat(procedureIF, '\n', '  begin\n\n', '    ', cchar, ' Counter to generate the address\n', counter, '\n', '    ', cchar, ' Next Address to get reference data in advance.\n', nxt_addr, '\n', '    ', cchar, ' Done Signal generation.\n', done_signal, '\n', '  end\n  endtask ', cchar, ' ', Src.loggingPortName, task_suffix, '\n\n');
    % 305 312
    % 306 312
    % 307 312
    % 308 312
    % 309 312
    % 310 312
    % 311 312
end % function
