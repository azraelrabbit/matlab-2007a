function deactivateConfigSet(this, blockDiagram)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    getConfigSetCC = ssc_private('ssc_get_configset');
    oldSimscapeCC = getConfigSetCC(blockDiagram);
    % 8 11
    % 9 11
    % 10 11
    this.modelRegistry.setPreswitchCC(blockDiagram, oldSimscapeCC);
end % function
