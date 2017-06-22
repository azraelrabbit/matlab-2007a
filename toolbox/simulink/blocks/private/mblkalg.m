function vararg = mblkalg(opt, src, param)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    [flag, code, data, info] = algexp2pc(src);
    if isempty(flag)
        if eq(length(param), info(3.0))
            CR = char(10.0);
            ind = find(eq(src, ';'));
            src(ind) = CR;
            if eq(src(end), CR)
                src(end) = [];
            end % if
            pc = 1.0;
            tos = 0.0;
            stack = zeros(info(4.0), 1.0);
            csize = size(code, 1.0);
            switch opt
            case 'constant'
                cnst = zeros(info(2.0), 1.0);
                    while lt(pc, csize)
                    switch code(pc)
                    case 4.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = data(code(pc));
                    case 5.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = param(code(pc));
                    case 9.0
                        pc = plus(pc, 1.0);
                        param(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                    case 11.0
                        pc = plus(pc, 1.0);
                        cnst(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                    case 13.0
                        stack(tos) = uminus(stack(tos));
                    case 14.0
                        tos = minus(tos, 1.0);
                        stack(tos) = plus(stack(tos), stack(plus(tos, 1.0)));
                    case 15.0
                        tos = minus(tos, 1.0);
                        stack(tos) = minus(stack(tos), stack(plus(tos, 1.0)));
                    case 16.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mtimes(stack(tos), stack(plus(tos, 1.0)));
                    case 17.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mrdivide(stack(tos), stack(plus(tos, 1.0)));
                    case {[18.0],[19.0]}
                        tos = minus(tos, 1.0);
                        stack(tos) = power(stack(tos), stack(plus(tos, 1.0)));
                    otherwise
                        error('General algebraic expression not supported.');
                    end % switch
                    pc = plus(pc, 1.0);
                end % while
                vararg = cellhorzcat(src, cnst);
            case 'scale'
                gain = zeros(info(2.0), 1.0);
                ni = info(1.0);
                map = ones(size(gain));
                ind = 0.0;
                chn = 0.0;
                    while lt(pc, csize)
                    switch code(pc)
                    case 2.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = 1.0;
                        ind = code(pc);
                    case 4.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = data(code(pc));
                    case 5.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = param(code(pc));
                    case 9.0
                        pc = plus(pc, 1.0);
                        param(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                    case 11.0
                        pc = plus(pc, 1.0);
                        chn = code(pc);
                        gain(chn) = stack(tos);
                        map(chn) = ind;
                        tos = minus(tos, 1.0);
                    case 13.0
                        stack(tos) = uminus(stack(tos));
                    case 14.0
                        tos = minus(tos, 1.0);
                        stack(tos) = plus(stack(tos), stack(plus(tos, 1.0)));
                    case 15.0
                        tos = minus(tos, 1.0);
                        stack(tos) = minus(stack(tos), stack(plus(tos, 1.0)));
                    case 16.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mtimes(stack(tos), stack(plus(tos, 1.0)));
                    case 17.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mrdivide(stack(tos), stack(plus(tos, 1.0)));
                    case {[18.0],[19.0]}
                        tos = minus(tos, 1.0);
                        stack(tos) = power(stack(tos), stack(plus(tos, 1.0)));
                    otherwise
                        error('General algebraic expression not supported.');
                    end % switch
                    pc = plus(pc, 1.0);
                end % while
                vararg = cellhorzcat(src, gain, map, ni);
            case 'product'
                sgn = zeros(info(2.0), 1.0);
                ni = info(1.0);
                map = ones(size(sgn, 1.0), 2.0);
                sacc = 1.0;
                oper = '';
                chn = 0.0;
                calc = 0.0;
                    while lt(pc, csize)
                    switch code(pc)
                    case 2.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = code(pc);
                        calc = 0.0;
                    case 4.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = data(code(pc));
                        calc = 1.0;
                    case 5.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = param(code(pc));
                        calc = 1.0;
                    case 9.0
                        pc = plus(pc, 1.0);
                        param(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                    case 11.0
                        pc = plus(pc, 1.0);
                        chn = code(pc);
                        sgn(chn) = sacc;
                        sacc = 1.0;
                        map(chn, :) = ctranspose(stack(tos:plus(tos, 1.0)));
                        tos = minus(tos, 1.0);
                    case 13.0
                        if calc
                            stack(tos) = uminus(stack(tos));
                        else
                            sacc = uminus(sacc);
                        end % if
                    case 14.0
                        tos = minus(tos, 1.0);
                        stack(tos) = plus(stack(tos), stack(plus(tos, 1.0)));
                    case 15.0
                        tos = minus(tos, 1.0);
                        stack(tos) = minus(stack(tos), stack(plus(tos, 1.0)));
                    case 16.0
                        tos = minus(tos, 1.0);
                        if calc
                            stack(tos) = mtimes(stack(tos), stack(plus(tos, 1.0)));
                        else
                            if isempty(oper)
                                oper = '**';
                            end % if
                        end % if
                    case 17.0
                        tos = minus(tos, 1.0);
                        if calc
                            stack(tos) = mrdivide(stack(tos), stack(plus(tos, 1.0)));
                        else
                            if isempty(oper)
                                oper = '*/';
                            end % if
                        end % if
                    case {[18.0],[19.0]}
                        tos = minus(tos, 1.0);
                        stack(tos) = power(stack(tos), stack(plus(tos, 1.0)));
                    otherwise
                        error('General algebraic expression not supported.');
                    end % switch
                    pc = plus(pc, 1.0);
                end % while
                vararg = cellhorzcat(src, sgn, map, ni, oper);
            case 'reciprocal'
                cnst = zeros(info(2.0), 1.0);
                ni = info(1.0);
                map = ones(size(cnst));
                ind = 0.0;
                chn = 0.0;
                    while lt(pc, csize)
                    switch code(pc)
                    case 2.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = 1.0;
                        ind = code(pc);
                    case 4.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = data(code(pc));
                    case 5.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = param(code(pc));
                    case 9.0
                        pc = plus(pc, 1.0);
                        param(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                    case 11.0
                        pc = plus(pc, 1.0);
                        chn = code(pc);
                        cnst(chn) = stack(tos);
                        map(chn) = ind;
                        tos = minus(tos, 1.0);
                    case 13.0
                        stack(tos) = uminus(stack(tos));
                    case 14.0
                        tos = minus(tos, 1.0);
                        stack(tos) = plus(stack(tos), stack(plus(tos, 1.0)));
                    case 15.0
                        tos = minus(tos, 1.0);
                        stack(tos) = minus(stack(tos), stack(plus(tos, 1.0)));
                    case 16.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mtimes(stack(tos), stack(plus(tos, 1.0)));
                    case 17.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mrdivide(stack(tos), stack(plus(tos, 1.0)));
                    case {[18.0],[19.0]}
                        tos = minus(tos, 1.0);
                        stack(tos) = power(stack(tos), stack(plus(tos, 1.0)));
                    otherwise
                        error('General algebraic expression not supported.');
                    end % switch
                    pc = plus(pc, 1.0);
                end % while
                vararg = cellhorzcat(src, cnst, map, ni);
            case 'offset'
                cnst = zeros(info(2.0), 1.0);
                ni = info(1.0);
                map = ones(size(cnst));
                sgn = ones(size(cnst));
                sacc = 1.0;
                ind = 0.0;
                chn = 0.0;
                lop = 0.0;
                    while lt(pc, csize)
                    switch code(pc)
                    case 2.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = 0.0;
                        lop = 2.0;
                        ind = code(pc);
                    case 4.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        lop = 1.0;
                        stack(tos) = data(code(pc));
                    case 5.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        lop = 1.0;
                        stack(tos) = param(code(pc));
                    case 9.0
                        pc = plus(pc, 1.0);
                        param(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                        sacc = 1.0;
                    case 11.0
                        pc = plus(pc, 1.0);
                        chn = code(pc);
                        cnst(chn) = stack(tos);
                        map(chn) = ind;
                        sgn(chn) = sacc;
                        sacc = 1.0;
                        tos = minus(tos, 1.0);
                    case 13.0
                        switch lop
                        case 1.0
                            stack(tos) = uminus(stack(tos));
                        case 2.0
                            sacc = uminus(sacc);
                        case 3.0
                            stack(tos) = uminus(stack(tos));
                            sacc = uminus(sacc);
                        otherwise
                        end % switch
                    case 14.0
                        tos = minus(tos, 1.0);
                        lop = 3.0;
                        stack(tos) = plus(stack(tos), stack(plus(tos, 1.0)));
                    case 15.0
                        tos = minus(tos, 1.0);
                        if eq(lop, 2.0)
                            sacc = uminus(sacc);
                        end % if
                        lop = 3.0;
                        stack(tos) = minus(stack(tos), stack(plus(tos, 1.0)));
                    case 16.0
                        tos = minus(tos, 1.0);
                        lop = 3.0;
                        stack(tos) = mtimes(stack(tos), stack(plus(tos, 1.0)));
                    case 17.0
                        tos = minus(tos, 1.0);
                        lop = 3.0;
                        stack(tos) = mrdivide(stack(tos), stack(plus(tos, 1.0)));
                    case {[18.0],[19.0]}
                        tos = minus(tos, 1.0);
                        lop = 3.0;
                        stack(tos) = power(stack(tos), stack(plus(tos, 1.0)));
                    otherwise
                        error('General algebraic expression not supported.');
                    end % switch
                    pc = plus(pc, 1.0);
                end % while
                vararg = cellhorzcat(src, cnst, map, ni, sgn);
            case 'summation'
                sgn = zeros(info(2.0), 2.0);
                ni = info(1.0);
                map = ones(size(sgn));
                chn = 0.0;
                calc = 0.0;
                lop = 0.0;
                    while lt(pc, csize)
                    switch code(pc)
                    case 2.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = code(pc);
                        calc = 0.0;
                        lop = 2.0;
                    case 4.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = data(code(pc));
                        lop = 1.0;
                        calc = 1.0;
                    case 5.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = param(code(pc));
                        lop = 1.0;
                        calc = 1.0;
                    case 9.0
                        pc = plus(pc, 1.0);
                        param(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                    case 11.0
                        pc = plus(pc, 1.0);
                        chn = code(pc);
                        stk = ctranspose(stack(tos:plus(tos, 1.0)));
                        sgn(chn, :) = sign(stk);
                        map(chn, :) = abs(stk);
                        tos = minus(tos, 1.0);
                    case 13.0
                        if eq(lop, 3.0)
                            stack(tos:plus(tos, 1.0)) = uminus(stack(tos:plus(tos, 1.0)));
                        else
                            stack(tos) = uminus(stack(tos));
                        end % if
                    case 14.0
                        tos = minus(tos, 1.0);
                        if calc
                            stack(tos) = plus(stack(tos), stack(plus(tos, 1.0)));
                        else
                            lop = 3.0;
                        end % if
                    case 15.0
                        tos = minus(tos, 1.0);
                        if calc
                            stack(tos) = minus(stack(tos), stack(plus(tos, 1.0)));
                        else
                            stack(plus(tos, 1.0)) = uminus(stack(plus(tos, 1.0)));
                            lop = 3.0;
                        end % if
                    case 16.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mtimes(stack(tos), stack(plus(tos, 1.0)));
                    case 17.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mrdivide(stack(tos), stack(plus(tos, 1.0)));
                    case {[18.0],[19.0]}
                        tos = minus(tos, 1.0);
                        stack(tos) = power(stack(tos), stack(plus(tos, 1.0)));
                    otherwise
                        error('General algebraic expression not supported.');
                    end % switch
                    pc = plus(pc, 1.0);
                end % while
                vararg = cellhorzcat(src, map, ni, sgn);
            case 'powercu'
                cnst = zeros(info(2.0), 1.0);
                ni = info(1.0);
                map = ones(size(cnst));
                sgn = zeros(size(cnst));
                sacc = 1.0;
                calc = 0.0;
                ind = 0.0;
                chn = 0.0;
                lop = 0.0;
                    while lt(pc, csize)
                    switch code(pc)
                    case 2.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = 1.0;
                        ind = code(pc);
                        calc = 0.0;
                        lop = 2.0;
                    case 4.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = data(code(pc));
                        calc = 1.0;
                        lop = 1.0;
                    case 5.0
                        tos = plus(tos, 1.0);
                        pc = plus(pc, 1.0);
                        stack(tos) = param(code(pc));
                        lop = 1.0;
                        calc = 1.0;
                    case 9.0
                        pc = plus(pc, 1.0);
                        param(code(pc)) = stack(tos);
                        tos = minus(tos, 1.0);
                        sacc = 1.0;
                    case 11.0
                        pc = plus(pc, 1.0);
                        chn = code(pc);
                        cnst(chn) = stack(tos);
                        map(chn) = ind;
                        sgn(chn) = sacc;
                        sacc = 1.0;
                        tos = minus(tos, 1.0);
                    case 13.0
                        if eq(lop, 3.0)
                            sacc = uminus(sacc);
                        else
                            stack(tos) = uminus(stack(tos));
                        end % if
                    case 14.0
                        tos = minus(tos, 1.0);
                        stack(tos) = plus(stack(tos), stack(plus(tos, 1.0)));
                    case 15.0
                        tos = minus(tos, 1.0);
                        stack(tos) = minus(stack(tos), stack(plus(tos, 1.0)));
                    case 16.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mtimes(stack(tos), stack(plus(tos, 1.0)));
                    case 17.0
                        tos = minus(tos, 1.0);
                        stack(tos) = mrdivide(stack(tos), stack(plus(tos, 1.0)));
                    case {[18.0],[19.0]}
                        tos = minus(tos, 1.0);
                        stack(tos) = power(stack(tos), stack(plus(tos, 1.0)));
                        if not(calc)
                            lop = 3.0;
                        end % if
                    otherwise
                        error('General algebraic expression not supported.');
                    end % switch
                    pc = plus(pc, 1.0);
                end % while
                vararg = cellhorzcat(src, cnst, map, ni, sgn);
            otherwise
                stat = pdecode(code, data, info(4.0));
                vararg = cellhorzcat(src, stat, code, data, info);
            end % switch
        else
            error('Parameter dimension not specified correctly.');
        end % if
    else
        error(flag);
    end % if
    return;
function src = pdecode(code, data, stksize)
    % 489 495
    % 490 495
    % 491 495
    % 492 495
    % 493 495
    nCode = size(code, 1.0);
    pc = 1.0;
    stack = cell(stksize, 1.0);
    stype = zeros(stksize, 1.0);
    tos = 0.0;
    src = '[';
    opsym = cell(19.0, 1.0);
    opsym(13.0:17.0) = {'-';' + ';' - ';' * ';' / '};
    % 502 504
        while lt(pc, nCode)
        opCode = code(pc);
        pc = plus(pc, 1.0);
        switch opCode
        case 1.0
            tos = plus(tos, 1.0);
            stack{tos} = '@t';
            stype(tos) = 0.0;
        case 2.0
            tos = plus(tos, 1.0);
            stack{tos} = sprintf('@u%d', code(pc));
            stype(tos) = 0.0;
            pc = plus(pc, 1.0);
        case 4.0
            tos = plus(tos, 1.0);
            stack{tos} = sprintf('%g', data(code(pc)));
            stype(tos) = 0.0;
            pc = plus(pc, 1.0);
        case 5.0
            tos = plus(tos, 1.0);
            stack{tos} = sprintf('@p%d', code(pc));
            stype(tos) = 0.0;
            pc = plus(pc, 1.0);
        case 7.0
            tos = plus(tos, 1.0);
            stack{tos} = sprintf('@y%d', code(pc));
            stype(tos) = 0.0;
            pc = plus(pc, 1.0);
        case 9.0
            src = sprintf('%s"@p%d = %s;",', src, code(pc), stack{tos});
            pc = plus(pc, 1.0);
            tos = minus(tos, 1.0);
        case 11.0
            src = sprintf('%s"@y%d = %s;",', src, code(pc), stack{tos});
            pc = plus(pc, 1.0);
            tos = minus(tos, 1.0);
        case 13.0
            if lt(stype(tos), 3.0)
                fmt = '%s%s';
            else
                fmt = '%s(%s)';
            end % if
            stack{tos} = sprintf(fmt, opsym{opCode}, stack{tos});
            stype(tos) = 3.0;
        case {[14.0],[15.0]}
            tos = minus(tos, 1.0);
            if lt(stype(plus(tos, 1.0)), 3.0)
                fmt = '%s%s%s';
            else
                fmt = '%s%s(%s)';
            end % if
            stack{tos} = sprintf(fmt, stack{tos}, opsym{opCode}, stack{plus(tos, 1.0)});
            stype(tos) = 3.0;
        case {[16.0],[17.0]}
            tos = minus(tos, 1.0);
            if le(stype(tos), 2.0)
                if lt(stype(plus(tos, 1.0)), 2.0)
                    fmt = '%s%s%s';
                else
                    fmt = '%s%s(%s)';
                end % if
            else
                if lt(stype(plus(tos, 1.0)), 2.0)
                    fmt = '(%s)%s%s';
                else
                    fmt = '(%s)%s(%s)';
                end % if
            end % if
            stack{tos} = sprintf(fmt, stack{tos}, opsym{opCode}, stack{plus(tos, 1.0)});
            stype(tos) = 2.0;
        case 18.0
            tos = minus(tos, 1.0);
            stack{tos} = sprintf('pow(%s^ %s)', stack{tos}, stack{plus(tos, 1.0)});
        case 19.0
            tos = minus(tos, 1.0);
            stack{tos} = sprintf('powdi(%s^ %s)', stack{tos}, stack{plus(tos, 1.0)});
            stype(tos) = 1.0;
        otherwise
        end % switch
    end % while
    src(end) = ']';
    return;
