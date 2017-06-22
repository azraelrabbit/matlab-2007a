function startnode = findStartNode(this, subsGraph)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    startnode = subsGraph.find('FullPath', this.System);
    % 7 9
    if not(isValidStartNode(startnode))
        error(hdlerrormsgid('simulinkconnection'), 'Cannot find starting subsystem for HDL code generation.\nHDL Code generation not supported for individual blocks, please select a subsystem.');
        % 10 13
        % 11 13
    end
end
function valid = isValidStartNode(node)
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    valid = not(isempty(node)) && not(node.IsStateflow);
end
