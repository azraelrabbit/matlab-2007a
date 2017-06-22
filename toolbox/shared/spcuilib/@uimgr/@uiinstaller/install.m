function install(hInstall, hTarget)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if not(isempty(hInstall))
        % 11 14
        % 12 14
        validate(hInstall, hTarget);
        copyToTarget(hInstall, hTarget);
    end % if
end % function
function copyToTarget(hInstall, hTarget)
    % 18 22
    % 19 22
    % 20 22
    numNodes = size(hInstall.Plan, 1.0);
    for i=1.0:numNodes
        srcNode = hInstall.Plan{i, 1.0};
        tgtAddr = hInstall.Plan{i, 2.0};
        % 25 34
        % 26 34
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        thisParent = findchild(hTarget, tgtAddr);
        node_copy = copy(srcNode, 'children');
        add(thisParent, node_copy);
    end % for
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    for i=1.0:numNodes
        srcNode = hInstall.Plan{i, 1.0};
        fixup_descend(srcNode, hInstall, hTarget);
    end % for
end % function
function fixup_descend(installNode, hInstall, hTarget)
    % 51 56
    % 52 56
    % 53 56
    % 54 56
        while not(isempty(installNode))
        fixup_descend(installNode.down, hInstall, hTarget);
        % 57 60
        % 58 60
        if not(isempty(installNode.synclist))
            fixup_node(installNode, hInstall, hTarget);
        end % if
        % 62 70
        % 63 70
        % 64 70
        % 65 70
        % 66 70
        % 67 70
        % 68 70
        installNode = installNode.right;
    end % while
end % function
function fixup_node(installNode, hInstall, hTarget)
    % 73 93
    % 74 93
    % 75 93
    % 76 93
    % 77 93
    % 78 93
    % 79 93
    % 80 93
    % 81 93
    % 82 93
    % 83 93
    % 84 93
    % 85 93
    % 86 93
    % 87 93
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    targetNode = findTargetNode(installNode, hInstall, hTarget);
    % 93 96
    % 94 96
    targetNode.Explorer = [];
    targetNode.hWidget = [];
    % 97 104
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    targetNode.synclist = copy(targetNode.synclist);
    synclist = targetNode.synclist;
    % 105 110
    % 106 110
    % 107 110
    % 108 110
    N = numel(synclist.Default);
    for i=1.0:N
        % 111 116
        % 112 116
        % 113 116
        % 114 116
        syncArgs = synclist.ArgsRaw{i};
        % 116 123
        % 117 123
        % 118 123
        % 119 123
        % 120 123
        % 121 123
        if synclist.Default(i)
            % 123 127
            % 124 127
            % 125 127
            syncArgs{1.0} = findTargetNode(syncArgs{1.0}, hInstall, hTarget);
        else
            % 128 132
            % 129 132
            % 130 132
            syncArgs{1.0} = findTargetNode(syncArgs{1.0}, hInstall, hTarget);
            syncArgs{3.0} = findTargetNode(syncArgs{3.0}, hInstall, hTarget);
        end % if
        % 134 136
        dstName = getPath(syncArgs{1.0});
        % 136 138
        synclist.ArgsRaw{i} = syncArgs;
        synclist.DstName{i} = dstName;
    end % for
end % function
function targetNode = findTargetNode(origNode, hInstall, hTarget)
    % 142 163
    % 143 163
    % 144 163
    % 145 163
    % 146 163
    % 147 163
    % 148 163
    % 149 163
    % 150 163
    % 151 163
    % 152 163
    % 153 163
    % 154 163
    % 155 163
    % 156 163
    % 157 163
    % 158 163
    % 159 163
    % 160 163
    % 161 163
    targetPath = findTargetPath(origNode, hInstall);
    targetNode = findchild(hTarget, targetPath);
    if isempty(targetNode)
        error('uimgr:uiinstaller:TargetNodeNotFound', 'Failed to find plug-in node in target');
        % 166 168
    end % if
end % function
function targetPath = findTargetPath(origNode, hInstall)
    % 170 195
    % 171 195
    % 172 195
    % 173 195
    % 174 195
    % 175 195
    % 176 195
    % 177 195
    % 178 195
    % 179 195
    % 180 195
    % 181 195
    % 182 195
    % 183 195
    % 184 195
    % 185 195
    % 186 195
    % 187 195
    % 188 195
    % 189 195
    % 190 195
    % 191 195
    % 192 195
    % 193 195
    root = getRoot(origNode);
    plan = hInstall.Plan;
    N = size(plan, 1.0);
    idx = [];
    for i=1.0:N
        if eq(root, plan{i, 1.0})
            idx = i;
            break
        end % if
    end % for
    if isempty(idx)
        error('uimgr:uiinstaller:SyncNodeNotFound', 'Failed to find sync node in installer plan');
        % 206 208
    end % if
    targetRefpath = plan{idx, 2.0};
    targetPath = horzcat(targetRefpath, '/', getPath(origNode));
end % function
