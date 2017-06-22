function [ports, declarations, instance] = hdlentityports(name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlgetparameter('isvhdl')
        [ports, declarations] = localvhdlentityports;
    else
        if hdlgetparameter('isverilog')
            [ports, declarations] = localverilogentityports;
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end
    end
    if eq(nargin, 1.0)
        % 16 18
        if hdlgetparameter('isvhdl')
            instance = localvhdlinstance(name);
        else
            if hdlgetparameter('isverilog')
                instance = localveriloginstance(name);
            end
        end
    else
        instance = '';
    end
end
function [ports, declarations] = localvhdlentityports
    % 29 31
    ports = '   PORT( ';
    declarations = '';
    firstone = 1.0;
    portlist = horzcat(hdlinportsignals, hdloutportsignals);
    for n=1.0:length(portlist)
        name = hdlsignalname(portlist(n));
        vtype = hdlsignalvtype(portlist(n));
        sltype = hdlsignalsltype(portlist(n));
        vector = hdlsignalvector(portlist(n));
        % 39 42
        % 40 42
        if strcmp(sltype, 'boolean')
            comment = '';
        else
            comment = horzcat(hdlgetparameter('comment_char'), ' ', sltype);
        end
        % 46 48
        if hdlisinportsignal(portlist(n))
            portdir = 'IN ';
        else
            portdir = 'OUT';
        end
        % 52 54
        if firstone
            ports = horzcat(ports, sprintf('%-32s:   %s   %s; %s\n', name, portdir, vtype, comment));
            firstone = 0.0;
        else
            ports = horzcat(ports, sprintf('         %-32s:   %s   %s; %s\n', name, portdir, vtype, comment));
        end
        % 59 61
    end % for
    % 61 64
    % 62 64
    lastsemi = find(eq(ports, ';'));
    ports(lastsemi(end)) = ' ';
    % 65 67
    ports = horzcat(ports, '         );\n');
end
function [ports, declarations] = localverilogentityports
    % 69 73
    % 70 73
    % 71 73
    ports = '\n               (\n                ';
    declarations = '';
    % 74 76
    portlist = horzcat(hdlinportsignals, hdloutportsignals);
    for n=1.0:length(portlist)
        name = hdlsignalname(portlist(n));
        vtype = hdlsignalvtype(portlist(n));
        sltype = hdlsignalsltype(portlist(n));
        vector = hdlsignalvector(portlist(n));
        [size, bp, signed] = hdlwordsize(sltype);
        % 82 84
        if eq(size, 0.0)
            vtype = 'wire [63:0]';
        end
        % 86 89
        % 87 89
        if strcmp(sltype, 'boolean')
            comment_str = '';
        else
            comment_str = horzcat(hdlgetparameter('comment_char'), sltype);
        end
        % 93 95
        dtype = '';
        lenvtype = length(vtype);
        if strcmp(vtype(1.0:3.0), 'reg') && gt(lenvtype, 4.0)
            dtype = vtype(4.0:end);
        else
            if strcmp(vtype(1.0:4.0), 'wire') && gt(lenvtype, 5.0)
                dtype = vtype(5.0:end);
            end
        end
        if hdlisinportsignal(portlist(n))
            declarations = horzcat(declarations, '  input ');
        else
            declarations = horzcat(declarations, '  output');
        end
        declarations = horzcat(declarations, sprintf(' %s %s; %s\n', dtype, name, comment_str));
        ports = horzcat(ports, name, ',\n                ');
    end % for
    % 111 114
    % 112 114
    ports = horzcat(ports(1.0:minus(end, 19.0)), '\n                );\n\n');
    declarations = horzcat(declarations, '\n');
end
function instance = localveriloginstance(name)
    % 117 120
    % 118 120
    portnames = hdlentityportnames;
    portmap = '';
    for n=1.0:length(portnames)
        portmap = horzcat(portmap, '    .', portnames{n}, '(', portnames{n}, ')', ',\n');
        % 123 126
        % 124 126
    end % for
    portmap = portmap(1.0:minus(end, 3.0));
    % 127 129
    instance = horzcat('  ', name, ' u_', name, '\n', '    (\n', portmap, '\n    );\n\n');
    % 129 132
    % 130 132
end
function instance = localvhdlinstance(name)
    % 133 138
    % 134 138
    % 135 138
    % 136 138
    portnames = hdlentityportnames;
    portmap = '';
    for n=1.0:length(portnames)
        portmap = horzcat(portmap, sprintf('              %-32s', portnames{n}), ' => ', portnames{n}, ',\n');
        % 141 144
        % 142 144
    end % for
    portmap = portmap(1.0:minus(end, 3.0));
    % 145 147
    instance = horzcat('  u_', name, ': ', name, '\n', '    PORT MAP (\n', portmap, '      );\n\n');
    % 147 150
    % 148 150
end
