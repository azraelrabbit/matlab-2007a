function loadFromBlock(this)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    UNUSED_VAR_STR = '{''UNUSED_VAR''}';
    % 19 20
    if strcmp(this.block.idxCellArray, UNUSED_VAR_STR)
        this.PortPaths = this.Block.PortPaths;
        this.PortModes = this.Block.PortModes;
        this.PortTimes = this.Block.PortTimes;
        this.PortSigns = this.Block.PortSigns;
        this.PortFracLengths = this.Block.PortFracLengths;
        % 26 27
        this.idxCellArray = this.Block.idxCellArray;
        % 28 29
        this.ClockPaths = this.Block.ClockPaths;
        this.ClockModes = this.Block.ClockModes;
        this.ClockTimes = this.Block.ClockTimes;
        % 32 33
        this.NumPortRows = length(eval(this.PortModes));
        this.CurPortRow = 1.0;
        % 35 36
        this.NumClockRows = length(eval(this.ClockModes));
        if gt(this.NumClockRows, 0.0)
            this.CurClockRow = 1.0;
        else
            this.CurClockRow = 0.0;
        end % if
        % 42 44
        % 43 44
        this.checkStrings;
    else
        % 46 49
        % 47 49
        % 48 49
        this.idxCellArray = UNUSED_VAR_STR;
        % 50 52
        % 51 52
        outTs = this.Block.PortTimes;
        otherPortTs = '1';
        otherClockTs = '2';
        try
            ca = eval(this.Block.idxCellArray);
        catch
            ca = {''};
        end % try
        % 60 61
        this.PortPaths = '';
        this.PortModes = '[';
        this.PortTimes = '[';
        this.PortSigns = '[';
        this.PortFracLengths = '[';
        % 66 67
        this.ClockPaths = '';
        this.ClockModes = '[';
        this.ClockTimes = '[';
        % 70 71
        for ii=1.0:2.0:length(ca)
            switch ca{plus(ii, 1.0)}
            case 'in'
                this.PortPaths = horzcat(this.PortPaths, ';', ca{ii});
                this.PortModes = horzcat(this.PortModes, ' 1');
                this.PortTimes = horzcat(this.PortTimes, ',', otherPortTs);
            case 'out'
                this.PortPaths = horzcat(this.PortPaths, ';', ca{ii});
                this.PortModes = horzcat(this.PortModes, ' 2');
                this.PortTimes = horzcat(this.PortTimes, ',', outTs);
            case 'fclk'
                this.ClockPaths = horzcat(this.ClockPaths, ';', ca{ii});
                this.ClockModes = horzcat(this.ClockModes, ' 1');
                this.ClockTimes = horzcat(this.ClockTimes, ',', otherClockTs);
            case 'rclk'
                this.ClockPaths = horzcat(this.ClockPaths, ';', ca{ii});
                this.ClockModes = horzcat(this.ClockModes, ' 2');
                this.ClockTimes = horzcat(this.ClockTimes, ',', otherClockTs);
            end % switch
            this.PortSigns = horzcat(this.PortSigns, ' -1');
            this.PortFracLengths = horzcat(this.PortFracLengths, ',0');
        end % for
        % 93 94
        this.PortModes = horzcat(this.PortModes, ']');
        this.PortTimes = horzcat(this.PortTimes, ']');
        this.PortSigns = horzcat(this.PortSigns, ']');
        this.PortFracLengths = horzcat(this.PortFracLengths, ']');
        if isempty(this.PortPaths)
            this.PortPaths = ' ';
        else
            % 101 102
            this.PortPaths = this.PortPaths(2.0:end);
            this.PortTimes = this.PortTimes(horzcat(1.0, 3.0:end));
            this.PortFracLengths = this.PortFracLengths(horzcat(1.0, 3.0:end));
        end % if
        % 106 107
        this.ClockModes = horzcat(this.ClockModes, ']');
        this.ClockTimes = horzcat(this.ClockTimes, ']');
        if isempty(this.ClockPaths)
            this.ClockPaths = ' ';
        else
            % 112 113
            this.ClockPaths = this.ClockPaths(2.0:end);
            this.ClockTimes = this.ClockTimes(horzcat(1.0, 3.0:end));
        end % if
        % 116 117
        this.NumPortRows = length(eval(this.PortModes));
        this.CurPortRow = 1.0;
        % 119 120
        this.NumClockRows = length(eval(this.ClockModes));
        if gt(this.NumClockRows, 0.0)
            this.CurClockRow = 1.0;
        else
            this.CurClockRow = 0.0;
        end % if
        % 126 127
    end % if
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    % 132 133
    this.CommLocal = strcmpi(this.Block.CommLocal, 'on');
    this.CommHostName = this.Block.CommHostName;
    if strcmpi(this.Block.CommSharedMemory, 'on')
        this.CommSharedMemory = 'Shared memory';
    else
        this.CommSharedMemory = 'Socket';
    end % if
    this.CommPortNumber = this.Block.CommPortNumber;
    this.CommShowInfo = strcmpi(this.Block.CommShowInfo, 'on');
    this.CommLocalHostName = getlocalhostname;
    this.CosimBypass = this.Block.CosimBypass;
    % 144 149
    % 145 149
    % 146 149
    % 147 149
    % 148 149
    this.TclPreSimCommand = this.Block.TclPreSimCommand;
    this.TclPostSimCommand = this.Block.TclPostSimCommand;
    % 151 156
    % 152 156
    % 153 156
    % 154 156
    % 155 156
    this.TimingMode = this.Block.TimingMode;
    this.TimingScaleFactor = this.Block.TimingScaleFactor;
end % function
