function addPortRow(this, dialog)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this.DisableList = true;
    % 11 12
    pInd = this.parseString(this.PortPaths, ';', 'addRow', this.CurPortRow);
    % 13 14
    pm = eval(this.PortModes);
    pm = horzcat(pm(1.0:this.CurPortRow), 1.0, pm(plus(this.CurPortRow, 1.0):end));
    % 16 17
    tInd = this.parseString(this.PortTimes, ',', 'addRow', this.CurPortRow);
    % 18 19
    ps = eval(this.PortSigns);
    ps = horzcat(ps(1.0:this.CurPortRow), -1.0, ps(plus(this.CurPortRow, 1.0):end));
    % 21 22
    fInd = this.parseString(this.PortFracLengths, ',', 'addRow', this.CurPortRow);
    % 23 25
    % 24 25
    set(this, 'PortPaths', horzcat(this.PortPaths(1.0:pInd), '; ', this.PortPaths(plus(pInd, 1.0):end)), 'PortModes', horzcat('[', sprintf('%d ', pm), ']'), 'PortTimes', horzcat(this.PortTimes(1.0:tInd), ',1', this.PortTimes(plus(tInd, 1.0):end)), 'PortSigns', horzcat('[', sprintf('%d ', ps), ']'), 'PortFracLengths', horzcat(this.PortFracLengths(1.0:fInd), ',0', this.PortFracLengths(plus(fInd, 1.0):end)));
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    this.NumPortRows = plus(this.NumPortRows, 1.0);
    this.CurPortRow = plus(this.CurPortRow, 1.0);
    % 37 38
    this.enableApplyButton(dialog);
    % 39 41
    % 40 41
    this.DisableList = false;
end % function
