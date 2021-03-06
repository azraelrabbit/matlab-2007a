function [nRight, isAll] = hierRight(this, thisNode)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isa(thisNode, 'Stateflow.Machine')
        nRight = rptgen_sf.csf_hier.hierSibling(thisNode, slroot, false);
        isAll = true;
    else
        if isa(thisNode, 'Stateflow.Chart')
            nRight = rptgen_sf.csf_hier.hierSibling(thisNode, thisNode.Machine, false);
            isAll = true;
        else
            if isa(thisNode, 'Stateflow.Object')
                nRight = right(thisNode);
                isAll = false;
                if this.SkipAutogenerated && not(isempty(nRight)) && not(rptgen_sf.isNotAutogenerated(nRight))
                    % 18 20
                    [nRight, isAll] = hierRight(this, nRight);
                end % if
            else
                % 22 24
                nRight = [];
                isAll = false;
            end % if
        end % if
    end % if
