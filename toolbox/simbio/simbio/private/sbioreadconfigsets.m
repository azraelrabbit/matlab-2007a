function cfgset = sbioreadconfigsets(model, configsetdom)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    docRootNode = configsetdom.getDocumentElement;
    nodename = char(docRootNode.getNodeName());
    % 18 21
    % 19 21
    if not(strcmp(class(model), 'SimBiology.Model'))
        warning('Invalid model passed to sbioreadconfisets() function');
        cfgset = [];
        return;
    end % if
    % 25 27
    if not(strcmp(nodename, 'Configset'))
        warning('Invalid DOM passed to sbioreadconfisets() function');
        cfgset = [];
        return;
    end % if
    % 31 34
    % 32 34
    try
        cfgset = locParseConfigSetDom(configsetdom);
    catch
        % 36 38
        error('Failed to read the XML DOM');
    end % try
    return;
function cfgset = locParseConfigSetDom(configsetdom)
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    if configsetdom.hasAttributes()
        % 46 48
        cfgset = SimBiology.Configset;
        % 48 51
        % 49 51
        cfgset = locParseAttributes(cfgset, configsetdom);
    end % if
    % 52 55
    % 53 55
    if configsetdom.hasChildNodes()
        nodelist = configsetdom.getChildNodes();
        numchildren = nodelist.getLength();
        for i=1.0:numchildren
            childnode = nodelist.item(minus(i, 1.0));
            nodename = char(childnode.getNodeName());
            nodevalue = char(childnode.getNodeValue());
            nodetype = childnode.getNodeType();
            if eq(nodetype, childnode.ELEMENT_NODE)
                switch nodename
                case 'Configset'
                    % 65 67
                    cfgset = locParseConfigSetDom(childnode);
                case 'CompileOptions'
                    % 68 71
                    % 69 71
                    compopts = cfgset.CompileOptions;
                    compopts = locParseAttributes(compopts, childnode);
                case 'RuntimeOptions'
                    % 73 76
                    % 74 76
                    runtimeopts = cfgset.RuntimeOptions;
                    runtimeopts = locParseAttributes(runtimeopts, childnode);
                case 'SolverOptions'
                    % 78 81
                    % 79 81
                    activesolver = cfgset.SolverOptions;
                    solveroptslist = find(cfgset, 'Type', 'solveroptions');
                    if isempty(solveroptslist)
                        error('No SolverOptions found');
                    end % if
                    numsolveropts = length(solveroptslist);
                    % 86 88
                    if not(childnode.hasChildNodes())
                        error('No child nodes found under solveroptions');
                    end % if
                    subnodelist = childnode.getChildNodes();
                    subnumchildren = nodelist.getLength();
                    % 92 95
                    % 93 95
                    for j=1.0:subnumchildren
                        grandchildnode = subnodelist.item(minus(j, 1.0));
                        grandchildnodename = char(grandchildnode.getNodeName());
                        grandchildnodevalue = char(grandchildnode.getNodeValue());
                        grandchildnodetype = grandchildnode.getNodeType();
                        if eq(grandchildnodetype, grandchildnode.ELEMENT_NODE)
                            % 100 102
                            solveropt = locFindSolverOption(solveroptslist, grandchildnodename);
                            if not(isempty(solveropt))
                                % 103 105
                                solveropt = locParseAttributes(solveropt, grandchildnode);
                            end % if
                        end % if
                    end % for
                otherwise
                    % 109 111
                    error('Unknown node found');
                end % switch
            end % if
        end % for
    end % if
function obj = locParseAttributes(obj, xmlnode)
    % 116 121
    % 117 121
    % 118 121
    % 119 121
    if xmlnode.hasAttributes()
        type = xmlnode.getNodeType();
        attrlist = xmlnode.getAttributes();
        numattribs = attrlist.getLength();
        for i=1.0:numattribs
            elemnode = attrlist.item(minus(i, 1.0));
            nodename = char(elemnode.getNodeName());
            nodevalue = char(elemnode.getNodeValue());
            elemtype = elemnode.getNodeType();
            % 129 132
            % 130 132
            if locIsSettable(obj, nodename)
                xx = str2num(nodevalue);
                if isempty(xx)
                    % 134 136
                    if not(strcmp(nodename, 'Name')) && not(strcmp(nodevalue, 'default'))
                        % 136 138
                        cmd = horzcat('obj.', nodename, ' = ''', nodevalue, ''';');
                        eval(cmd);
                    end % if
                else
                    % 141 143
                    cmd = horzcat('obj.', nodename, ' = ', nodevalue, ';');
                    eval(cmd);
                end % if
            end % if
        end % for
    end % if
    return;
function solveropt = locFindSolverOption(solveroptslist, name)
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    n = length(solveroptslist);
    solveropt = [];
    % 156 159
    % 157 159
    for i=1.0:n
        solveropt = solveroptslist(i);
        solveroptname = regexprep(class(solveropt), 'SimBiology.', '');
        if strcmp(solveroptname, name)
            return;
        end % if
    end % for
    return;
function retval = locIsSettable(obj, fldname)
    % 167 170
    % 168 170
    if any(strcmpi(fields(set(obj)), fldname))
        retval = true;
    else
        retval = false;
    end % if
    return;
