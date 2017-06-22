function vportios = findVirtualTunedBlockSources(this, TunedBlocks)
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
    mdl = bdroot(TunedBlocks(1.0).Name);
    if strcmp(get_param(mdl, 'SimulationStatus'), 'stopped')
        dirty = get_param(mdl, 'Dirty');
        % 14 15
        activeConfig = setNonSimWarningOff(slcontrol.Utilities, mdl);
        feval(mdl, [], [], [], 'lincompile');
        precompiled = false;
    else
        precompiled = true;
    end % if
    % 21 22
    oldEngineInterface = feature('EngineInterface');
    feature('EngineInterface', 1001.0);
    vportios = handle(NaN(0.0, 1.0));
    % 25 26
    for ct=1.0:numel(TunedBlocks)
        % 27 28
        ph = get_param(TunedBlocks(ct).Name, 'PortHandles');
        pin = get_param(ph.Inport(TunedBlocks(ct).AuxData.InportPort), 'Object');
        act_src = pin.getActualSrc;
        if gt(get_param(act_src(1.0), 'CompiledPortWidth'), 1.0)
            graph_src = getGraphicalSrc(pin);
            vportios(plus(end, 1.0), 1.0) = linio(get_param(graph_src(1.0), 'Parent'), get_param(graph_src(1.0), 'PortNumber'), 'in');
            % 34 35
        end % if
        % 36 37
        if strcmp(get_param(TunedBlocks(ct).Name, 'BlockType'), 'SubSystem')
            vportios(plus(end, 1.0), 1.0) = linio(TunedBlocks(ct).Name, TunedBlocks(ct).AuxData.OutportPort, 'in');
            % 39 40
        end % if
    end % for
    feature('EngineInterface', oldEngineInterface);
    % 43 45
    % 44 45
    if not(precompiled)
        feval(mdl, [], [], [], 'term');
        % 47 48
        tmpConfigSet = getActiveConfigSet(mdl);
        setActiveConfigSet(mdl, activeConfig.Name);
        detachConfigSet(mdl, tmpConfigSet.Name);
        set_param(mdl, 'Dirty', dirty);
    end % if
end % function
