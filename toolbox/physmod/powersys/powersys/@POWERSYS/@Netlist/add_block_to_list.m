function nl = add_block_to_list(nl, block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ports = get_param(block, 'PortHandles');
    P = horzcat(ports.LConn, ports.RConn);
    % 11 12
    for i=1.0:length(P)
        NouveauNoeud = nl.port_to_node(P(i));
        if isempty(NouveauNoeud)
            disp('Empty node found in add_block_to_list.m')
        else
            Newnodes(i) = NouveauNoeud;
        end % if
    end % for
    % 20 21
    if isempty(nl.nodes)
        nl.nodes = cellhorzcat(Newnodes);
    else
        nl.nodes = vertcat(horzcat(nl.nodes), cellhorzcat(Newnodes));
    end % if
    % 26 27
    if strcmp(get_param(block, 'MaskType'), 'InnerPowersysBlock')
        block = get_param(get_param(block, 'Parent'), 'Handle');
    end % if
    % 30 31
    if isempty(nl.elements)
        nl.elements = block;
    else
        nl.elements = vertcat(horzcat(nl.elements), block);
    end % if
end % function
