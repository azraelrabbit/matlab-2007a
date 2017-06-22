function hdlbody = vhdlreadDataProc(this, rdenb, txdataCnt, instance, clkrate)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlbody = [];
    vector = this.InportSrc(instance).VectorPortSize;
    sltype = this.InportSrc(instance).PortSLType;
    dataSufix = 'force';
    processName = 'stimuli';
    signame = this.InportSrc(instance).HDLPortName;
    % 12 15
    % 13 15
    if strcmpi(sltype, 'double')
        value = '1.0E-9';
    else
        if strcmp(sltype, 'boolean') || strcmpi(sltype, 'ufix1')
            value = '''X''';
        else
            value = '( OTHERS => ''X'')';
        end % if
    end % if
    if eq(vector, 1.0)
        vectorvalue = value;
    else
        vectorvalue = horzcat('( OTHERS => ', value, ')');
    end % if
    vectorset = horzcat(' <= ', vectorvalue);
    % 29 32
    % 30 32
    if gt(clkrate, 1.0)
        hdlbody = horzcat(hdlbody, '  ', processName, '_', num2str(instance), ': PROCESS(', this.ClockName, ', ', this.ResetName, ')\n');
        % 33 35
        hdlbody = horzcat(hdlbody, '  BEGIN\n', '   IF ', this.ResetName, ' = ''1'' THEN\n');
        % 35 39
        % 36 39
        % 37 39
        for i=1.0:length(this.InportSrc(instance).HDLPortName)
            hdlbody = horzcat(hdlbody, '      ', signame{i}, vectorset, ';\n');
            % 40 42
        end % for
        % 42 44
        hdlbody = horzcat(hdlbody, '   ELSIF ', this.ClockName, '''event AND ', this.ClockName, ' = ''1'' THEN\n');
    else
        % 45 47
        % 46 48
        if isempty(txdataCnt)
            hdlbody = horzcat(hdlbody, '  ', processName, '_', num2str(instance), ': PROCESS(', hdlsignalname(rdenb), ')\n');
        else
            % 50 52
            hdlbody = horzcat(hdlbody, '  ', processName, '_', num2str(instance), ': PROCESS(', hdlsignalname(rdenb), ', ', hdlsignalname(txdataCnt), ')\n');
            % 52 54
        end % if
        hdlbody = horzcat(hdlbody, '  BEGIN\n');
        % 55 57
    end % if
    % 57 59
    hdlbody = horzcat(hdlbody, '    IF ', hdlsignalname(rdenb), ' = ''1'' THEN\n');
    % 59 62
    % 60 62
    force_data = this.InportSrc(instance).data;
    if isempty(force_data)
        hdlbody = horzcat(hdlbody, hdlgetparameter('comment_char'), ' No Input data for %s ', signame);
    else
        if eq(this.InportSrc(instance).dataIsConstant, 1.0)
            for i=1.0:length(signame)
                hdlbody = horzcat(hdlbody, '      ', signame{i}, ' <= ', this.InportSrc(instance).loggingPortName, '_', dataSufix, ' After ', this.ClockName, '_hold;\n');
                % 68 70
            end % for
        else
            for i=1.0:length(signame)
                hdlbody = horzcat(hdlbody, '      ', signame{i}, ' <= ', this.InportSrc(instance).loggingPortName, '_', dataSufix, '(TO_INTEGER(', hdlsignalname(txdataCnt), ')) After ', this.ClockName, '_hold;\n');
                % 73 75
            end % for
        end % if
        % 76 78
    end % if
    if gt(clkrate, 1.0)
        hdlbody = horzcat(hdlbody, '    END IF;\n', '   END IF;\n');
    else
        % 81 83
        hdlbody = horzcat(hdlbody, '    ELSE\n');
        for i=1.0:length(this.InportSrc(instance).HDLPortName)
            hdlbody = horzcat(hdlbody, '      ', signame{i}, vectorset, ';\n');
            % 85 87
        end % for
        hdlbody = horzcat(hdlbody, '    END IF;\n');
        % 88 90
    end % if
    % 90 92
    hdlbody = horzcat(hdlbody, '  END PROCESS ', processName, '_', num2str(instance), ';\n\n');
end % function
