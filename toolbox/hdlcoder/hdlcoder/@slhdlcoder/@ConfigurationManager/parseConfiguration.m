function parseConfiguration(this, hImplDatabase, files)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.clearTables;
    % 8 9
    this.parseDefaultConfigs(hImplDatabase);
    % 10 11
    this.parseUserConfigs(hImplDatabase, files);
    % 12 13
    this.finalizeTables(hImplDatabase);
end % function
