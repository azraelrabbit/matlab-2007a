function [filerefs, filestates, includedirs] = pAnalyzeCustomCode(obj, mdlname)
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
    ResolvedCC = [];
    % 12 14
    deptypes = [];
    % 14 17
    % 15 17
    filerefs = [];
    filestates = [];
    includedirs = [];
    % 19 39
    % 20 39
    % 21 39
    % 22 39
    % 23 39
    % 24 39
    % 25 39
    % 26 39
    % 27 39
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    includePaths = i_get_param(mdlname, 'CustomInclude');
    libFiles = i_get_param(mdlname, 'CustomLibrary');
    srcFiles = i_get_param(mdlname, 'CustomSource');
    customSrc = i_get_param(mdlname, 'CustomSourceCode');
    % 42 44
    ResolvedCC = vertcat(ResolvedCC, i_resolve_custom_code(obj, includePaths, srcFiles, libFiles, customSrc, mdlname));
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    extraFiles = horzcat(cellhorzcat(i_get_param(mdlname, 'CustomCommentsFcn')), cellhorzcat(i_get_param(mdlname, 'ERTSrcFileBannerTemplate')), cellhorzcat(i_get_param(mdlname, 'ERTHdrFileBannerTemplate')), cellhorzcat(i_get_param(mdlname, 'ERTDataSrcFileTemplate')), cellhorzcat(i_get_param(mdlname, 'ERTDataHdrFileTemplate')), cellhorzcat(i_get_param(mdlname, 'ERTCustomFileTemplate')));
    % 49 59
    % 50 59
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    extraSrcFilePaths = i_which(extraFiles);
    % 59 61
    if not(isempty(extraSrcFilePaths))
        ResolvedCC(end).files = horzcat(ResolvedCC(end).files, extraSrcFilePaths);
    end
    deptypes = vertcat(deptypes, {'RTWConfig'});
    % 64 68
    % 65 68
    % 66 68
    machine = find(sfroot, '-isa', 'Stateflow.Machine', 'Path', mdlname);
    if not(isempty(machine))
        % 69 72
        % 70 72
        targets = find(sfroot, '-isa', 'Stateflow.Target', 'Machine', machine);
        for jj=1.0:numel(targets)
            % 73 75
            customSrc = targets(jj).CustomCode;
            srcFiles = targets(jj).UserSources;
            includePaths = targets(jj).UserIncludeDirs;
            libFiles = targets(jj).UserLibraries;
            % 78 80
            ResolvedCC = vertcat(ResolvedCC, i_resolve_custom_code(obj, includePaths, srcFiles, libFiles, customSrc, mdlname));
            % 80 83
            % 81 83
            deptypes = vertcat(deptypes, {'StateflowTarget'});
            % 83 85
        end % for
    end
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    for jj=1.0:numel(ResolvedCC)
        % 91 93
        [thesefilerefs, thesefilestates, theseincludedirs] = i_parse(ResolvedCC(jj), deptypes{jj}, mdlname);
        % 93 96
        % 94 96
        filerefs = vertcat(filerefs, thesefilerefs);
        filestates = vertcat(filestates, thesefilestates);
        includedirs = vertcat(includedirs, theseincludedirs);
    end % for
    % 99 102
    % 100 102
    includedirs = unique(includedirs);
    filerefs = unique(filerefs);
    filestates = unique(filestates);
    % 104 106
end
function [filerefs, filestates, includedirs] = i_parse(ResolvedCC, deptype, mdlname)
    % 107 119
    % 108 119
    % 109 119
    % 110 119
    % 111 119
    % 112 119
    % 113 119
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    includedirs = i_parse_includes(ResolvedCC.includepaths, deptype, mdlname);
    % 119 122
    % 120 122
    if isempty(ResolvedCC.files)
        filestates = [];
        filerefs = [];
        return
    end
    % 126 128
    filestates = dependencies.FileState.Init(ResolvedCC.files);
    % 128 130
    filerefs = dependencies.FileReference.Alloc(numel(filestates));
    for i=1.0:numel(filestates)
        filerefs(i) = dependencies.FileReference(filestates(i).FileName, deptype, mdlname);
        % 132 134
    end % for
    % 134 136
end
function includedirs = i_parse_includes(includepaths, deptype, deplocn)
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    if isempty(includepaths)
        includedirs = [];
        return
    end
    % 145 147
    includepaths = includepaths(not(cellfun('isempty', includepaths)));
    includepaths = unique(includepaths);
    % 148 150
    includedirs = dependencies.DirReference.Alloc(numel(includepaths));
    for jj=1.0:numel(includepaths)
        includedirs(jj) = dependencies.DirReference(includepaths{jj}, deptype, deplocn);
        % 152 154
    end % for
    % 154 156
end
function ResolvedCC = i_resolve_custom_code(obj, includePaths, srcFiles, libFiles, customSrc, mdlname)
    % 157 166
    % 158 166
    % 159 166
    % 160 166
    % 161 166
    % 162 166
    % 163 166
    % 164 166
    ResolvedCC.files = [];
    ResolvedCC.includepaths = [];
    % 167 169
    if ~(isempty(includePaths) && isempty(srcFiles) && isempty(libFiles) && isempty(customSrc))
        % 169 173
        % 170 173
        % 171 173
        try
            [prevLastErr, prevLastErrId] = lasterr;
            [ResolvedCC.files, ResolvedCC.includepaths] = pResolveCustomCode(obj, mdlname, includePaths, srcFiles, libFiles, customSrc);
        catch
            % 176 179
            % 177 179
            lasterr(prevLastErr, prevLastErrId);
        end % try
        % 180 182
    end
    % 182 184
end
function extraSrcFilePaths = i_which(extraFiles)
    % 185 189
    % 186 189
    % 187 189
    extraFiles = extraFiles(not(cellfun('isempty', extraFiles)));
    extraFiles = unique(extraFiles);
    % 190 193
    % 191 193
    extraSrcFilePaths = extraFiles;
    for jj=1.0:numel(extraFiles)
        this = which(extraFiles{jj});
        if not(isempty(this))
            extraSrcFilePaths{jj} = this;
        end
    end % for
end
function out = i_get_param(model, param)
    % 201 207
    % 202 207
    % 203 207
    % 204 207
    % 205 207
    try
        [prevLastErr, prevLastErrId] = lasterr;
        out = get_param(model, param);
    catch
        lasterr(prevLastErr, prevLastErrId);
        out = [];
    end % try
    % 213 215
end
