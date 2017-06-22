function decomp = hdlcascadedecompose(in, mode, latency, NumberOfOperators)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    decomp = [];
    % 11 13
    if le(nargin, 2.0)
        latency = -1.0;
        NumberOfOperators = -1.0;
    end
    % 16 19
    % 17 19
    if eq(in, 1.0)
        decomp = [];
    else
        if eq(mode, 0.0) || lt(in, 4.0)
            decomp = validate(in);
        else
            if eq(mode, 1.0)
                if eq(latency, -1.0) && eq(NumberOfOperators, -1.0)
                    [AllSolutions, decomp] = OptimizeLatency4MuxSize(in, mode, 0.0);
                else
                    if eq(latency, 0.0) || eq(NumberOfOperators, 0.0)
                        decomp = [];
                    else
                        if eq(latency, 1.0)
                            if eq(in, 1.0)
                                decomp = validate(in);
                            else
                                decomp = [];
                            end
                        else
                            if eq(NumberOfOperators, 1.0)
                                decomp = validate(in);
                            else
                                if gt(latency, 1.0) && eq(NumberOfOperators, -1.0)
                                    intmp = plus(minus(in, latency), 1.0);
                                    [AllSolutions, Optdecomp] = OptimizeLatency4MuxSize(intmp, mode, 0.0);
                                    if ~(isempty(Optdecomp))
                                        decomp = validate(horzcat(latency, Optdecomp));
                                    end
                                else
                                    if gt(NumberOfOperators, 1.0) && eq(latency, -1.0)
                                        [AllSolutions, Optdecomp] = OptimizeLatency4MuxSize(in, mode, 0.0);
                                        if eq(NumberOfOperators, length(Optdecomp))
                                            decomp = validate(Optdecomp);
                                        else
                                            if gt(NumberOfOperators, length(Optdecomp))
                                                decomp = [];
                                            else
                                                decomp = validate(FindOperatorBasedSolution(in, NumberOfOperators));
                                            end
                                        end
                                    else
                                        if gt(latency, 1.0) && gt(NumberOfOperators, 1.0)
                                            intmp = plus(minus(in, latency), 1.0);
                                            [AllSolutions, Optdecomp] = OptimizeLatency4MuxSize(intmp, mode, 0.0);
                                            if ~(isempty(Optdecomp))
                                                tmp = horzcat(latency, Optdecomp);
                                                if eq(length(tmp), NumberOfOperators)
                                                    decomp = validate(tmp);
                                                end
                                                decomp = [];
                                            end
                                            if isempty(decomp)
                                                tmp = FindOperatorBasedSolution(in, NumberOfOperators);
                                                if eq(tmp(1.0), latency)
                                                    decomp = validate(tmp);
                                                end
                                            end
                                        else
                                            decomp = [];
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                if eq(mode, 2.0)
                    if eq(latency, -1.0) && eq(NumberOfOperators, -1.0)
                        [AllSolutions, decomp] = OptimizeLatency4Operator(in, -1.0);
                    else
                        if eq(latency, 0.0) || eq(NumberOfOperators, 0.0)
                            decomp = [];
                        else
                            if eq(latency, 1.0)
                                if eq(in, 1.0)
                                    decomp = in;
                                else
                                    decomp = [];
                                end
                            else
                                if eq(NumberOfOperators, 1.0)
                                    if eq(latency, in)
                                        decomp = in;
                                    else
                                        decomp = [];
                                    end
                                else
                                    if gt(latency, 1.0) && eq(NumberOfOperators, -1.0)
                                        [AllSolutions, Optdecomp] = OptimizeLatency4Operator(in, latency);
                                        decomp = validate(Optdecomp);
                                    else
                                        if gt(NumberOfOperators, 1.0) && eq(latency, -1.0)
                                            [AllSolutions, Optdecomp] = OptimizeLatency4Operator(in, -1.0);
                                            if eq(NumberOfOperators, length(Optdecomp))
                                                decomp = validate(Optdecomp);
                                            else
                                                if gt(NumberOfOperators, length(Optdecomp))
                                                    decomp = [];
                                                else
                                                    decomp = validate(FindOperatorBasedSolution(in, NumberOfOperators));
                                                end
                                            end
                                        else
                                            if gt(latency, 1.0) && gt(NumberOfOperators, 1.0)
                                                [AllSolutions, Optdecomp] = OptimizeLatency4Operator(in, latency);
                                                for ii=1.0:length(AllSolutions)
                                                    tmp = AllSolutions{1.0, ii};
                                                    if eq(tmp(1.0), latency)
                                                        if eq(length(tmp), NumberOfOperators)
                                                            decomp = validate(tmp);
                                                        end
                                                    end
                                                end % for
                                                if isempty(decomp)
                                                    tmp = FindOperatorBasedSolution(in, NumberOfOperators);
                                                    if eq(tmp(1.0), latency)
                                                        decomp = validate(tmp);
                                                    end
                                                end
                                            else
                                                decomp = [];
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
function exists = IsSolutionExists(in, first_entry)
    sumIn = 0.0;
    correction = 0.0;
    for i=2.0:first_entry
        sumIn = plus(sumIn, i);
        correction = minus(i, 2.0);
    end % for
    if ge(sumIn, plus(in, correction))
        exists = 1.0;
    else
        exists = 0.0;
    end
end
function [allSolutions, OptimalSolution] = OptimizeLatency4MuxSize(in, mode, option)
    OptimalSolution = in;
    allSolutions = {};
    tmp_decomp = [];
    min_decomp = 3.0;
    if eq(in, 1.0)
        OptimalSolution = [];
    else
        if (le(in, min_decomp)) | (eq(mode, 0.0))
            tmp_decomp = horzcat(tmp_decomp, in);
            OptimalSolution = tmp_decomp;
        else
            if eq(option, 0.0)
                first_entry = in;
                while IsSolutionExists(in, first_entry)
                    first_entry = minus(first_entry, 1.0);
                end % while
                first_entry = plus(first_entry, 1.0);
                remainder = plus(minus(in, first_entry), 1.0);
                tmp_decomp = horzcat(tmp_decomp, first_entry);
                [tmp, newSolution] = OptimizeLatency4MuxSize(remainder, 1.0, option);
                tmp_decomp = horzcat(tmp_decomp, newSolution);
                OptimalSolution = tmp_decomp;
            else
                if eq(option, 1.0)
                    first_entry = minus(in, 1.0);
                    remainder = plus(minus(in, first_entry), 1.0);
                    tmp_decomp = horzcat(tmp_decomp, first_entry);
                    while IsSolutionExists(in, first_entry)
                        [tmp, newSolution] = OptimizeLatency4MuxSize(remainder, 1.0, option);
                        tmp_decomp = horzcat(tmp_decomp, newSolution);
                        allSolutions{plus(end, 1.0)} = tmp_decomp;
                        if le(max(tmp_decomp), max(OptimalSolution))
                            OptimalSolution = tmp_decomp;
                            tmp_decomp = [];
                        end
                        first_entry = minus(first_entry, 1.0);
                        remainder = plus(minus(in, first_entry), 1.0);
                        tmp_decomp = horzcat(tmp_decomp, first_entry);
                    end % while
                else
                    msg('Not Valid Option')
                end
            end
        end
    end
end
function [allSolutions, OptimalSolution] = OptimizeLatency4Operator(in, first_entry)
    OptimalSolution = in;
    allSolutions = {};
    if eq(first_entry, -1.0)
        first_entry = in;
        while IsSolutionExists(in, first_entry)
            first_entry = minus(first_entry, 1.0);
        end % while
        first_entry = plus(first_entry, 1.0);
    else
        if ~(IsSolutionExists(in, first_entry))
            first_entry = -1.0;
            OptimalSolution = [];
        end
    end
    if gt(first_entry, 0.0)
        decomp = first_entry;
        sumDecomp = plus(minus(sum(decomp), length(decomp)), 1.0);
        while lt(sumDecomp, in)
            decomp = horzcat(decomp, minus(decomp(end), 1.0));
            sumDecomp = plus(minus(sum(decomp), length(decomp)), 1.0);
        end % while
        if gt(sumDecomp, in)
            decomp(end) = minus(decomp(end), minus(sumDecomp, in));
        end
        OptimalSolution = decomp;
    end
end
function decomp = FindOperatorBasedSolution(in, NumberOfOperators)
    decomp = [];
    NumberOfInputs = minus(plus(in, NumberOfOperators), 1.0);
    tmp = floor(mrdivide(NumberOfInputs, NumberOfOperators));
    first_entry = plus(tmp, NumberOfOperators);
    last_entry = -1.0;
    while le(last_entry, 1.0)
        first_entry = minus(first_entry, 1.0);
        decomp = first_entry;
        for ii=1.0:minus(NumberOfOperators, 2.0)
            decomp = horzcat(decomp, minus(first_entry, ii));
        end % for
        last_entry = minus(NumberOfInputs, sum(decomp));
    end % while
    decomp = horzcat(decomp, last_entry);
end
function out = validate(in)
    out = in;
    for i=1.0:minus(length(in), 1.0)
        if le(in(i), in(plus(i, 1.0)))
            out = [];
        end
    end % for
end
