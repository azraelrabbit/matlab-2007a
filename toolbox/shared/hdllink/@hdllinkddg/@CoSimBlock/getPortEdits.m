function [path, mode, time, sign, frac] = getPortEdits(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    PortPaths = strread(this.PortPaths, '%s', 'delimiter', ';', 'whitespace', '');
    PortModes = eval(this.PortModes);
    PortTimes = strread(this.PortTimes(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
    % 12 13
    PortSigns = eval(this.PortSigns);
    PortFracs = strread(this.PortFracLengths(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
    % 15 17
    % 16 17
    path = strtrim(PortPaths{this.CurPortRow});
    if eq(PortModes(this.CurPortRow), 1.0)
        mode = 'Input';
        time = 'N/A';
        sign = 'Inherit';
        frac = 'N/A';
    else
        mode = 'Output';
        time = strtrim(PortTimes{this.CurPortRow});
        switch PortSigns(this.CurPortRow)
        case -1.0
            sign = 'Inherit';
            frac = 'N/A';
        case 0.0
            sign = 'Unsigned';
            frac = strtrim(PortFracs{this.CurPortRow});
        case 1.0
            sign = 'Signed';
            frac = strtrim(PortFracs{this.CurPortRow});
        end % switch
    end % if
end % function
