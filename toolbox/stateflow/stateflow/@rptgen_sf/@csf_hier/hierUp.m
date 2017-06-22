function nUp = hierUp(this, thisNode)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isa(thisNode, 'Stateflow.Machine')
        nUp = [];
    else
        if isa(thisNode, 'Stateflow.Chart')
            nUp = thisNode.Machine;
        else
            if isa(thisNode, 'Stateflow.Object')
                nUp = up(thisNode);
            else
                nUp = [];
            end % if
        end % if
    end % if
end % function
