function pmiu_generateModel
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    VGD = pmiu_data;
    % 12 14
    pmiu_status(1.0, 'Generating Simulink model...');
    % 14 16
    new_system(VGD.modelName);
    open_system(VGD.modelName);
    load_system(VGD.SimMechLibName);
    pmiu_todo('** global properties: a global model object...\n');
    % 19 23
    % 20 23
    % 21 23
    for node=1.0:VGD.numNodes
        if not(isempty(VGD.nodes.xObj(node).status))
            pmiu_warning('BlockStatusMessage', 'On block %s: %s', VGD.nodes.xObj(node).name, VGD.nodes.xObj(node).status);
            % 25 27
        end % if
        [VGD, blockHandle] = feval(VGD.BLOCKS.CREATE_CALLBACK{VGD.nodes.blockType(node)}, VGD, VGD.nodes.xObj(node));
        % 28 30
        VGD.node.handles(node) = blockHandle;
        set_param(blockHandle, 'Orientation', VGD.SL_CONST.ORIENTATION_STRING{VGD.nodes.orientation(node)});
        % 31 34
        % 32 34
        set_param(blockHandle, 'Position', VGD.nodes.location(node, :));
        % 34 36
        set_param(blockHandle, 'FontSize', VGD.graphOpt.FontSize);
        % 36 38
    end % for
    % 38 40
    pmiu_dump(VGD, 'dumpEdges');
    % 40 42
    if not(VGD.vectorizedLines)
        % 42 44
        for i=1.0:VGD.numEdges
            subsysName = get_param(get_param(VGD.edges.nodeA.handle(i).port.h, 'Parent'), 'Parent');
            % 45 48
            % 46 48
            add_line(subsysName, VGD.edges.nodeA.handle(i).port.h, VGD.edges.nodeB.handle(i).port.h, 'autorouting', 'on');
            % 48 52
            % 49 52
            % 50 52
        end % for
    else
        for subsys=1.0:VGD.numSubsystems
            pmiu_status(2.0, 'Generating Simulink model: subsystem %i of %i', subsys, VGD.numSubsystems);
            % 55 57
            subsysName = horzcat(VGD.nodes.fullBlockName{VGD.subsystem(subsys).xObj.tag});
            % 57 60
            % 58 60
            portHPairs = zeros(VGD.numEdges, 2.0);
            handleA = get(VGD.edges.nodeA.handle(VGD.subsystem(subsys).whichEdges), 'port');
            % 61 63
            if iscell(handleA)
                handleA = horzcat(handleA{:});
            end % if
            handleA = get(handleA, 'h');
            if iscell(handleA)
                handleA = horzcat(handleA{:});
            end % if
            handleB = get(VGD.edges.nodeB.handle(VGD.subsystem(subsys).whichEdges), 'port');
            if iscell(handleB)
                handleB = horzcat(handleB{:});
            end % if
            handleB = get(handleB, 'h');
            if iscell(handleB)
                handleB = horzcat(handleB{:});
            end % if
            add_line(subsysName, handleA, handleB, 'autorouting', 'on');
        end % for
        mech_addenvblock(VGD.modelName);
        pmiu_status(1.0, 'Generating Simulink model: done.');
    end % if
    % 82 84
    pmiu_data(VGD);
