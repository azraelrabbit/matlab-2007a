function ret = addLinkObjects(h, varargin)
    % 1 66
    % 2 66
    % 3 66
    % 4 66
    % 5 66
    % 6 66
    % 7 66
    % 8 66
    % 9 66
    % 10 66
    % 11 66
    % 12 66
    % 13 66
    % 14 66
    % 15 66
    % 16 66
    % 17 66
    % 18 66
    % 19 66
    % 20 66
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
    if eq(nargin, 2.0)
        newlib = locCheckLibVector(h, varargin{1.0});
        if ~(isempty(newlib))
            ret = locAddLibVector(h, newlib);
        else
            ret = [];
        end
        return
    end
    % 74 77
    % 75 77
    [args_ok, Names, Paths, LinkPriority, Precompiled, LinkOnly, Groups] = locCheckArgs(h, varargin{:});
    % 77 80
    % 78 80
    if ~(args_ok)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfo.addLinkObjects');
        % 81 83
    end
    % 83 86
    % 84 86
    cur_names = get(h.LinkObj, 'Name');
    if ~(isempty(cur_names))
        % 87 90
        % 88 90
        [tf, idx] = setdiff(Names, cur_names);
        % 90 94
        % 91 94
        % 92 94
        idx = sort(idx);
        % 94 97
        % 95 97
        Names = Names(idx);
        Paths = Paths(idx);
        LinkPriority = LinkPriority(idx);
        Precompiled = Precompiled(idx);
        LinkOnly = LinkOnly(idx);
        Groups = Groups(idx);
    end
    % 103 105
    if isempty(Names)
        ret = [];
        return
    end
    % 108 110
    cnt = length(Names);
    for i=cnt:-1.0:1.0
        % 111 113
        newlib(i) = RTW.BuildInfoLinkObj(Names{i}, Paths{i}, LinkPriority(i), Groups{i}, h.Settings);
        % 113 117
        % 114 117
        % 115 117
        newlib(i).Precompiled = Precompiled(i);
        newlib(i).LinkOnly = LinkOnly(i);
        newlib(i).Settings.FileSep = h.Settings.FileSep;
        newlib(i).Settings.MatlabRoot = h.Settings.MatlabRoot;
    end % for
    % 121 123
    ret = locAddLibVector(h, newlib);
end
function ret = locAddLibVector(h, newlib)
    % 125 132
    % 126 132
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    ret = newlib(end);
    % 132 136
    % 133 136
    % 134 136
    tmp_list = vertcat(horzcat(h.LinkObj), ctranspose(newlib));
    priorities = get(tmp_list, 'LinkPriority');
    % 137 141
    % 138 141
    % 139 141
    if iscell(priorities)
        priorities = cell2mat(priorities);
    end
    [tmp, idx] = sort(priorities);
    % 144 148
    % 145 148
    % 146 148
    h.LinkObj = tmp_list(idx);
end
function newlib = locCheckLibVector(h, libs)
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    for i=1.0:length(libs)
        if ~(isa(libs(i), 'RTW.BuildInfoLinkObj'))
            DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfo.addLinkObjects');
            % 157 159
        end
    end % for
    % 160 162
    Names = get(libs, 'Name');
    if ~(iscell(Names))
        Names = cellhorzcat(Names);
    end
    % 165 168
    % 166 168
    if gt(length(Names), 1.0)
        % 168 170
        [Names, idx] = RTW.unique(Names);
        % 170 172
        Names = Names(idx);
        libs = libs(idx);
    end
    % 174 176
    cur_names = get(h.LinkObj, 'Name');
    if ~(isempty(cur_names))
        % 177 180
        % 178 180
        [tf, idx] = setdiff(Names, cur_names);
        % 180 183
        % 181 183
        idx = sort(idx);
        % 183 186
        % 184 186
        libs = libs(idx);
    end
    % 187 191
    % 188 191
    % 189 191
    for i=1.0:length(libs)
        libs(i).Settings = h.Settings;
        % 192 194
        libs(i).Src.Settings = h.Settings;
        set(libs(i).Src.Files, 'Settings', h.Settings);
        % 195 197
        libs(i).Inc.Settings = h.Settings;
        set(libs(i).Inc.Files, 'Settings', h.Settings);
        % 198 202
        % 199 202
        % 200 202
        libs(i).updateFileSeparator();
    end % for
    % 203 205
    newlib = libs;
end
function [args_ok, Names, Paths, LinkPri, Precomp, LinkOnly, Groups] = locCheckArgs(h, varargin)
    % 207 212
    % 208 212
    % 209 212
    % 210 212
    args_ok = true;
    Names = {};
    Paths = {};
    LinkPri = [];
    Precomp = [];
    LinkOnly = [];
    Groups = {};
    % 218 221
    % 219 221
    if lt(nargin, 2.0) || gt(nargin, 7.0)
        args_ok = false;
        return
    end
    % 224 230
    % 225 230
    % 226 230
    % 227 230
    % 228 230
    if ~(iscellstr(varargin{1.0}))
        if ~(ischar(varargin{1.0}))
            % 231 233
            args_ok = false;
            return
        end
        Names = cellhorzcat(varargin{1.0});
    else
        Names = varargin{1.0};
    end
    % 239 246
    % 240 246
    % 241 246
    % 242 246
    % 243 246
    % 244 246
    if ge(nargin, 3.0)
        % 246 249
        % 247 249
        if iscellstr(varargin{2.0})
            Paths = varargin{2.0};
            % 250 252
            if ne(length(Names), length(Paths))
                args_ok = false;
                return
            end
        else
            if ~(ischar(varargin{2.0}))
                args_ok = false;
                return
            end
            Paths(1.0:length(Names)) = cellhorzcat(varargin{2.0});
        end
        % 262 264
        Paths = RTW.transformPaths(Paths, 'pathType', 'full', 'ignoreErrors', true);
        Paths = regexprep(Paths, '(.*?)[\\/]?$', '$1');
    else
        % 266 268
        Paths(1.0:length(Names)) = {''};
    end
    % 269 273
    % 270 273
    % 271 273
    s = size(Names);
    if gt(s(1.0), s(2.0))
        Names = ctranspose(Names);
    end
    s = size(Paths);
    if gt(s(1.0), s(2.0))
        Paths = ctranspose(Paths);
    end
    % 280 285
    % 281 285
    % 282 285
    % 283 285
    idx = ~(cellfun(@isempty, Paths));
    if ispc
        % 286 288
        altIdx = ~(cellfun(@isempty, strfind(Names, '~')));
    else
        % 289 291
        altIdx = ~(cellfun(@isempty, strfind(Names, '\ ')));
    end
    % 292 294
    idx = and(idx, altIdx);
    % 294 296
    if any(idx)
        % 296 299
        % 297 299
        fPaths = strcat(Paths, filesep, Names);
        fPaths(idx) = RTW.transformPaths(fPaths(idx), 'pathType', 'full', 'ignoreErrors', true);
        % 300 304
        % 301 304
        % 302 304
        [Paths(idx), fnames, fexts] = cellfun(@fileparts, fPaths(idx), 'UniformOutput', false);
        % 304 307
        % 305 307
        Names(idx) = strcat(fnames, fexts);
        % 307 309
    end
    % 309 312
    % 310 312
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end
    % 316 318
    Paths = regexprep(Paths, '[\\/]', regexp_filesep);
    % 318 322
    % 319 322
    % 320 322
    if ge(nargin, 4.0)
        % 322 325
        % 323 325
        if ~(isscalar(varargin{3.0}))
            LinkPri = varargin{3.0};
            % 326 328
            if ne(length(Names), length(LinkPri))
                args_ok = false;
                return
            end
        else
            LinkPri(1.0:length(Names)) = varargin{3.0};
        end
    else
        LinkPri(1.0:length(Names)) = 1000.0;
    end
    % 337 340
    % 338 340
    if ge(nargin, 5.0)
        % 340 343
        % 341 343
        if ~(isscalar(varargin{4.0}))
            Precomp = varargin{4.0};
            % 344 346
            if ne(length(Names), length(Precomp))
                args_ok = false;
                return
            end
        else
            Precomp(1.0:length(Names)) = eq(varargin{4.0}, 1.0);
        end
    else
        Precomp(1.0:length(Names)) = false;
    end
    % 355 358
    % 356 358
    if ge(nargin, 6.0)
        % 358 361
        % 359 361
        if ~(isscalar(varargin{5.0}))
            LinkOnly = varargin{5.0};
            % 362 364
            if ne(length(Names), length(LinkOnly))
                args_ok = false;
                return
            end
        else
            LinkOnly(1.0:length(Names)) = varargin{5.0};
        end
    else
        LinkOnly(1.0:length(Names)) = false;
    end
    % 373 375
    if ge(nargin, 7.0)
        % 375 378
        % 376 378
        if iscellstr(varargin{6.0})
            Groups = varargin{6.0};
            % 379 381
            if ne(length(Names), length(Groups))
                args_ok = false;
                return
            end
        else
            if ~(ischar(varargin{6.0}))
                args_ok = false;
                return
            end
            Groups(1.0:length(Names)) = cellhorzcat(varargin{6.0});
        end
    else
        Groups(1.0:length(Names)) = {''};
    end
    % 394 397
    % 395 397
    if gt(length(Names), 1.0)
        % 397 399
        [Names, idx] = RTW.unique(Names);
        % 399 403
        % 400 403
        % 401 403
        Paths = Paths(idx);
        LinkPri = LinkPri(idx);
        Precomp = Precomp(idx);
        LinkOnly = LinkOnly(idx);
        Groups = Groups(idx);
    end
    % 408 412
    % 409 412
    % 410 412
    Paths = strrep(Paths, h.Settings.Matlabroot, '$(MATLAB_ROOT)');
end
