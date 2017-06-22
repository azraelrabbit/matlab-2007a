function VGD = pmiu_dump(VGD, doWhat, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if pmiu_debug
        feval(doWhat, VGD, varargin{:});
    end % if
end % function
function dumpEdges(VGD)
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    handleA = VGD.edges.nodeA.handle;
    handleB = VGD.edges.nodeB.handle;
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    fprintf(1.0, '========== EDGES ==========\n');
    for j=1.0:VGD.numEdges
        if gt(handleA(j).port.h, 0.0)
            parentA = get_param(handleA(j).port.h, 'Parent');
        else
            parentA = '';
        end % if
        if gt(handleB(j).port.h, 0.0)
            parentB = get_param(handleB(j).port.h, 'Parent');
        else
            parentB = '';
        end % if
        % 35 36
        fprintf(1.0, '%2i blocks  : %60s\t->\t%60s\n', j, VGD.nodes.xObj(VGD.edges.nodeA.num(j)).name, VGD.nodes.xObj(VGD.edges.nodeB.num(j)).name);
        % 37 39
        % 38 39
        fprintf(1.0, '   cad_xml | %8.4f[%37s.%9s %2i]\t->\t%8.4f[%37s.%9s %2i]\n', handleA(j).port.h, VGD.edges.nodeA.handle(j).up.name, VGD.edges.nodeA.handle(j).name, VGD.edges.nodeA.handleNum(j), handleB(j).port.h, VGD.edges.nodeB.handle(j).up.name, VGD.edges.nodeB.handle(j).name, VGD.edges.nodeB.handleNum(j));
        % 40 42
        % 41 42
        fprintf(1.0, '   simulink| %8.4f[%50s]\t->\t%8.4f[%50s]\n', handleA(j).port.h, parentA, handleB(j).port.h, parentB);
        % 43 45
        % 44 45
        fprintf(1.0, '----------------------------------------------------------------------------------------------------------------------------------------------------------------\n');
    end % for
    fprintf(1.0, '========== ----- ==========\n');
end % function
function dumpNodes(VGD, title)
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    fprintf(1.0, '================================================================================\n');
    if lt(nargin, 1.0)
        title = [];
    end % if
    % 58 59
    fprintf(1.0, '     NODE DUMP: %s\n', title);
    haveOrientation = isfield(VGD.nodes, 'orientation');
    if not(haveOrientation)
        orientation = 0.0;
    end % if
    for nodeNum=1.0:VGD.numNodes
        if haveOrientation
            orientation = VGD.nodes.orientation(nodeNum);
        end % if
        fprintf(1.0, 'node %4i: orientation = %2i, name==%s\n', nodeNum, orientation, VGD.nodes.xObj(nodeNum).name);
        % 69 70
    end % for
    % 71 72
    fprintf(1.0, '================================================================================\n');
end % function
