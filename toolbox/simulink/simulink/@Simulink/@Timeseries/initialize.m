function initialize(this, name, blockpath, portindex, signame, parentname, data, time, starttimes, interval, endtimes, framesize, regionInfo)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this.tsValue = initialize(SimTimeseries, name, blockpath, portindex, signame, parentname, data, time, starttimes, interval, endtimes, framesize, regionInfo);
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    this.blockpath = blockpath;
    this.portindex = portindex;
    this.parentname = parentname;
    this.SignalName = signame;
    this.RegionInfo = Simulink.RegionInfo(regionInfo);
end % function
