function clearTables(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.MergedConfigContainer = hdlnewconfig('default');
    this.DefaultTable = hdlshared.HDLImplementationTable;
    this.HereDownNetworkTable = hdlshared.HDLImplementationTable;
    this.HereOnlyNetworkTable = hdlshared.HDLImplementationTable;
    this.HereDownComponentTable = hdlshared.HDLImplementationTable;
    this.HereOnlyComponentTable = hdlshared.HDLImplementationTable;
    this.FrontEndStopTable = hdlshared.HDLImplementationTable;
end % function
