function dlwObj = DataLoadWorkspace(srcObj, varargin)
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
    dlwObj = MPlay.DataLoadWorkspace;
    % 18 22
    % 19 22
    % 20 22
    dlwObj.srcObj = srcObj;
    % 22 24
    mplayObj = srcObj.mplayObj;
    % 24 27
    % 25 27
    isCmdLine = gt(nargin, 1.0);
    if isCmdLine
        % 28 30
        if ischar(varargin{1.0})
            % 30 32
            mplayObj.loadexprObj.mlvar = varargin{1.0};
            already_evaluated = false;
        else
            % 34 40
            % 35 40
            % 36 40
            % 37 40
            % 38 40
            mplayObj.loadexprObj.mlvar = '';
            expr = varargin{1.0};
            already_evaluated = true;
        end % if
    else
        % 44 47
        % 45 47
        already_evaluated = true;
        expr = mplayObj.loadexprObj.mlvarEval;
    end % if
    % 49 59
    % 50 59
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    if not(already_evaluated)
        % 59 61
        try
            % 61 64
            % 62 64
            exprStr = mplayObj.loadexprObj.mlvar;
            if isempty(exprStr)
                % 65 67
                dlwObj.errorMsg = 'Expression is empty.';
                return;
            end % if
            % 69 72
            % 70 72
            expr = evalin('base', exprStr);
        catch
            % 73 81
            % 74 81
            % 75 81
            % 76 81
            % 77 81
            % 78 81
            % 79 81
            dlwObj.errorMsg = lasterr;
            return;
        end % try
    end % if
    % 84 86
    varargin{1.0} = expr;
    install_data_info(dlwObj, varargin{:});
    if not(strcmp(dlwObj.errorStatus, 'success'))
        return;
    end % if
    % 90 92
    install_source_name(dlwObj, isCmdLine, mplayObj.loadexprObj.mlvar);
    install_getframefcn(dlwObj);
    % 93 95
    dlwObj.errorStatus = 'success';
function install_source_name(dlwObj, isCmdLine, exprStr)
    % 96 112
    % 97 112
    % 98 112
    % 99 112
    % 100 112
    % 101 112
    % 102 112
    % 103 112
    % 104 112
    % 105 112
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    if isCmdLine && isempty(exprStr)
        % 112 115
        % 113 115
        exprStr = '(MATLAB Expression)';
    end % if
    dlwObj.type = 'Workspace';
    dlwObj.sourceName = exprStr;
    dlwObj.sourceNameShort = exprStr;
function install_data_info(dlwObj, A, fps)
    % 120 133
    % 121 133
    % 122 133
    % 123 133
    % 124 133
    % 125 133
    % 126 133
    % 127 133
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    if gt(nargin, 1.0)
        dlwObj.videoData = A;
    else
        dlwObj.videoData = getCheckerboardMovie;
    end % if
    [dlwObj.videoData, dlwObj.colorSpace, dlwObj.arrayFormat, dlwObj.colorMap, errMsg] = CheckMovieFormat(dlwObj.videoData);
    % 138 142
    % 139 142
    % 140 142
    if not(isempty(errMsg))
        % 142 144
        dlwObj.errorStatus = 'failure';
        dlwObj.errorMsg = errMsg;
        return;
    end % if
    % 147 149
    if gt(nargin, 2.0)
        dlwObj.frameRate = fps;
    end % if
    % 151 154
    % 152 154
    switch dlwObj.arrayFormat
    case 'array'
        % 155 157
        dlwObj.dataType = class(dlwObj.videoData);
        dlwObj.frameRows = size(dlwObj.videoData, 1.0);
        dlwObj.frameCols = size(dlwObj.videoData, 2.0);
        switch dlwObj.colorSpace
        case 'intensity'
            dlwObj.numFrames = size(dlwObj.videoData, 3.0);
        otherwise
            dlwObj.numFrames = size(dlwObj.videoData, 4.0);
        end % switch
    case 'struct'
        % 166 170
        % 167 170
        % 168 170
        dlwObj.dataType = class(dlwObj.videoData(1.0).cdata);
        dlwObj.frameRows = size(dlwObj.videoData(1.0).cdata, 1.0);
        dlwObj.frameCols = size(dlwObj.videoData(1.0).cdata, 2.0);
        dlwObj.numFrames = numel(dlwObj.videoData);
    end % switch
    % 174 177
    % 175 177
    dlwObj.errorStatus = 'success';
function install_getframefcn(dlwObj)
    % 178 184
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    switch dlwObj.arrayFormat
    case 'struct'
        dlwObj.getVideoFrameFcn = @get_struct_frame;
    otherwise
        switch dlwObj.colorSpace
        case 'intensity'
            dlwObj.getVideoFrameFcn = @get_intensity_array_frame;
        otherwise
            dlwObj.getVideoFrameFcn = @get_rgb_array_frame;
        end % switch
    end % switch
function y = get_struct_frame(dlwObj, idx)
    % 195 198
    % 196 198
    y = dlwObj.videoData(idx).cdata;
function y = get_intensity_array_frame(dlwObj, idx)
    % 199 201
    y = dlwObj.videoData(:, :, idx);
function y = get_rgb_array_frame(dlwObj, idx)
    % 202 204
    y = dlwObj.videoData(:, :, :, idx);
function A = getCheckerboardMovie
    % 205 213
    % 206 213
    % 207 213
    % 208 213
    % 209 213
    % 210 213
    % 211 213
    P = 128.0;
    N = 1.0;
    T = 5.0;
    A = zeros(P, P, 3.0, T, 'uint8');
    for i=1.0:T
        A(:, :, :, i) = uint8(mtimes(255.0, checker_board(P, N)));
        P = mrdivide(P, 2.0);
        N = mtimes(N, 2.0);
    end % for
function [A, cspace, fmt, cmap, errMsg] = CheckMovieFormat(A)
    % 222 244
    % 223 244
    % 224 244
    % 225 244
    % 226 244
    % 227 244
    % 228 244
    % 229 244
    % 230 244
    % 231 244
    % 232 244
    % 233 244
    % 234 244
    % 235 244
    % 236 244
    % 237 244
    % 238 244
    % 239 244
    % 240 244
    % 241 244
    % 242 244
    errMsg = '';
    fmt = 'array';
    cspace = 'intensity';
    cmap = gray(256.0);
    % 247 251
    % 248 251
    % 249 251
    if isstruct(A)
        % 251 257
        % 252 257
        % 253 257
        % 254 257
        % 255 257
        if not(isfield(A, 'colormap')) || not(isfield(A, 'cdata'))
            errMsg = 'Movie structure does not contain ".cdata" and/or ".colormap" fields.';
            return;
        end % if
        if isempty(A)
            % 261 264
            % 262 264
            A(1.0).cdata = uint8([]);
            A(1.0).colormap = [];
        end % if
        % 266 274
        % 267 274
        % 268 274
        % 269 274
        % 270 274
        % 271 274
        % 272 274
        iNumToCheck = 1.0;
        % 274 277
        % 275 277
        warnCmap = true;
        for i=1.0:iNumToCheck
            % 278 280
            if not(isempty(A(i).colormap))
                if warnCmap
                    % 281 294
                    % 282 294
                    % 283 294
                    % 284 294
                    % 285 294
                    % 286 294
                    % 287 294
                    % 288 294
                    % 289 294
                    % 290 294
                    % 291 294
                    % 292 294
                    cmap = A(i).colormap;
                    warnCmap = false;
                end % if
            end % if
        end % for
        % 298 300
        fmt = 'struct';
        % 300 306
        % 301 306
        % 302 306
        % 303 306
        % 304 306
        [cspace, errMsg] = CheckArrayFormat(A(1.0).cdata, 1.0);
    else
        % 307 309
        fmt = 'array';
        [cspace, errMsg] = CheckArrayFormat(A);
    end % if
function [cspace, errMsg] = CheckArrayFormat(A, RGBif3)
    % 312 332
    % 313 332
    % 314 332
    % 315 332
    % 316 332
    % 317 332
    % 318 332
    % 319 332
    % 320 332
    % 321 332
    % 322 332
    % 323 332
    % 324 332
    % 325 332
    % 326 332
    % 327 332
    % 328 332
    % 329 332
    % 330 332
    errMsg = '';
    % 332 334
    if lt(nargin, 2.0)
        RGBif3 = false;
    end % if
    cspace = 'intensity';
    if not(isnumeric(A)) && not(islogical(A))
        errMsg = 'Invalid video data - must be a numeric or logical data type.';
        return;
    end % if
    if issparse(A)
        errMsg = 'Sparse arrays are not supported for video data.';
        return;
    end % if
    if not(isreal(A))
        errMsg = 'Complex values are not supported for video data.';
        return;
    end % if
    % 349 351
    switch class(A)
    case {'double','single','uint8','uint16','uint32','int8','int16','int32','logical'}
    otherwise
        % 353 355
        errMsg = sprintf('Numeric data type "%s" is not supported for video data.', class(A));
        return;
    end % switch
    % 357 366
    % 358 366
    % 359 366
    % 360 366
    % 361 366
    % 362 366
    % 363 366
    % 364 366
    nd = ndims(A);
    sz = size(A);
    if gt(nd, 4.0)
        errMsg = {'Invalid movie format: array contains more than 4 dimensions.','Consider using SQUEEZE to convert to 4-D or 3-D array.'};
        % 369 371
        return;
    else
        if eq(nd, 4.0)
            if ne(sz(3.0), 3.0)
                errMsg = {'Invalid movie format: size of 3rd dimension must be 3','for RGB movies, since RGB color planes are represented','in the 3rd dimension as MxNx3xT.','','If this is an intensity movie, consider using SQUEEZE to','convert to a 3-D intensity array.'};
                % 375 381
                % 376 381
                % 377 381
                % 378 381
                % 379 381
                return;
            end % if
            cspace = 'rgb';
        else
            if eq(nd, 3.0)
                % 385 394
                % 386 394
                % 387 394
                % 388 394
                % 389 394
                % 390 394
                % 391 394
                % 392 394
                if RGBif3
                    cspace = 'rgb';
                else
                    cspace = 'intensity';
                end % if
            else
                % 399 401
                cspace = 'intensity';
            end % if
        end % if
    end % if
