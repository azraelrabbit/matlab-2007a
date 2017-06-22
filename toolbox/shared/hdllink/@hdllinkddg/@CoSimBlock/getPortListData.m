function data = getPortListData(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    data = cell(1.0, this.NumPortRows);
    % 10 11
    if gt(this.NumPortRows, 0.0)
        PortPaths = strread(this.PortPaths, '%s', 'delimiter', ';', 'whitespace', '');
        PortModes = eval(this.PortModes);
        PortTimes = strread(this.PortTimes(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
        % 15 16
        PortSigns = eval(this.PortSigns);
        PortFracs = strread(this.PortFracLengths(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
        % 18 20
        % 19 20
        formatStr = this.getPortFormatString('all');
        % 21 22
        for ii=1.0:this.NumPortRows
            path = PortPaths{ii};
            pathStrLen = this.getPortFormatString('pathLength');
            if gt(length(path), pathStrLen)
                path = horzcat('...', path(plus(minus(end, pathStrLen), 4.0):end));
            end % if
            if isequal(PortModes(ii), 1.0)
                data{1.0, ii} = sprintf(formatStr, path, 'Input', 'N/A', 'N/A', 'N/A');
            else
                % 31 32
                switch PortSigns(ii)
                case -1.0
                    signStr = 'Inherit';
                    fracStr = 'N/A';
                case 0.0
                    signStr = 'Unsigned';
                    fracStr = PortFracs{ii};
                case 1.0
                    signStr = 'Signed';
                    fracStr = PortFracs{ii};
                end % switch
                data{1.0, ii} = sprintf(formatStr, path, 'Output', PortTimes{ii}, signStr, fracStr);
                % 44 49
                % 45 49
                % 46 49
                % 47 49
                % 48 49
            end % if
        end % for
    end % if
end % function
