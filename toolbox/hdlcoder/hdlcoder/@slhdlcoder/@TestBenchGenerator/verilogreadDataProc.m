function hdlbody = verilogreadDataProc(this, rdenb, txdataCnt, instance, clkrate)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlbody = [];
    vector = this.InportSrc(instance).VectorPortSize;
    sltype = this.InportSrc(instance).PortSLType;
    if gt(vector, 1.0)
        Sizes = max(hdlsignalsizes(hdlsignalfindname(this.InportSrc(instance).HDLPortName{1.0}{1.0})));
    else
        Sizes = max(hdlsignalsizes(hdlsignalfindname(this.InportSrc(instance).HDLPortName{1.0})));
    end % if
    dataSuffix = 'force';
    processName = 'stimuli';
    signame = this.InportSrc(instance).HDLPortName;
    % 17 19
    if strcmpi(sltype, 'double')
        vectorset = ' <= 1.0E-9';
    else
        if strcmp(sltype, 'boolean') || strcmpi(sltype, 'ufix1')
            vectorset = ' <= 1''bx';
        else
            vectorset = horzcat(' <= ', num2str(Sizes), '''bx');
            % 25 27
        end % if
        % 27 29
    end % if
    if eq(this.ForceResetValue, 0.0)
        reset_edge = 'negedge';
        reset_inv = '~';
    else
        reset_edge = 'posedge';
        reset_inv = '';
    end % if
    if gt(vector, 1.0)
        for i=1.0:length(signame)
            processName = horzcat(processName, '_', this.InportSrc(instance).HDLPortName{i}{1.0});
        end % for
    else
        for i=1.0:length(signame)
            processName = horzcat(processName, '_', this.InportSrc(instance).HDLPortName{i});
        end % for
    end % if
    % 45 47
    morespace = '';
    if gt(clkrate, 1.0)
        hdlbody = horzcat(hdlbody, '  always @ (posedge ', this.ClockName, ' or ', reset_edge, ' ', this.ResetName, ')\n', '  begin ', hdlgetparameter('comment_char'), ' ', processName, '\n', '    if (', reset_inv, this.ResetName, ') begin \n');
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        more_space = '  ';
        for i=length(this.InportSrc(instance).HDLPortName)
            if gt(vector, 1.0)
                for j=1.0:vector
                    hdlbody = horzcat(hdlbody, '      ', signame{i}{j}, vectorset, ';\n');
                    % 58 60
                end % for
            else
                hdlbody = horzcat(hdlbody, '      ', signame{i}, vectorset, ';\n');
                % 62 64
            end % if
        end % for
        hdlbody = horzcat(hdlbody, '    end\n', '    else begin\n');
    else
        % 67 69
        % 68 70
        if isempty(txdataCnt)
            hdlbody = horzcat(hdlbody, '  always @ (', hdlsignalname(rdenb), ')\n', '  begin ');
        else
            % 72 74
            % 73 75
            hdlbody = horzcat(hdlbody, '  always @ (', hdlsignalname(rdenb), ', ', hdlsignalname(txdataCnt), ')\n', '  begin ');
            % 75 78
            % 76 78
        end % if
        % 78 80
        hdlbody = horzcat(hdlbody, hdlgetparameter('comment_char'), ' ', processName, '\n');
        % 80 83
        % 81 83
    end % if
    % 83 85
    hdlbody = horzcat(hdlbody, morespace, '    if (', hdlsignalname(rdenb), ' == 1) begin\n');
    % 85 88
    % 86 88
    force_data = this.InportSrc(instance).data;
    % 88 90
    if isempty(force_data)
        hdlbody = horzcat(hdlbody, hdlgetparameter('comment_char'), ' No Input data for %s ', signame);
    else
        if eq(this.InportSrc(instance).dataIsConstant, 1.0)
            for i=1.0:length(signame)
                if gt(vector, 1.0)
                    for j=1.0:vector
                        hdlbody = horzcat(hdlbody, morespace, '      ', signame{i}{j}, ' <= ', this.InportSrc(instance).loggingPortName, '_', num2str(j), '_', dataSuffix, ';\n');
                        % 97 101
                        % 98 101
                        % 99 101
                    end % for
                else
                    hdlbody = horzcat(hdlbody, morespace, '      ', signame{i}, ' <= ', this.InportSrc(instance).loggingPortName, '_', dataSuffix, ';\n');
                    % 103 106
                    % 104 106
                end % if
            end % for
        else
            for i=1.0:length(signame)
                if gt(vector, 1.0)
                    for j=1.0:vector
                        hdlbody = horzcat(hdlbody, morespace, '      ', signame{i}{j}, ' <= # ', this.ClockName, '_hold ', this.InportSrc(instance).loggingPortName, '_', num2str(j), '_', dataSuffix, '[', hdlsignalname(txdataCnt), '];\n');
                        % 112 116
                        % 113 116
                        % 114 116
                    end % for
                else
                    hdlbody = horzcat(hdlbody, morespace, '      ', signame{i}, ' <= # ', this.ClockName, '_hold ', this.InportSrc(instance).loggingPortName, '_', dataSuffix, '[', hdlsignalname(txdataCnt), '];\n');
                    % 118 121
                    % 119 121
                end % if
            end % for
        end % if
        % 123 126
        % 124 126
    end % if
    if gt(clkrate, 1.0)
        hdlbody = horzcat(hdlbody, '      end\n', '    end\n');
    else
        % 129 131
        hdlbody = horzcat(hdlbody, '    end\n', '    else begin \n');
        % 131 134
        % 132 134
        for i=1.0:length(this.InportSrc(instance).HDLPortName)
            if gt(vector, 1.0)
                for j=1.0:vector
                    hdlbody = horzcat(hdlbody, '      ', signame{i}{j}, vectorset, ';\n');
                    % 137 139
                end % for
            else
                hdlbody = horzcat(hdlbody, '      ', signame{i}, vectorset, ';\n');
                % 141 143
            end % if
        end % for
        hdlbody = horzcat(hdlbody, '    end\n');
        % 145 147
    end % if
    % 147 149
    hdlbody = horzcat(hdlbody, '  end ', hdlgetparameter('comment_char'), ' ', processName, '\n\n');
end % function
