function ret = addFiles(h, type, varargin)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    [argsOK, typeIdx, Names, Paths, Groups] = locCheckArgs(h, type, varargin{:});
    if ~(argsOK)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfoBuildObj.addFiles');
        % 27 29
    end
    % 29 33
    % 30 33
    % 31 33
    switch typeIdx
    case 1.0
        fVec = h.Inc;
    case 2.0
        fVec = h.Src;
    end
    % 38 40
    if ~(isempty(fVec.Files))
        % 40 47
        % 41 47
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        if eq(length(Names), 1.0)
            f = fVec.Files.find('FileName', Names{1.0});
            % 48 50
            if ~(isempty(f))
                % 50 55
                % 51 55
                % 52 55
                % 53 55
                if ispc
                    different_paths = ~(strcmpi(Paths{1.0}, f.Path));
                else
                    different_paths = ~(strcmp(Paths{1.0}, f.Path));
                end
                if different_paths
                    % 60 62
                    idx = 1.0;
                else
                    idx = [];
                end
            else
                idx = 1.0;
            end
        else
            % 69 73
            % 70 73
            % 71 73
            cur_names = get(fVec.Files, 'FileName');
            % 73 77
            % 74 77
            % 75 77
            if ischar(cur_names)
                cur_names = cellhorzcat(cur_names);
            end
            % 79 83
            % 80 83
            % 81 83
            [tf, idx] = setdiff(Names, cur_names);
            if ne(length(tf), length(Names))
                cur_paths = get(fVec.Files, 'Path');
                % 85 90
                % 86 90
                % 87 90
                % 88 90
                if ischar(cur_paths)
                    cur_paths = cellhorzcat(cur_paths);
                end
                % 92 94
                [tf, new_idx, cur_idx] = intersect(Names, cur_names);
                setPathsIdx(1.0:length(fVec.Files)) = false;
                setPathsValIdx(1.0:length(Paths)) = false;
                for i=1.0:length(new_idx)
                    % 97 102
                    % 98 102
                    % 99 102
                    % 100 102
                    if ispc
                        different_paths = ~(strcmpi(Paths{new_idx(i)}, cur_paths{cur_idx(i)}));
                    else
                        % 104 106
                        different_paths = ~(strcmp(Paths{new_idx(i)}, cur_paths{cur_idx(i)}));
                        % 106 108
                    end
                    if different_paths
                        % 109 111
                        if isempty(cur_paths{cur_idx(i)})
                            setPathsIdx(cur_idx(i)) = true;
                            setPathsValIdx(new_idx(i)) = true;
                        else
                            % 114 119
                            % 115 119
                            % 116 119
                            % 117 119
                            if ~(isempty(Paths{new_idx(i)}))
                                idx = horzcat(idx, new_idx(i));
                            end
                        end
                    end
                end % for
                if any(setPathsValIdx)
                    set(fVec.Files(setPathsIdx), {'Path'}, ctranspose(Paths(setPathsValIdx)));
                end
            end
        end
        % 129 134
        % 130 134
        % 131 134
        % 132 134
        idx = sort(idx);
        % 134 137
        % 135 137
        Names = Names(idx);
        Paths = Paths(idx);
        Groups = Groups(idx);
    end
    % 140 143
    % 141 143
    if isempty(Names)
        ret = [];
        return
    end
    % 146 148
    cnt = length(Names);
    % 148 150
    for i=cnt:-1.0:1.0
        % 150 152
        newFile(i) = RTW.BuildInfoFile(Names{i}, Paths{i}, Groups{i}, Names{i}, h.Settings);
        % 152 154
    end % for
    % 154 158
    % 155 158
    % 156 158
    fVec.Files = vertcat(horzcat(fVec.Files), ctranspose(newFile));
    % 158 161
    % 159 161
    ret = newFile(cnt);
end
function [argsOK, typeIdx, Names, Paths, Groups] = locCheckArgs(h, type, varargin)
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    argsOK = true;
    Names = {};
    Paths = {};
    Groups = {};
    typeIdx = 0.0;
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    if lt(nargin, 2.0) || gt(nargin, 5.0)
        argsOK = false;
        return
    end
    % 180 183
    % 181 183
    if ischar(type)
        [tf, typeIdx] = ismember(type, {'include','source'});
        if ne(tf, true)
            argsOK = false;
            return
        end
    else
        argsOK = false;
        return
    end
    % 192 198
    % 193 198
    % 194 198
    % 195 198
    % 196 198
    if ~(iscellstr(varargin{1.0}))
        if ~(ischar(varargin{1.0}))
            % 199 201
            argsOK = false;
            return
        end
        % 203 205
        if ~(isempty(regexp(varargin{1.0}, '^\*\.[*\w]+$', 'ONCE')))
            if lt(nargin, 4.0)
                argsOK = false;
                return
            end
            Names = locWildCardInsertion(varargin{1.0}, varargin{2.0});
        else
            Names = cellhorzcat(varargin{1.0});
        end
    else
        Names = varargin{1.0};
    end
    % 216 223
    % 217 223
    % 218 223
    % 219 223
    % 220 223
    % 221 223
    if ge(nargin, 4.0)
        % 223 226
        % 224 226
        if iscellstr(varargin{2.0})
            Paths = varargin{2.0};
            % 227 229
            if ne(length(Names), length(Paths))
                argsOK = false;
                return
            end
        else
            if ~(ischar(varargin{2.0}))
                argsOK = false;
                return
            end
            Paths(1.0:length(Names)) = cellhorzcat(varargin{2.0});
        end
        % 239 241
        Paths = RTW.transformPaths(Paths, 'pathType', 'full', 'ignoreErrors', true);
        Paths = regexprep(Paths, '(.*?)[\\/]?$', '$1');
    else
        % 243 245
        Paths(1.0:length(Names)) = {''};
    end
    % 246 250
    % 247 250
    % 248 250
    s = size(Names);
    if gt(s(1.0), s(2.0))
        Names = ctranspose(Names);
    end
    s = size(Paths);
    if gt(s(1.0), s(2.0))
        Paths = ctranspose(Paths);
    end
    % 257 262
    % 258 262
    % 259 262
    % 260 262
    idx = ~(cellfun(@isempty, Paths));
    if ispc
        % 263 265
        altIdx = ~(cellfun(@isempty, strfind(Names, '~')));
    else
        % 266 268
        altIdx = ~(cellfun(@isempty, strfind(Names, '\ ')));
    end
    % 269 271
    idx = and(idx, altIdx);
    % 271 273
    if any(idx)
        % 273 276
        % 274 276
        fPaths = strcat(Paths, filesep, Names);
        fPaths(idx) = RTW.transformPaths(fPaths(idx), 'pathType', 'full', 'ignoreErrors', true);
        % 277 281
        % 278 281
        % 279 281
        [Paths(idx), fnames, fexts] = cellfun(@fileparts, fPaths(idx), 'UniformOutput', false);
        % 281 284
        % 282 284
        Names(idx) = strcat(fnames, fexts);
        % 284 286
    end
    % 286 290
    % 287 290
    % 288 290
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end
    % 294 296
    Paths = regexprep(Paths, '[\\/]', regexp_filesep);
    % 296 298
    if ge(nargin, 5.0)
        % 298 301
        % 299 301
        if iscellstr(varargin{3.0})
            Groups = varargin{3.0};
            % 302 304
            if ne(length(Names), length(Groups))
                argsOK = false;
                return
            end
        else
            if ~(ischar(varargin{3.0}))
                argsOK = false;
                return
            end
            Groups(1.0:length(Names)) = cellhorzcat(varargin{3.0});
        end
    else
        Groups(1.0:length(Names)) = {''};
    end
    % 317 320
    % 318 320
    if gt(length(Names), 1.0)
        s = size(Groups);
        if gt(s(1.0), s(2.0))
            Groups = ctranspose(Groups);
        end
        % 324 334
        % 325 334
        % 326 334
        % 327 334
        % 328 334
        % 329 334
        % 330 334
        % 331 334
        % 332 334
        new_full_paths = strcat(Paths, Names);
        [tmp, idx] = RTW.unique(new_full_paths);
        % 335 339
        % 336 339
        % 337 339
        Names = Names(idx);
        Paths = Paths(idx);
        Groups = Groups(idx);
        % 341 345
        % 342 345
        % 343 345
        [tmp, idx] = setdiff(Names, {''});
        % 345 347
        idx = sort(idx);
        % 347 349
        Names = Names(idx);
        Paths = Paths(idx);
        Groups = Groups(idx);
    end
    % 352 356
    % 353 356
    % 354 356
    Paths = strrep(Paths, h.Settings.Matlabroot, '$(MATLAB_ROOT)');
end
function Names = locWildCardInsertion(dirPat, dirPath)
    % 358 363
    % 359 363
    % 360 363
    % 361 363
    nameStructs = dir(fullfile(dirPath, dirPat));
    % 363 365
    Names = cellhorzcat(nameStructs(:).name);
end
