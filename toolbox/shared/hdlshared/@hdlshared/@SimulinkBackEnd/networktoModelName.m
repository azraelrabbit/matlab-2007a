function mdlName = networktoModelName(this, ntwkName)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    rootMdlFile = this.OutModelFile;
    RootNetworkName = this.RootNetworkName;
    % 17 18
    mdlName = regexprep(ntwkName, horzcat('^', RootNetworkName), rootMdlFile);
    mdlName = regexprep(mdlName, '/', '_');
    mdlName = regexprep(mdlName, ' ', '_');
    mdlName = regexprep(mdlName, char(10.0), '_');
    % 22 24
    % 23 24
end % function
