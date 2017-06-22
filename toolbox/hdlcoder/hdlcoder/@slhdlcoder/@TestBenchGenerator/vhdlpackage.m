function vhdlpackage(this, hdltbcode, tbpkgfid, tbdatafid)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    IOPorts = horzcat(this.InPortSrc, this.OutPortSnk);
    basic_vhdl_types = {'std_logic','std_logic_vector','bit_vector','signed','unsigned','real'};
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    data_resolution = '1.0e-9';
    for m=1.0:length(this.OutportSnk)
        portvtype = this.OutportSnk(m).PortVType;
        if strfind(portvtype, 'vector_of_real')
            hdltbcode.package_functions = horzcat(hdltbcode.package_functions, '  FUNCTION isEqual( x : IN vector_of_real;\n', '                    y : IN vector_of_real) RETURN boolean;\n');
            % 21 23
            % 22 23
            hdltbcode.package_body = horzcat(hdltbcode.package_body, '  FUNCTION isEqual( x : IN vector_of_real;\n', '                    y : IN vector_of_real) RETURN boolean IS\n', '    VARIABLE i      :INTEGER;\n', '    VARIABLE result : boolean;\n', '  BEGIN\n', '    result := TRUE;\n', '    FOR i in 0 to x''length - 1 LOOP\n', '      IF abs(x(i) - y(i)) >', data_resolution, ' THEN\n', '        result := FALSE;\n', '      END IF;\n', '    END LOOP;\n', '    RETURN result;\n', '  END;\n', '\n\n');
            % 24 38
            % 25 38
            % 26 38
            % 27 38
            % 28 38
            % 29 38
            % 30 38
            % 31 38
            % 32 38
            % 33 38
            % 34 38
            % 35 38
            % 36 38
            % 37 38
            break
        end % if
    end % for
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    to_hex_datatypes = basic_vhdl_types;
    % 47 48
    for m=1.0:length(IOPorts)
        openparenpos = strfind(IOPorts(m).PortVType, '(');
        closeparenpos = strfind(IOPorts(m).PortVType, ')');
        if not(isempty(openparenpos))
            basevtype = IOPorts(m).PortVType(1.0:minus(openparenpos, 1.0));
        else
            basevtype = IOPorts(m).PortVType;
        end % if
        if not(any(strcmp(basevtype, to_hex_datatypes)))
            to_hex_datatypes{plus(end, 1.0)} = basevtype;
            hdltbcode.package_functions = horzcat(hdltbcode.package_functions, '  FUNCTION to_hex( x : IN ', basevtype, ') RETURN string;\n');
            % 59 60
            hdltbcode.package_body = horzcat(hdltbcode.package_body, '  FUNCTION to_hex( x : IN ', basevtype, ') RETURN string IS\n', '    VARIABLE result  : STRING(1 TO 256); -- 1024 bits max\n', '    VARIABLE i       : INTEGER;\n', '    VARIABLE j       : INTEGER;\n', '    VARIABLE k       : INTEGER;\n', '    VARIABLE m       : INTEGER;\n', '    VARIABLE newx    : STRING(1 to 32);\n', '  BEGIN\n', '    i := x''LENGTH-1;\n', '    m := to_hex(x(0))''LENGTH;\n', '    newx(1 to m) := to_hex(x(0));\n', '    k := m;\n', '    result(1 to m) := newx(1 to m);\n', '    for j in 1 to i loop\n', '      result(k+1) := '' '';\n', '      k := k+1;\n', '      newx(1 to m) := to_hex(x(j));\n', '      result(k+1 to k+m) := newx(1 to m);\n', '      k := k+m;\n', '    end loop;\n', '    RETURN result(1 TO k);\n', '  END;\n\n');
            % 61 83
            % 62 83
            % 63 83
            % 64 83
            % 65 83
            % 66 83
            % 67 83
            % 68 83
            % 69 83
            % 70 83
            % 71 83
            % 72 83
            % 73 83
            % 74 83
            % 75 83
            % 76 83
            % 77 83
            % 78 83
            % 79 83
            % 80 83
            % 81 83
            % 82 83
        end % if
    end % for
    % 85 88
    % 86 88
    % 87 88
    dataType.VType = {};
    dataType.datalength = [];
    dataType.isConst = 0.0;
    dataType.HDLNewType = {};
    dataTypeIdx = 0.0;
    for m=1.0:length(this.InportSrc)
        type = findType(dataType, this.InportSrc(m));
        if isempty(type)
            dataTypeIdx = plus(dataTypeIdx, 1.0);
            dataType(dataTypeIdx).VType = this.InportSrc(m).PortVType;
            dataType(dataTypeIdx).datalength = this.InportSrc(m).datalength;
            dataType(dataTypeIdx).isConst = this.InportSrc(m).dataIsConstant;
            if eq(this.InportSrc(m).dataIsConstant, 0.0)
                newType = horzcat(this.InportSrc(m).loggingPortName, '_type');
                dataType(dataTypeIdx).HDLNewType = newType;
                this.InportSrc(m).HDLNewType = newType;
                hdltbcode.package_typedefs = horzcat(hdltbcode.package_typedefs, '  TYPE ', newType, ' IS ARRAY (0 TO ', num2str(minus(this.InportSrc(m).datalength, 1.0)), ') OF ', this.InportSrc(m).PortVType, ';\n');
            else
                % 106 107
                dataType(dataTypeIdx).HDLNewType = this.InportSrc(m).PortVType;
                this.InportSrc(m).HDLNewType = this.InportSrc(m).PortVType;
            end % if
        else
            this.InportSrc(m).HDLNewType = type;
        end % if
    end % for
    for m=1.0:length(this.OutportSnk)
        type = findType(dataType, this.OutportSnk(m));
        if isempty(type)
            dataTypeIdx = plus(dataTypeIdx, 1.0);
            newDataType.VType = this.OutportSnk(m).PortVType;
            newDataType.datalength = this.OutportSnk(m).datalength;
            newDataType.isConst = this.OutportSnk(m).dataIsConstant;
            if eq(this.OutportSnk(m).dataIsConstant, 0.0)
                newDataType.HDLNewType = horzcat(this.OutportSnk(m).loggingPortName, '_type');
                this.OutportSnk(m).HDLNewType = newDataType.HDLNewType;
                hdltbcode.package_typedefs = horzcat(hdltbcode.package_typedefs, '  TYPE ', newDataType.HDLNewType, ' IS ARRAY (0 TO ', num2str(minus(this.OutportSnk(m).datalength, 1.0)), ') OF ', this.OutportSnk(m).PortVType, ';\n');
            else
                % 126 127
                newDataType.HDLNewType = this.OutportSnk(m).PortVType;
                this.OutportSnk(m).HDLNewType = this.OutportSnk(m).PortVType;
            end % if
            dataType(dataTypeIdx) = newDataType;
        else
            this.OutportSnk(m).HDLNewType = type;
        end % if
    end % for
    % 135 137
    % 136 137
    for m=1.0:length(this.InportSrc)
        signame = this.InportSrc(m).loggingPortName;
        newtype = this.InportSrc(m).HDLNewType;
        hdltbcode.package_constants = horzcat(hdltbcode.package_constants, '  CONSTANT ', signame, '_force : ', newtype, ';\n');
    end % for
    for m=1.0:length(this.OutportSnk)
        signame = this.OutportSnk(m).loggingPortName;
        newtype = this.OutportSnk(m).HDLNewType;
        hdltbcode.package_constants = horzcat(hdltbcode.package_constants, '  CONSTANT ', signame, '_expected : ', newtype, ';\n');
    end % for
    % 147 149
    % 148 149
    procedureInputs = {'clk','reset','rdenb'};
    procedureOutputs = {'addr','nxt_addr','done'};
    for m=1.0:length(this.InportSrc)
        % 152 153
        [procedureDecl, procedureBody] = hdlprocedure(this, this.InportSrc(m));
        hdltbcode.package_procedure = horzcat(hdltbcode.package_procedure, procedureDecl);
        hdltbcode.package_body = horzcat(hdltbcode.package_body, procedureBody);
        this.InportSrc(m).procedureName = horzcat(this.InportSrc(m).loggingPortName, '_procedure');
        this.InportSrc(m).procedureInput = procedureInputs;
        this.InportSrc(m).procedureOutput = procedureOutputs;
        % 159 160
    end % for
    for m=1.0:length(this.OutportSnk)
        % 162 163
        [prodecureDecl, procedureBody] = hdlprocedure(this, this.OutportSnk(m));
        hdltbcode.package_procedure = horzcat(hdltbcode.package_procedure, prodecureDecl);
        hdltbcode.package_body = horzcat(hdltbcode.package_body, procedureBody);
        this.OutportSnk(m).procedureName = horzcat(this.OutportSnk(m).loggingPortName, '_procedure');
        this.OutportSnk(m).procedureInput = procedureInputs;
        this.OutportSnk(m).procedureOutput = procedureOutputs;
        % 169 170
    end % for
    % 171 173
    % 172 173
    hdltbcode_package = horzcat(hdltbcode.package_comment, hdltbcode.package_library, hdltbcode.package_decl, hdltbcode.package_typedefs, hdltbcode.package_constants, hdltbcode.package_functions, hdltbcode.package_procedure, hdltbcode.package_end, hdltbcode.package_body);
    % 174 183
    % 175 183
    % 176 183
    % 177 183
    % 178 183
    % 179 183
    % 180 183
    % 181 183
    % 182 183
    fprintf(tbpkgfid, hdltbcode_package);
    % 184 187
    % 185 187
    % 186 187
    this.hdlwriteRefData(hdltbcode, tbdatafid);
end % function
function type = findType(dataType, PortInfo)
    % 190 191
    type = [];
    for m=1.0:length(dataType)
        if strcmpi(dataType(m).VType, PortInfo.PortVType)
            if eq(dataType(m).datalength, PortInfo.datalength) && eq(dataType(m).isConst, PortInfo.dataIsConstant)
                % 195 196
                type = dataType(m).HDLNewType;
                break
            end % if
        end % if
    end % for
end % function
function [procedureDecl, procedureBody] = hdlprocedure(this, Src)
    % 203 204
    if gt(Src.datalength, 2.0)
        counter_size = ceil(log2(Src.datalength));
        dataType = horzcat(' unsigned(', num2str(minus(counter_size, 1.0)), ' DOWNTO 0)');
        addrCond = horzcat('        IF (addr = TO_UNSIGNED(', num2str(minus(Src.datalength, 1.0)), ', ', num2str(counter_size), ' )) THEN\n');
        % 208 209
        addrAddOne = horzcat('          addr     <= addr + TO_UNSIGNED(1,', num2str(counter_size), '); \n');
        addrRstValue = horzcat('      addr     <= TO_UNSIGNED(0,', num2str(counter_size), ');\n');
        % 211 212
        nxtAddrRst = horzcat('      nxt_addr <= TO_UNSIGNED(0,', num2str(counter_size), ');\n');
        nxtAddrCond = horzcat('    ELSIF (nxt_addr < TO_UNSIGNED(', num2str(minus(Src.datalength, 1.0)), ', ', num2str(counter_size), ' )) THEN\n');
        % 214 215
        nxtAddrAddOne = horzcat('      nxt_addr <= addr + TO_UNSIGNED(1,', num2str(counter_size), '); \n');
        doneCond = horzcat('    ELSIF (addr = TO_UNSIGNED(', num2str(minus(Src.datalength, 1.0)), ', ', num2str(counter_size), ' )) THEN\n');
    else
        counter_size = Src.datalength;
        dataType = ' std_logic';
        addrCond = '        IF (addr = ''1'') THEN\n';
        addrAddOne = '           addr     <= ''1''; \n';
        addrRstValue = '      addr     <= ''0'';\n';
        nxtAddrRst = '      nxt_addr <= ''0'';\n';
        nxtAddrCond = '    ELSIF (nxt_addr /= ''1'') THEN\n';
        nxtAddrAddOne = '      nxt_addr <= ''1''; \n';
        doneCond = '    ELSIF (addr = ''1'') THEN\n';
    end % if
    rassertval = sprintf('''%d''', this.ForceResetValue);
    % 229 230
    procedureIF = horzcat('  PROCEDURE ', Src.loggingPortName, '_procedure \n', '    (SIGNAL clk      : IN    std_logic;\n', '     SIGNAL reset    : IN    std_logic;\n', '     SIGNAL rdenb    : IN    std_logic;\n', '     SIGNAL addr     : INOUT', dataType, ';\n', '     SIGNAL nxt_addr : INOUT', dataType, ';\n', '     SIGNAL done     : OUT   std_logic');
    % 231 238
    % 232 238
    % 233 238
    % 234 238
    % 235 238
    % 236 238
    % 237 238
    counter = horzcat('    IF reset  = ', rassertval, ' THEN\n', addrRstValue, '    ELSIF clk''event and clk = ''1'' THEN\n', '      IF rdenb = ''1'' THEN\n', addrCond, '          addr     <= addr; \n', '        ELSE\n', addrAddOne, '        END IF;\n', '      ELSE \n', '        addr <= addr;\n', '      END IF;\n', '    END IF;\n\n');
    % 239 253
    % 240 253
    % 241 253
    % 242 253
    % 243 253
    % 244 253
    % 245 253
    % 246 253
    % 247 253
    % 248 253
    % 249 253
    % 250 253
    % 251 253
    % 252 253
    nxt_addr = horzcat('    IF reset  = ', rassertval, ' THEN\n', nxtAddrRst, nxtAddrCond, nxtAddrAddOne, '    END IF;\n\n');
    % 254 259
    % 255 259
    % 256 259
    % 257 259
    % 258 259
    done_signal = horzcat('    IF reset  = ', rassertval, ' THEN\n', '      done <= ''0''; \n', doneCond, '      done <= ''1''; \n', '    ELSE\n', '      done <= ''0''; \n', '    END IF;\n');
    % 260 267
    % 261 267
    % 262 267
    % 263 267
    % 264 267
    % 265 267
    % 266 267
    procedureDecl = horzcat(procedureIF, ');\n\n');
    % 268 269
    procedureBody = horzcat(procedureIF, ') IS\n', '  BEGIN\n', '-- Counter to generate Addr.\n', counter, '-- Next Address to get reference data in advance.\n', nxt_addr, '-- Done Signal generation.\n', done_signal, '  END ', Src.loggingPortName, '_procedure;\n\n');
    % 270 277
    % 271 277
    % 272 277
    % 273 277
    % 274 277
    % 275 277
    % 276 277
end % function
