function changePortRow(this, dialog)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    this.DisableList = true;
    % 10 13
    % 11 13
    [pStartInd, pEndInd] = this.parseString(this.PortPaths, ';', 'changeRow', this.CurPortRow, this.NumPortRows);
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    newPath = this.stripPath(this.PortPathEdit);
    if isempty(newPath)
        newPath = ' ';
    end % if
    % 22 24
    pm = eval(this.PortModes);
    ps = eval(this.PortSigns);
    % 25 27
    switch this.PortModeEdit
    case 'Input'
        pm = horzcat(pm(1.0:minus(this.CurPortRow, 1.0)), 1.0, pm(plus(this.CurPortRow, 1.0):end));
        % 29 31
        newSign = ps(this.CurPortRow);
        pt = this.PortTimes;
        pfl = this.PortFracLengths;
    case 'Output'
        pm = horzcat(pm(1.0:minus(this.CurPortRow, 1.0)), 2.0, pm(plus(this.CurPortRow, 1.0):end));
        % 35 37
        newTime = strtrim(this.PortTimeEdit);
        if isempty(newTime)
            newTime = ' ';
        end % if
        if strcmp(newTime, 'N/A')
            pt = this.PortTimes;
        else
            % 43 45
            [tStartInd, tEndInd] = this.parseString(this.PortTimes, ',', 'changeRow', this.CurPortRow, this.NumPortRows);
            % 45 50
            % 46 50
            % 47 50
            % 48 50
            pt = horzcat(this.PortTimes(1.0:minus(tStartInd, 1.0)), newTime, this.PortTimes(plus(tEndInd, 1.0):end));
            % 50 53
            % 51 53
        end % if
        % 53 55
        switch this.PortSignEdit
        case 'Signed'
            newSign = 1.0;
        case 'Unsigned'
            newSign = 0.0;
        case 'Inherit'
            newSign = -1.0;
        end % switch
        % 62 64
        newFrac = strtrim(this.PortFracEdit);
        if isempty(newFrac)
            newFrac = ' ';
        end % if
        if strcmp(newFrac, 'N/A')
            pfl = this.PortFracLengths;
        else
            % 70 72
            [fStartInd, fEndInd] = this.parseString(this.PortFracLengths, ',', 'changeRow', this.CurPortRow, this.NumPortRows);
            % 72 77
            % 73 77
            % 74 77
            % 75 77
            pfl = horzcat(this.PortFracLengths(1.0:minus(fStartInd, 1.0)), newFrac, this.PortFracLengths(plus(fEndInd, 1.0):end));
            % 77 80
            % 78 80
        end % if
    otherwise
        % 81 83
        error('CoSim::changePortRow: invalid port mode')
    end % switch
    % 84 86
    ps = horzcat(ps(1.0:minus(this.CurPortRow, 1.0)), newSign(1.0), ps(plus(this.CurPortRow, 1.0):end));
    % 86 88
    set(this, 'PortPaths', horzcat(this.PortPaths(1.0:minus(pStartInd, 1.0)), newPath, this.PortPaths(plus(pEndInd, 1.0):end)), 'PortModes', horzcat('[', sprintf('%d ', pm), ']'), 'PortTimes', pt, 'PortSigns', horzcat('[', sprintf('%d ', ps), ']'), 'PortFracLengths', pfl);
    % 88 97
    % 89 97
    % 90 97
    % 91 97
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    dialog.enableApplyButton(true);
    % 97 100
    % 98 100
    this.DisableList = false;
