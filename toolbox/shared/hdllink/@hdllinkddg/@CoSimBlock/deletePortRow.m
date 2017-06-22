function deletePortRow(this, dialog)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if eq(this.NumPortRows, 1.0)
        return;
    end % if
    % 13 15
    % 14 15
    this.DisableList = true;
    % 16 18
    % 17 18
    [pStartInd, pEndInd] = this.parseString(this.PortPaths, ';', 'deleteRow', this.CurPortRow, this.NumPortRows);
    % 19 22
    % 20 22
    % 21 22
    pm = eval(this.PortModes);
    pm = horzcat(pm(1.0:minus(this.CurPortRow, 1.0)), pm(plus(this.CurPortRow, 1.0):end));
    % 24 25
    [tStartInd, tEndInd] = this.parseString(this.PortTimes, ',', 'deleteRow', this.CurPortRow, this.NumPortRows);
    % 26 28
    % 27 28
    ps = eval(this.PortSigns);
    ps = horzcat(ps(1.0:minus(this.CurPortRow, 1.0)), ps(plus(this.CurPortRow, 1.0):end));
    % 30 31
    [fStartInd, fEndInd] = this.parseString(this.PortFracLengths, ',', 'deleteRow', this.CurPortRow, this.NumPortRows);
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    set(this, 'PortPaths', horzcat(this.PortPaths(1.0:minus(pStartInd, 1.0)), this.PortPaths(plus(pEndInd, 1.0):end)), 'PortModes', horzcat('[', sprintf('%d ', pm), ']'), 'PortTimes', horzcat(this.PortTimes(1.0:minus(tStartInd, 1.0)), this.PortTimes(plus(tEndInd, 1.0):end)), 'PortSigns', horzcat('[', sprintf('%d ', ps), ']'), 'PortFracLengths', horzcat(this.PortFracLengths(1.0:minus(fStartInd, 1.0)), this.PortFracLengths(plus(fEndInd, 1.0):end)));
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    this.NumPortRows = minus(this.NumPortRows, 1.0);
    if gt(this.CurPortRow, this.NumPortRow)
        this.CurPortRow = this.NumPortRow;
    end % if
    % 50 51
    this.enableApplyButton(dialog);
    % 52 54
    % 53 54
    this.DisableList = false;
end % function
