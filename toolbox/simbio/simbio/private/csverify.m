function [tf, transinfo, rawinfo] = csverify(f, argidx)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    ff = functions(f);
    switch ff.type
    case 'simple'
        if isempty(ff.file) || strcmp(ff.file, 'MATLAB built-in function')
            if ismember(ff.function, localGetCalls('builtin'))
                rawinfo = struct('lineno', cell(0.0, 1.0), 'code', cell(0.0, 1.0), 'auxstr', cell(0.0, 1.0));
            else
                rawinfo.lineno = 0.0;
                rawinfo.code = 'NON_MFILE_INPUT_BAD_CALL';
                rawinfo.auxstr = ff.function;
            end
        else
            % 35 37
            T = mtree(ff.file, '-file');
            % 37 40
            % 38 40
            [fatalerr, rawinfo] = localRestrictLanguage(T, argidx);
            if isempty(rawinfo)
                rawinfo = localCXChk(T, argidx);
            else
                % 43 45
            end
        end
    otherwise
        % 47 49
        error('MATLAB:csjac:UnsupportedFunctionHandleType', 'The input must be a function handle to an ordinary or built-in function.');
        % 49 51
    end
    % 51 54
    % 52 54
    lns = ctranspose(horzcat(rawinfo.lineno));
    [jnk, idx] = sort(lns);
    rawinfo = rawinfo(idx);
    % 56 59
    % 57 59
    tf = localMakeTF(rawinfo);
    transinfo = localTranslateInfo(rawinfo);
end
function [tffatal, info] = localRestrictLanguage(T, argidx)
    % 62 66
    % 63 66
    % 64 66
    tffatal = false;
    info = struct('lineno', cell(0.0, 1.0), 'code', cell(0.0, 1.0), 'auxstr', cell(0.0, 1.0));
    R = root(T);
    % 68 71
    % 69 71
    errs = find(T, 'Kind', 'ERR');
    if ~(isempty(errs))
        lns = lineno(errs);
        lns = mat2cell(lns, ones(numel(lns), 1.0));
        info = vertcat(info, struct('lineno', lns, 'code', 'PARSE_ERR', 'auxstr', []));
        tffatal = true;
        return
    end
    % 78 82
    % 79 82
    % 80 82
    if ~(iskind(R, 'FUNCTION'))
        info(plus(end, 1.0), 1.0).lineno = lineno(R);
        info(end, 1.0).code = 'NON_FUNCTION_MFILE';
        tffatal = true;
        return
    end
    % 87 90
    % 88 90
    inargs = list(path(R, 'Ins'));
    if eq(count(inargs), 0.0)
        info(plus(end, 1.0), 1.0).lineno = lineno(R);
        info(end, 1.0).code = 'NO_INPUT_ARGS';
        tffatal = true;
        return
    end
    if lt(count(inargs), argidx)
        info(plus(end, 1.0), 1.0).lineno = lineno(R);
        info(end, 1.0).code = 'TOO_FEW_INPUT_ARGS';
        tffatal = true;
        return
    end
    % 102 105
    % 103 105
    outargs = list(path(R, 'Outs'));
    if ne(count(outargs), 1.0)
        info(plus(end, 1.0), 1.0).lineno = lineno(R);
        info(end, 1.0).code = 'NOT_ONE_OUTPUT_ARG';
    end
    % 109 115
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    badnodes = find(T, 'Kind', localGetKinds('restrict', 'forbid'));
    codes = strcat('BADNODE_', kinds(badnodes));
    lns = lineno(badnodes);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', codes, 'auxstr', []));
    % 119 123
    % 120 123
    % 121 123
    okcallnames = vertcat(localGetCalls('restrict', 'level0'), localGetCalls('restrict', 'level1'), localGetCalls('restrict', 'level2'));
    % 123 126
    % 124 126
    allcalls = find(T, 'Kind', 'CALL');
    okcalls = find(T, 'Kind', 'CALL', 'Left.String', okcallnames);
    badcalls = minus(allcalls, okcalls);
    lns = lineno(badcalls);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    na = strings(path(badcalls, 'Left'));
    na = na(:);
    info = vertcat(info, struct('lineno', lns, 'code', 'BAD_CALL', 'auxstr', na));
    % 133 137
    % 134 137
    % 135 137
    xtrafns = find(T, 'Kind', 'FUNCTION');
    xtrafns = minus(xtrafns, R);
    lns = lineno(xtrafns);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'MULTIPLE_FUNCTION_DEFS', 'auxstr', []));
    % 141 144
    % 142 144
    numlits = find(T, 'Kind', {'DOUBLE';'INT'});
    for c=numlits.indices
        node = T.select(c);
        if ~(isempty(regexp(string(node), '[ij]', 'once')))
            info(plus(end, 1.0), 1.0).lineno = lineno(node);
            info(end, 1.0).code = 'I_OR_J_IN_NUMERIC_LITERAL';
        end
    end % for
end
function info = localCXChk(T, argidx)
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    R = root(T);
    cxin = path(R, 'Ins');
    for c=1.0:minus(argidx, 1.0)
        cxin = path(cxin, 'Next');
    end % for
    % 162 167
    % 163 167
    % 164 167
    % 165 167
    setPropUnOps = find(T, 'Kind', localGetKinds('propagate', 'unary'));
    setPropBinOps = find(T, 'Kind', localGetKinds('propagate', 'binary'));
    setPropUnOpList = find(T, 'Kind', localGetKinds('propagate', 'unarylist'));
    setPropSubscr = find(T, 'Kind', localGetKinds('propagate', 'subscript'));
    setPropCalls = find(T, 'Kind', 'CALL', 'Left.String', localGetCalls('propagate'));
    setEq = geteq(T);
    setLHS = fullsubtree(path(setEq, 'Left'));
    setLHSSubscr = find(setLHS, 'Kind', {'SUBSCR','CELL','DOTLP','DOT'});
    % 174 176
    cxset = cxin;
    while true
        % 177 180
        % 178 180
        oldcxset = cxset;
        % 180 183
        % 181 183
        cxset = growset(cxset, @localIsSetBy);
        % 183 188
        % 184 188
        % 185 188
        % 186 188
        cxset = (cxset) | (find(setPropUnOps, 'Arg.Member', cxset));
        % 188 191
        % 189 191
        cxset = (cxset) | (find(setPropBinOps, 'Left.Member', cxset));
        cxset = (cxset) | (find(setPropBinOps, 'Right.Member', cxset));
        % 192 195
        % 193 195
        cxset = (cxset) | (find(setPropUnOpList, 'Arg+|.Member', cxset));
        % 195 198
        % 196 198
        cxset = (cxset) | (find(setPropCalls, 'Right+|.Member', cxset));
        % 198 201
        % 199 201
        cxset = (cxset) | (find(setPropSubscr, 'Left.Member', cxset));
        % 201 206
        % 202 206
        % 203 206
        % 204 206
        cxeq = find(setEq, 'Right.Member', cxset);
        cxset = (cxset) | (cxeq);
        % 207 210
        % 208 210
        cxset = (cxset) | (list(path(cxeq, 'Left')));
        % 210 213
        % 211 213
        lhscxsubscr = and(cxset, setLHSSubscr);
        cxset = (cxset) | (path(lhscxsubscr, 'Left'));
        % 214 217
        % 215 217
        if eq(cxset, oldcxset)
            break
        end
        % 219 221
    end % while
    % 221 228
    % 222 228
    % 223 228
    % 224 228
    % 225 228
    % 226 228
    info = struct('lineno', cell(0.0, 1.0), 'code', cell(0.0, 1.0), 'auxstr', cell(0.0, 1.0));
    % 228 231
    % 229 231
    s = find(T, 'Kind', localGetKinds('error', 'unary'), 'Arg.Member', cxset);
    lns = lineno(s);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'UNARY_OP_WITH_CPLX_ARG', 'auxstr', localKind2Str(kinds(s))));
    % 234 239
    % 235 239
    % 236 239
    % 237 239
    setErrBinOp = find(T, 'Kind', localGetKinds('error', 'binary'));
    s = (find(setErrBinOp, 'Left.Member', cxset)) | (find(setErrBinOp, 'Right.Member', cxset));
    % 240 242
    lns = lineno(s);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'BINARY_OP_WITH_CPLX_ARG', 'auxstr', localKind2Str(kinds(s))));
    % 244 249
    % 245 249
    % 246 249
    % 247 249
    s = find(T, 'Kind', 'CALL', 'Left.String', localGetCalls('error', 'reg'), 'Right+|.Member', cxset);
    lns = lineno(s);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'CALL_WITH_CPLX_ARG', 'auxstr', ctranspose(strings(path(s, 'Left')))));
    % 252 257
    % 253 257
    % 254 257
    % 255 257
    s = find(T, 'Kind', 'IF', 'Left.Member', cxset);
    lns = lineno(s);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'CPLX_IF_CONDITION', 'auxstr', []));
    % 260 266
    % 261 266
    % 262 266
    % 263 266
    % 264 266
    s = find(T, 'Kind', 'FOR', 'Vector.Member', cxset);
    lns = lineno(s);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'CPLX_FOR_VECTOR', 'auxstr', []));
    % 269 274
    % 270 274
    % 271 274
    % 272 274
    s = find(T, 'Kind', 'WHILE', 'Left.Member', cxset);
    lns = lineno(s);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'CPLX_WHILE_CONDITION', 'auxstr', []));
    % 277 282
    % 278 282
    % 279 282
    % 280 282
    s = find(T, 'Kind', 'SWITCH', 'Left.Member', cxset);
    lns = lineno(s);
    lns = mat2cell(lns, ones(numel(lns), 1.0));
    info = vertcat(info, struct('lineno', lns, 'code', 'CPLX_SWITCH_CONDITION', 'auxstr', []));
    % 285 291
    % 286 291
    % 287 291
    % 288 291
    % 289 291
    out = path(R, 'Outs');
    if isempty(and(out, cxset))
        info(plus(end, 1.0), 1.0).lineno = lineno(R);
        info(end, 1.0).code = 'OUTPUT_NOT_CPLX';
        info(end, 1.0).auxstr = [];
    end
end
function tf = localMakeTF(info)
    % 298 303
    % 299 303
    % 300 303
    % 301 303
    codes = ctranspose(cellhorzcat(info.code));
    if all(strcmp(codes, 'OUTPUT_NOT_CPLX'))
        tf = true;
    else
        tf = false;
    end
end
function transInfo = localTranslateInfo(rawinfo)
    % 310 316
    % 311 316
    % 312 316
    % 313 316
    % 314 316
    lut.BAD_CALL = 'Unsupported call: The function ''%s'' is not supported.';
    lut.BADNODE_AT = 'Unsupported syntax: Function handles are not supported.';
    lut.BADNODE_ANON = 'Unsupported syntax: Anonymous functions are not supported.';
    lut.BADNODE_BANG = 'Unsupported syntax: Operating system calls are not supported.';
    lut.BADNODE_CLASSDEF = 'Unsupported syntax: Class definitions are not supported.';
    lut.BADNODE_DOT = 'Unsupported syntax: Dot-referencing is not supported.';
    lut.BADNODE_DOTLP = 'Unsupported syntax: Dot-referencing is not supported.';
    lut.BADNODE_DCALL = 'Unsupported syntax: Functions must be called with parenthesis around arguments.';
    lut.BADNODE_DUAL = 'Unsupported syntax: Functions must be called with parenthesis around arguments.';
    lut.BADNODE_GLOBAL = 'Unsupported syntax: Use of global variables is not allowed.';
    lut.BADNODE_PARFOR = 'Unsupported syntax: Parallel MATLAB functions are not supported.';
    lut.BADNODE_PERSISTENT = 'Unsupported syntax: Use of persistent variables is not allowed.';
    lut.BADNODE_TRY = 'Unsupported syntax: Try-catch blocks are not allowed.';
    lut.BINARY_OP_WITH_CPLX_ARG = 'Unsupported operator: The operator ''%s'' has potentially complex arguments.';
    lut.NON_MFILE_INPUT_BAD_CALL = 'Unsupported call: The function ''%s'' cannot be used with complex-step.';
    lut.CALL_WITH_CPLX_ARG = 'Unsupported call: The function ''%s'' has potentially complex argument(s).';
    lut.CPLX_IF_CONDITION = 'If conditions may not take on potentially complex values.';
    lut.CPLX_FOR_VECTOR = 'For loops may not loop over potentially complex values.';
    lut.CPLX_WHILE_CONDITION = 'While conditions may not take on potentially complex values.';
    lut.CPLX_SWITCH_CONDITION = 'Switch expressions may not take on potentially complex values.';
    lut.I_OR_J_IN_NUMERIC_LITERAL = 'Unsupported syntax: Explicit use of the imaginary units i and j is not allowed.';
    lut.MULTIPLE_FUNCTION_DEFS = 'Unsupported syntax: Subfunctions and nested function definitions are not allowed.';
    lut.NO_INPUT_ARGS = 'Improper arguments: The function must take at least one input argument.';
    lut.NON_FUNCTION_MFILE = 'Unsupported syntax: The M-file must be a function definition and not a script.';
    lut.NOT_ONE_OUTPUT_ARG = 'Improper arguments: The function must have exactly one output argument.';
    lut.OUTPUT_NOT_CPLX = 'Warning: The function output does not appear to depend continuously on the differentiation variable.';
    lut.PARSE_ERR = 'Parse error: There appears to be a syntax error in the code. Run M-lint for details.';
    lut.TOO_FEW_INPUT_ARGS = 'Improper arguments: This function does not have enough input arguments.';
    lut.UNARY_OP_WITH_CPLX_ARG = 'Unsupported operator: The operator ''%s'' has a potentially complex argument.';
    % 344 346
    transInfo = [];
    for c=1.0:numel(rawinfo)
        info = rawinfo(c);
        if isfield(lut, info.code)
            msg = lut.(info.code);
            msg = sprintf(msg, info.auxstr);
            transInfo = localAddTransInfo(transInfo, info.lineno, cellhorzcat(msg));
        else
            % 353 355
        end
    end % for
end
function info = localAddTransInfo(info, linenos, msgs)
    % 358 363
    % 359 363
    % 360 363
    % 361 363
    for c=1.0:numel(linenos)
        linestr = sprintf('line%d', linenos(c));
        if isfield(info, linestr)
            info.(linestr)(plus(end, 1.0), 1.0) = msgs(c);
        else
            info.(linestr) = msgs(c);
        end
    end % for
end
function tf = localIsSetBy(o, node)
    % 372 376
    % 373 376
    % 374 376
    if strcmp(kind(node), 'ID')
        tf = ~(isempty(and(sets(node), o)));
    else
        tf = false;
    end
end
function s = localKind2Str(k)
    % 382 386
    % 383 386
    % 384 386
    [strs, kinds] = mtreemex;
    kinds = fieldnames(kinds);
    % 387 389
    s = cell(size(k));
    for c=1.0:numel(k)
        idx = strcmp(k{c}, kinds);
        if ne(nnz(idx), 1.0)
            error('MATLAB:csverify', 'Internal error.');
        else
            s(c) = strs(idx);
        end
    end % for
end
function n = localGetKinds(a, b)
    % 399 403
    % 400 403
    % 401 403
    switch a
    case 'restrict'
        switch b
        case 'forbid'
            n = {'DOT';'DOTLP';'ANON';'ANONID';'AT';'ATBASE';'BANG';'CLASSDEF';'DUAL';'DCALL';'ERR';'EVENTS';'GLOBAL';'METHODS';'PARFOR';'PERSISTENT';'PROPERTIES';'QUEST';'CATCH';'CEXPR';'EVENT';'FIELD';'TRY'};
            % 408 411
            % 409 411
        case 'level0'
            % 410 412
            n = {'PLUS';'UPLUS';'MINUS';'UMINUS';'MUL';'DOTMUL';'DOTEXP';'DOTLDIV';'DOTDIV';'LT';'GT';'LE';'GE';'DOTTRANS';'DOUBLE';'INT';'STRING';'LB';'LC';'ROW';'EXPR';'PRINT';'SUBSCR';'CELL';'RETURN';'ID';'CALL';'FUNCTION';'EQUALS'};
            % 413 422
            % 414 422
            % 415 422
            % 416 422
            % 417 422
            % 418 422
            % 419 422
            % 420 422
        case 'level1'
            % 421 423
            n = {'DIV';'EXP';'LDIV';'BREAK';'CASE';'CONTINUE';'FOR';'IF';'OTHERWISE';'SWITCH';'WHILE'};
            % 424 426
        case 'level2'
            % 425 427
            n = {'AND';'ANDAND';'EQ';'NE';'NOT';'OR';'OROR';'COLON';'TRANS'};
        otherwise
            error('MATLAB:csverify', 'Internal error.');
        end
    case 'propagate'
        % 431 433
        switch b
        case 'unary'
            n = {'TRANS';'DOTTRANS';'UMINUS';'UPLUS'};
        case 'binary'
            n = {'PLUS';'MINUS';'MUL';'DIV';'LDIV';'EXP';'DOTMUL';'DOTDIV';'DOTLDIV';'DOTEXP';'COLON'};
        case 'unarylist'
            % 438 440
            n = {'LB';'LC';'ROW'};
        case 'subscript'
            n = {'SUBSCR';'CELL'};
        otherwise
            error('MATLAB:csverify', 'Internal error.');
        end
    case 'error'
        % 446 448
        switch b
        case 'unary'
            n = {'TRANS';'NOT'};
        case 'binary'
            n = {'AND';'ANDAND';'COLON';'EQ';'NE';'OR';'OROR'};
        case 'subscript'
            n = {'SUBSCR';'CELL'};
        otherwise
            error('MATLAB:csverify', 'Internal error.');
        end
    otherwise
        % 458 460
        error('MATLAB:csverify', 'Internal error.');
    end
end
function n = localGetCalls(a, b)
    % 463 467
    % 464 467
    % 465 467
    switch a
    case 'builtin'
        n = {'sin';'sinh';'asin';'asinh';'cos';'cosh';'acos';'acosh';'tan';'tanh';'atan';'atanh';'sec';'sech';'asec';'asech';'csc';'csch';'acsc';'acsch';'cot';'coth';'acot';'acoth';'exp';'log';'log10';'sqrt';'trace'};
        % 470 475
        % 471 475
        % 472 475
        % 473 475
    case 'restrict'
        % 474 476
        switch b
        case 'level0'
            n = {'sin';'sinh';'asin';'asinh';'cos';'cosh';'acos';'acosh';'tan';'tanh';'atan';'atanh';'sec';'sech';'asec';'asech';'csc';'csch';'acsc';'acsch';'cot';'coth';'acot';'acoth';'exp';'sum';'prod';'zeros';'ones';'eye';'repmat';'size';'length';'ndims';'numel';'disp';'isempty';'reshape';'diag';'blkdiag';'fliplr';'flipud';'flipdim';'end';'pi';'trace';'error'};
            % 479 490
            % 480 490
            % 481 490
            % 482 490
            % 483 490
            % 484 490
            % 485 490
            % 486 490
            % 487 490
            % 488 490
        case 'level1'
            % 489 491
            n = {'log';'log10';'sqrt'};
        case 'level2'
            n = {'abs';'max';'min'};
        case 'level3'
            % 494 496
            n = {'fix';'round'};
        otherwise
            error('MATLAB:csverify', 'Internal error.');
        end
    case 'propagate'
        % 500 502
        n = {'sin';'sinh';'asin';'asinh';'cos';'cosh';'acos';'acosh';'tan';'tanh';'atan';'atanh';'sec';'sech';'asec';'asech';'csc';'csch';'acsc';'acsch';'cot';'coth';'acot';'acoth';'exp';'log';'log10';'sqrt';'abs';'fix';'round';'max';'min';'sum';'prod';'repmat';'reshape';'diag';'blkdiag';'fliplr';'flipud';'flipdim';'trace'};
        % 503 512
        % 504 512
        % 505 512
        % 506 512
        % 507 512
        % 508 512
        % 509 512
        % 510 512
    case 'error'
        % 511 513
        switch b
        case 'reg'
            n = {'zeros';'ones';'eye';'abs';'max';'min'};
        case 'special'
            n = {'sum';'prod';'repmat';'reshape';'diag';'blkdiag';'flipdim';'size';'numel'};
        otherwise
            error('MATLAB:csverify', 'Internal error.');
        end
    otherwise
        % 521 523
        error('MATLAB:csverify', 'Internal error.');
    end
end
