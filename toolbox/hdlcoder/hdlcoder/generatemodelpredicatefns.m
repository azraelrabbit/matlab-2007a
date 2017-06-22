function generatemodelpredicatefns
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    open_system('simulink');
    open_system('dsplibv4');
    % 19 21
    slLibraryList = vertcat(cellhorzcat(horzcat('simulink/Additional Math', char(10.0), '& Discrete/Additional Math:', char(10.0), 'Increment - Decrement'), horzcat('simulink/Additional Math', char(10.0), '& Discrete/Additional Discrete'), 'simulink/Continuous', 'simulink/Discontinuities', 'simulink/Discrete', horzcat('simulink/Logic and Bit', char(10.0), 'Operations'), horzcat('simulink/Lookup', char(10.0), 'Tables'), horzcat('simulink/Math', char(10.0), 'Operations'), horzcat('simulink/Model', char(10.0), 'Verification'), horzcat('simulink/Model-Wide', char(10.0), 'Utilities'), horzcat('simulink/Ports &', char(10.0), 'Subsystems'), horzcat('simulink/Signal', char(10.0), 'Attributes'), horzcat('simulink/Signal', char(10.0), 'Routing'), 'simulink/Sinks', 'simulink/Sources', horzcat('simulink/User-Defined', char(10.0), 'Functions'), 'dsplpc', 'dspparest3', 'dspspect3', 'dspadpt3', 'dsparch4', 'dspmlti4', 'dspmtrx3', 'dspfactors', 'dspinverses', 'dspsolvers', 'dspmathops', 'dsppolyfun', 'dspwin32', 'dspquant2', 'dspswit3', 'dspbuff3', 'dspindex', 'dspsigattribs', 'dspsigops', 'dspsrcs4', 'dspsnks4', 'dspstat3', 'dspxfrm3', 'dspobslib'));
    % 21 66
    % 22 66
    % 23 66
    % 24 66
    % 25 66
    % 26 66
    % 27 66
    % 28 66
    % 29 66
    % 30 66
    % 31 66
    % 32 66
    % 33 66
    % 34 66
    % 35 66
    % 36 66
    % 37 66
    % 38 66
    % 39 66
    % 40 66
    % 41 66
    % 42 66
    % 43 66
    % 44 66
    % 45 66
    % 46 66
    % 47 66
    % 48 66
    % 49 66
    % 50 66
    % 51 66
    % 52 66
    % 53 66
    % 54 66
    % 55 66
    % 56 66
    % 57 66
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    global blkList;
    initBlkList;
    % 67 69
    [nr, nc] = size(slLibraryList);
    % 69 71
    for i=1.0:nc
        % 71 73
        sysName = slLibraryList{i};
        open_system(sysName);
        % 74 76
        try
            blocklist = get_param(sysName, 'Blocks');
            % 77 79
            if isempty(blocklist)
                openFcn = get_param(sysName, 'OpenFcn');
                blocklist = get_param(openFcn, 'Blocks');
                sysName = openFcn;
            end
        catch
            % 84 86
            warning('trouble with the library %s', sysName);
        end % try
        % 87 89
        for j=1.0:length(blocklist)
            % 89 91
            block = blocklist{j};
            blkType = getBlockType(sysName, block);
            % 92 94
            blkPathStr = getBlockPathStr(sysName, block);
            blkTypeStr = getBlockTypeStr(blkType);
            % 95 97
            if strcmpi(blkType, 'SubSystem')
                % 97 100
                % 98 100
                addSubsystemBlk(blkPathStr);
            else
                if strcmpi(blkType, 'S-Function')
                    % 102 105
                    % 103 105
                    addSfunctionBlk(blkPathStr);
                else
                    % 106 111
                    % 107 111
                    % 108 111
                    % 109 111
                    addBuiltinBlk(blkTypeStr);
                    addBuiltinBlkWithPath(blkPathStr);
                    % 112 114
                end
            end
        end % for
        % 116 118
        close_system(sysName);
        % 118 120
    end % for
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    addBuiltinBlk(getBlockTypeStr('SubSystem'));
    addBuiltinBlk(getBlockTypeStr('S-Function'));
    % 126 129
    % 127 129
    blkList.builtinBlkNameList = sort(blkList.builtinBlkNameList);
    blkList.builtinlist = sort(blkList.builtinlist);
    blkList.sfunctionList = sort(blkList.sfunctionList);
    blkList.subsystemList = sort(blkList.subsystemList);
    % 132 135
    % 133 135
    genFnBuilitinBlks(blkList.builtinBlkNameList);
    genFnBuilitinBlksWithPath(blkList.builtinlist);
    genFnSfunBlks(blkList.sfunctionList);
    genFnSubsystems(blkList.subsystemList);
    % 138 140
    bdclose('all');
end
function pname = getBlockPathStr(sysName, blkName)
    % 142 146
    % 143 146
    % 144 146
    tname = strrep(blkName, '/', '//');
    pname = horzcat(sysName, '/', tname);
    % 147 150
    % 148 150
    pname = regexprep(pname, ' ', ''' char(32) ''');
    % 150 152
    pname = strrep(pname, char(10.0), ''' char(10) ''');
    % 152 154
    pname = horzcat('[''', pname, '''],...');
end
function blkType = getBlockType(sysName, blkName)
    % 156 159
    % 157 159
    block = strrep(blkName, '/', '//');
    block = horzcat(sysName, '/', block);
    blkType = get_param(block, 'BlockType');
end
function refBlock = getReferenceBlock(sysName, blkName)
    % 163 166
    % 164 166
    block = strrep(blkName, '/', '//');
    block = horzcat(sysName, '/', block);
    refBlock = get_param(block, 'referenceBlock');
end
function blkTypeStr = getBlockTypeStr(typ)
    % 170 173
    % 171 173
    blkTypeStr = horzcat('[''', typ, '''],...');
end
function genFnBuilitinBlks(blkList)
    % 175 177
    genPredicateFn('hdlisabuiltinblk', blkList);
end
function genFnBuilitinBlksWithPath(blkList)
    % 179 182
    % 180 182
    genPredicateFn('hdlisabuiltinblkwithpath', blkList);
end
function genFnSfunBlks(blkList)
    % 184 187
    % 185 187
    genPredicateFn('hdlisasfunblk', blkList);
end
function genFnSubsystems(blkList)
    % 189 192
    % 190 192
    genPredicateFn('hdlisasubsystemblk', blkList);
end
function genPredicateFn(fnName, blkList)
    % 194 197
    % 195 197
    s = horzcat('function result = ', fnName, '(blkName)\n');
    s = horzcat(s, '%% ', upper(fnName), ' Check if blk is part of the block list\n');
    s = horzcat(s, '%%\n');
    s = horzcat(s, '%%\n');
    s = horzcat(s, '\n');
    s = horzcat(s, '%%\n');
    s = horzcat(s, '%% *** This file is autogenerated from genpredicatefns.m *** \n');
    s = horzcat(s, '%%\n');
    s = horzcat(s, '\n');
    s = horzcat(s, '\n%% Copyright 2005 The MathWorks, Inc.');
    s = horzcat(s, '\n%% $Revision: 1.1.8.2 $  $Date: 2006/05/09 23:28:38 $ $Author: batserve $\n');
    s = horzcat(s, '%%\n');
    s = horzcat(s, '\n');
    s = horzcat(s, '\t blkList = ...');
    s = horzcat(s, '\n\t {...');
    s = horzcat(s, '\n');
    s = horzcat(s, sprintf('\t\t%s\n', blkList{:}));
    s = horzcat(s, '\t };');
    s = horzcat(s, '\n');
    s = horzcat(s, '\n');
    s = horzcat(s, '\tresult = any(strcmp(blkName, blkList));');
    s = horzcat(s, '\n');
    s = horzcat(s, '\n');
    s = horzcat(s, 'end');
    s = horzcat(s, '\n');
    % 221 223
    predicateFunctionName = horzcat(fnName, '.m');
    fid = fopen(predicateFunctionName, 'w');
    fprintf(fid, s);
    fclose(fid);
    % 226 228
end
function initBlkList
    % 229 233
    % 230 233
    % 231 233
    global blkList;
    blkList.builtinBlkNameList = [];
    blkList.builtinlist = [];
    blkList.sfunctionList = [];
    blkList.subsystemList = [];
end
function addSubsystemBlk(pname)
    % 239 242
    % 240 242
    global blkList;
    if isempty(blkList.subsystemList)
        blkList.subsystemList{1.0} = pname;
    else
        loc = strcmpi(pname, blkList.subsystemList);
        if any(loc)
        else
            % 248 251
            % 249 251
            % 250 252
            blkList.subsystemList{plus(end, 1.0)} = pname;
        end
    end
end
function addSfunctionBlk(pname)
    % 256 259
    % 257 259
    global blkList;
    if isempty(blkList.sfunctionList)
        blkList.sfunctionList{1.0} = pname;
    else
        loc = strcmpi(pname, blkList.sfunctionList);
        if any(loc)
        else
            % 265 268
            % 266 268
            % 267 269
            blkList.sfunctionList{plus(end, 1.0)} = pname;
        end
    end
end
function addBuiltinBlk(pname)
    % 273 276
    % 274 276
    global blkList;
    if isempty(blkList.builtinBlkNameList)
        blkList.builtinBlkNameList{1.0} = pname;
    else
        loc = strcmpi(pname, blkList.builtinBlkNameList);
        if any(loc)
        else
            % 282 285
            % 283 285
            % 284 286
            blkList.builtinBlkNameList{plus(end, 1.0)} = pname;
        end
    end
end
function addBuiltinBlkWithPath(pname)
    % 290 293
    % 291 293
    global blkList;
    if isempty(blkList.builtinlist)
        blkList.builtinlist{1.0} = pname;
    else
        loc = strcmpi(pname, blkList.builtinlist);
        if any(loc)
        else
            % 299 302
            % 300 302
            % 301 303
            blkList.builtinlist{plus(end, 1.0)} = pname;
        end
    end
end
