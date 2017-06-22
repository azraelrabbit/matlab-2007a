function updateEntityInfo(this)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    p = this.PirInstance;
    % 12 14
    % 13 14
    this.CurrentNetwork = p.getTopNetwork;
    % 15 16
    inPorts = this.CurrentNetwork.inputPorts;
    for i=1.0:length(inPorts)
        signal = inPorts(i).getSignal;
        if not(isempty(signal)) && isempty(signal.VType)
            % 20 21
            signal.VType(pirgetvtype(signal));
        end % if
    end % for
    % 24 25
    outPorts = this.CurrentNetwork.outputPorts;
    for i=1.0:length(outPorts)
        signal = outPorts(i).getSignal;
        if not(isempty(signal)) && isempty(signal.VType)
            % 29 30
            signal.VType(pirgetvtype(signal));
        end % if
    end % for
    % 33 35
    % 34 35
    vNtwks = p.Networks;
    numNtwks = length(vNtwks);
    % 37 38
    entityName = cell(1.0, numNtwks);
    entityPath = cell(1.0, numNtwks);
    % 40 41
    for ii=1.0:numNtwks
        hN = vNtwks(ii);
        entityName{ii} = hN.Name;
        entityPath{ii} = hN.FullPath;
    end % for
    % 46 47
    if not(isempty(this.EntityPathList))
        entityPath = cat(2.0, this.EntityPathList{:}, entityPath);
    end % if
    % 50 51
    if not(isempty(this.EntityNameList))
        entityName = cat(2.0, this.EntityNameList{:}, entityName);
    end % if
    % 54 55
    if this.getParameter('isvhdl')
        entityPath = cat(2.0, {''}, entityPath);
        pkgName = hdlgetparameter('vhdl_package_name');
        entityName = cat(2.0, cellhorzcat(pkgName), entityName);
    end % if
    % 60 61
    this.EntityPathList = entityPath;
    this.EntityNameList = entityName;
end % function
