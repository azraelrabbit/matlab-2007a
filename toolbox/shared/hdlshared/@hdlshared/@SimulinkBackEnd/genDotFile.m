function outDotFile = genDotFile(this, hPir)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    dotStr = genDotStr(this, hPir);
    % 14 17
    % 15 17
    outDotFile = genDotFileName(this);
    % 17 19
    printDotStrToFile(dotStr, outDotFile);
    % 19 21
end % function
function outDotFile = genDotFileName(this)
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    outDotFile = horzcat(tempdir, this.OutModelFile, this.DotFileExt);
    this.DotFile = outDotFile;
    % 28 30
end % function
function dotStr = genDotStr(this, hPir)
    % 31 35
    % 32 35
    % 33 35
    dotStr = '';
    % 35 37
    vNetworks = hPir.Networks;
    numNetworks = length(vNetworks);
    % 38 40
    for i=1.0:numNetworks
        % 40 42
        dotStr = horzcat(dotStr, getDotStr(this, vNetworks(i)));
    end % for
    % 43 45
end % function
function dotStr = getDotStr(this, hN)
    % 46 56
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    dotStr = horzcat('digraph ', hN.RefNum);
    dotStr = horzcat(dotStr, '\n { \n');
    dotStr = horzcat(dotStr, '\t rankdir=LR; \n');
    dotStr = horzcat(dotStr, '\t node [shape=record]; \n');
    dotStr = horzcat(dotStr, '\t edge [arrowhead=none]; \n');
    % 60 63
    % 61 63
    dotStr = horzcat(dotStr, getDotForNtwkNodes(this, hN));
    % 63 65
    dotStr = horzcat(dotStr, '\n } \n');
end % function
function [width, height] = getDimensions(this, pirNodeName)
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    loc = strcmp(pirNodeName, this.pirLayoutInfo.nodeId);
    if any(loc)
        if ne(sum(loc), 1.0)
            error(hdlerrormsgid('simulinkbackend'), 'Graph node Name conflict: multiple nodes found for %s', pirNodeName);
        else
            % 77 79
            width = this.pirLayoutInfo.width(loc);
            height = this.pirLayoutInfo.height(loc);
        end % if
    else
        error(hdlerrormsgid('simulinkbackend'), 'Graph node entry not found for %s', pirNodeName);
    end % if
    % 84 86
end % function
function dotStr = printNodeStr(this, nodeName, nodeStructure)
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    [width, height] = getDimensions(this, nodeName);
    % 92 94
    dimensions = horzcat('width=', num2str(width), ' , ', 'height=', num2str(height));
    % 94 97
    % 95 97
    attributeStr = horzcat(' [ ', 'label="', nodeStructure, '" , ', dimensions, ' ];');
    % 97 100
    % 98 100
    dotStr = horzcat('\t ', nodeName, ' ', attributeStr, '\n');
    % 100 102
end % function
function dotStr = getDotForNtwkNodes(this, ntwk)
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    dotStr = '';
    % 111 117
    % 112 117
    % 113 117
    % 114 117
    % 115 117
    ntwkRefNum = ntwk.RefNum;
    numInports = ntwk.numberofInputPorts;
    % 118 120
    for i=1.0:numInports
        % 120 122
        nodeName = horzcat(ntwkRefNum, '_', 'ip', num2str(minus(i, 1.0)));
        % 122 124
        nodeStructure = '{ { <noinports> } | { <out> } }';
        % 124 126
        dotStr = horzcat(dotStr, printNodeStr(this, nodeName, nodeStructure));
    end % for
    % 127 130
    % 128 130
    vComps = ntwk.Components;
    numComps = length(vComps);
    % 131 133
    for i=1.0:numComps
        hC = vComps(i);
        % 134 136
        nodeName = horzcat(ntwkRefNum, '_', hC.RefNum);
        % 136 138
        nodeStructure = getDotForCompPorts(this, hC);
        % 138 140
        dotStr = horzcat(dotStr, printNodeStr(this, nodeName, nodeStructure));
    end % for
    % 141 144
    % 142 144
    numOutports = ntwk.numberofOutputPorts;
    % 144 146
    for i=1.0:numOutports
        % 146 148
        nodeName = horzcat(ntwkRefNum, '_', 'op', num2str(minus(i, 1.0)));
        % 148 150
        nodeStructure = '{ { <in> } | { <nooutports> } }';
        % 150 152
        dotStr = horzcat(dotStr, printNodeStr(this, nodeName, nodeStructure));
    end % for
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    vSignals = ntwk.Signals;
    numSignals = length(vSignals);
    % 159 161
    for i=1.0:numSignals
        hS = vSignals(i);
        % 162 164
        numDrivers = hS.numberofDrivers;
        vDrvPorts = hS.getDrivers;
        % 165 167
        numRecvrs = hS.numberofReceivers;
        vRcvPorts = hS.getReceivers;
        % 168 170
        for j=1.0:numDrivers
            % 170 172
            edgeDrvStr = '';
            hDrvP = vDrvPorts(j);
            hDrvPOwner = hDrvP.Owner;
            % 174 176
            if isa(hDrvPOwner, 'hdlcoder.network')
                % 176 179
                % 177 179
                edgeDrvStr = horzcat(edgeDrvStr, ntwkRefNum, '_', 'ip', num2str(hDrvP.PortIndex), ':out');
            else
                % 180 184
                % 181 184
                % 182 184
                edgeDrvStr = horzcat(edgeDrvStr, ntwkRefNum, '_', hDrvPOwner.RefNum, ':', fixNameForDot(this, hDrvP.Name));
                % 184 186
            end % if
            % 186 188
            for k=1.0:numRecvrs
                % 188 190
                edgeRcvStr = '';
                hRcvP = vRcvPorts(k);
                hRcvPOwner = hRcvP.Owner;
                % 192 194
                if isa(hRcvPOwner, 'hdlcoder.network')
                    % 194 197
                    % 195 197
                    edgeRcvStr = horzcat(edgeRcvStr, ntwkRefNum, '_', 'op', num2str(hRcvP.PortIndex), ':in');
                else
                    % 198 202
                    % 199 202
                    % 200 202
                    edgeRcvStr = horzcat(edgeRcvStr, ntwkRefNum, '_', hRcvPOwner.RefNum, ':', fixNameForDot(this, hRcvP.Name));
                    % 202 204
                end % if
                % 204 206
                dotStr = horzcat(dotStr, '\t ', edgeDrvStr, ' -> ', edgeRcvStr, ';\n');
                % 206 208
            end % for
        end % for
    end % for
    % 210 212
end % function
function dotStr = getDotForInports(this, ntwkOrComp)
    % 213 220
    % 214 220
    % 215 220
    % 216 220
    % 217 220
    % 218 220
    numInPorts = ntwkOrComp.numberofInputPorts;
    vInPorts = ntwkOrComp.InputPorts;
    % 221 223
    dotStr = '';
    % 223 225
    dotStr = horzcat(dotStr, '{');
    for i=1.0:numInPorts
        % 226 228
        dotStr = horzcat(dotStr, ' <', fixNameForDot(this, vInPorts(i).Name), '> ');
        % 228 230
        if ne(i, numInPorts)
            dotStr = horzcat(dotStr, '|');
        end % if
        % 232 234
    end % for
    dotStr = horzcat(dotStr, '}');
    % 235 237
end % function
function dotStr = getDotForOutports(this, ntwkOrComp)
    % 238 244
    % 239 244
    % 240 244
    % 241 244
    % 242 244
    numOutPorts = ntwkOrComp.numberofOutputPorts;
    vOutPorts = ntwkOrComp.OutputPorts;
    % 245 247
    dotStr = '';
    % 247 249
    dotStr = horzcat(dotStr, '{');
    for i=1.0:numOutPorts
        % 250 252
        dotStr = horzcat(dotStr, ' <', fixNameForDot(this, vOutPorts(i).Name), '> ');
        % 252 254
        if ne(i, numOutPorts)
            dotStr = horzcat(dotStr, '|');
        end % if
        % 256 258
    end % for
    dotStr = horzcat(dotStr, '}');
    % 259 261
end % function
function dotStr = getDotForCompPorts(this, hC)
    % 262 268
    % 263 268
    % 264 268
    % 265 268
    % 266 268
    dotStr = '';
    % 268 270
    numInports = hC.numberofInputPorts;
    numOutports = hC.numberofOutputPorts;
    % 271 273
    if numInports && numOutports
        dotStr = horzcat(' { ', getDotForInports(this, hC), ' | ', getDotForOutports(this, hC), ' } ');
    else
        if numInports
            dotStr = horzcat(' { ', getDotForInports(this, hC), ' | ', '{ <nooutports> }', ' } ');
        else
            if numOutports
                dotStr = horzcat(' { ', '{ <noinports> }', ' | ', getDotForOutports(this, hC), ' } ');
            else
                % 281 283
                if isValidComponent(this, hC)
                    warning(sprintf('Component with no ports found %s', hC.Name));
                end % if
            end % if
        end % if
    end % if
end % function
function valid = isValidComponent(this, hC)
    valid = 1.0;
    if strcmp(this.hPir.getTimingControllerName, hC.Name)
        valid = 0.0;
    end % if
end % function
function printDotStrToFile(dotStr, file)
    % 296 302
    % 297 302
    % 298 302
    % 299 302
    % 300 302
    fid = fopen(file, 'w');
    % 302 304
    if eq(fid, -1.0)
        error(hdlcodererrormsgid('nodotgenfile'), 'Internal Error: Unable to write dot info');
        % 305 307
    end % if
    % 307 309
    fprintf(fid, dotStr);
    fclose(fid);
end % function
