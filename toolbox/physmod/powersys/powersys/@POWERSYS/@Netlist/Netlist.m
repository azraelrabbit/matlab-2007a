function nl = Netlist(connectivity)
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
    if ne(nargin, 1.0)
        error(horzcat(mfilename, ' takes one argument'));
    end % if
    % 14 16
    expfields = {'ConnectivityMatrix','BlockHandles','PortHandles'};
    % 16 18
    for field=expfields
        if not(isfield(connectivity, field))
            error(horzcat('Argument CONNECTIVITY to ', mfilename, ' must have field ', field{:}, '.'));
        end % if
    end % for
    % 22 25
    % 23 25
    nl = POWERSYS.Netlist;
    % 25 28
    % 26 28
    if eq(getfield(connectivity, 'PortHandles'), 0.0)
        % 28 30
        return;
    end % if
    % 31 33
    a = or(connectivity.ConnectivityMatrix, ctranspose(connectivity.ConnectivityMatrix));
    nl.portToNode = unique(a, 'rows');
    % 34 37
    % 35 37
    nl.ports = connectivity.PortHandles;
    % 37 40
    % 38 40
    [n, m] = size(nl.portToNode);
    a = zeros(1.0, m);
    nl.portToNode = vertcat(a, horzcat(nl.portToNode));
    nl.check_nodes(mfilename);
    % 43 46
    % 44 46
    non_grounds = [];
    Neutrals = [];
    BusBars = [];
    BusBarIndices = [];
    NeutralIndices = [];
    [blocks, i] = unique(connectivity.BlockHandles);
    ports = connectivity.PortHandles(i);
    % 52 54
    for i=1.0:length(blocks)
        % 54 56
        block = blocks(i);
        MaskType = get_param(block, 'MaskType');
        % 57 59
        switch MaskType
        case 'Ground'
            % 60 63
            % 61 63
            port = ports(i);
            node = nl.port_to_node(port);
            if ne(node, 0.0)
                nl.bind_nodes(0.0, node);
            end % if
        case 'Neutral'
            % 68 71
            % 69 71
            Label = eval(get_param(block, 'NodeNumber'));
            port = ports(i);
            node = nl.port_to_node(port);
            Neutrals(plus(end, 1.0), 1.0:2.0) = horzcat(Label, port);
        case 'JunctionPoint'
            % 75 78
            % 76 78
            BusBars(plus(end, 1.0)) = block;
            non_grounds(plus(end, 1.0)) = block;
            % 79 81
            BusBarIndices(plus(end, 1.0)) = length(non_grounds);
        otherwise
            % 82 84
            non_grounds(plus(end, 1.0)) = block;
        end % switch
        % 85 87
    end % for
    % 87 89
    for i=1.0:size(Neutrals, 1.0)
        % 89 91
        Label = Neutrals(i, 1.0);
        ReferenceNeutral = Neutrals(i, 2.0);
        MasterNode = nl.port_to_node(ReferenceNeutral);
        idx = find(eq(Neutrals(:, 1.0), Label));
        CommonPorts = Neutrals(idx, 2.0);
        % 95 97
        if not(isempty(MasterNode))
            for j=1.0:length(CommonPorts)
                NodeToKill = nl.port_to_node(CommonPorts(j));
                MasterNode = nl.port_to_node(ReferenceNeutral);
                if eq(Label, 0.0)
                    MasterNode = 0.0;
                end % if
                if ne(NodeToKill, MasterNode)
                    nl.bind_nodes(MasterNode, NodeToKill);
                end % if
                Neutrals(idx(j), 2.0) = NaN;
            end % for
        end % if
    end % for
    % 110 113
    % 111 113
    nl.reservednode = plus(size(nl.portToNode, 1.0), 1.0);
    % 113 117
    % 114 117
    % 115 117
    for i=1.0:length(non_grounds)
        block = non_grounds(i);
        nl.add_block_to_list(block);
    end % for
    % 120 122
    for i=1.0:length(BusBars)
        BusBarNodes = nl.nodes(BusBarIndices(i));
        MasterNode = BusBarNodes{1.0}(1.0);
        for ii=2.0:length(BusBarNodes{1.0})
            NodeToKill = BusBarNodes{1.0}(ii);
            nl.joint_nodes(MasterNode, NodeToKill);
        end % for
    end % for
