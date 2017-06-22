function initState(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.EntityPathList = {};
    this.EntityNameList = {};
    this.EntityPortList = {};
    this.EntityArchList = {};
    % 11 12
    this.SequentialContext = false;
    % 13 15
    % 14 15
    this.CurrentClock = [];
    this.CurrentClockEnable = [];
    this.CurrentReset = [];
    this.HasClockEnable = true;
    this.ClockList = [];
    this.ClockEnableList = [];
    this.ResetList = [];
    % 22 23
    refreshPVPairCache(this);
    % 24 27
    % 25 27
    % 26 27
    hdluniqueprocessname(0.0);
end % function
