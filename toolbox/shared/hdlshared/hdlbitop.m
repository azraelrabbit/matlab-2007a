function hdlbody = hdlbitop(ins, out, op)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    outname = hdlsignalname(out);
    outvec = hdlsignalvector(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 12 14
    numInputs = length(ins);
    for k=1.0:numInputs
        name{k} = hdlsignalname(ins(k));
        vec{k} = hdlsignalvector(ins(k));
        vtype{k} = hdlsignalvtype(ins(k));
        sltype{k} = hdlsignalsltype(ins(k));
        isinport{k} = hdlisinportsignal(ins(k));
    end % for
    % 21 23
    if all(eq(outvec, 0.0))
        % 23 25
        for k=1.0:length(name)
            [insize, bp, signed] = hdlwordsize(sltype{k});
            [inname{k}, insize] = hdlsignaltypeconvert(name{k}, insize, signed, vtype{k}, outsigned);
        end % for
        hdlbody = horzcat(scalarbody(inname, out, op), '\n');
    else
        if not(hdlgetparameter('loop_unrolling'))
            % 31 33
            [name, vecsize] = scalarexpand(name, vec, 'k');
            for k=1.0:length(name)
                [insize, bp, signed] = hdlwordsize(sltype{k});
                [inname{k}, insize] = hdlsignaltypeconvert(name{k}, insize, signed, vtype{k}, outsigned);
            end % for
            % 37 39
            genname = horzcat(outname, hdlgetparameter('block_generate_label'));
            hdlbody = horzcat(spaces(2.0), genname, ' : ', 'FOR k IN 0 TO ', num2str(minus(vecsize, 1.0)), ' GENERATE\n');
            hdlbody = horzcat(hdlbody, spaces(2.0), scalarbody(inname, out, op, 'k'));
            hdlbody = horzcat(hdlbody, spaces(2.0), 'END GENERATE;\n\n');
        else
            hdlbody = '';
            vecsize = max(outvec);
            % 45 47
            for k=1.0:numInputs
                if all(eq(vec{k}, 0.0))
                    tmp = [];
                    for ii=1.0:vecsize
                        vectorsignals(k, ii) = ins(k);
                    end % for
                else
                    % 53 55
                    tmp = hdlexpandvectorsignal(ins(k));
                    for ii=1.0:length(tmp)
                        vectorsignals(k, ii) = tmp(ii);
                    end % for
                end % if
            end % for
            outvector = hdlexpandvectorsignal(out);
            % 61 63
            for v=1.0:size(vectorsignals, 2.0)
                inname = {};
                for k=1.0:size(vectorsignals, 1.0)
                    sig = vectorsignals(k, v);
                    [insize, bp, signed] = hdlwordsize(hdlsignalsltype(sig));
                    [inname{k}, insize] = hdlsignaltypeconvert(hdlsignalname(sig), insize, signed, hdlsignalvtype(sig), outsigned);
                    % 68 72
                    % 69 72
                    % 70 72
                end % for
                hdlbody = horzcat(hdlbody, scalarbody(inname, outvector(v), op));
            end % for
        end % if
    end % if
function [name, vecsize] = scalarexpand(name, vec, idx)
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    array_deref = hdlgetparameter('array_deref');
    numInputPorts = length(name);
    vecsize = 1.0;
    for k=1.0:numInputPorts
        if ne(length(vec{k}), 1.0)
            name{k} = horzcat(name{k}, array_deref(1.0), idx, array_deref(2.0));
            vecsize = max(vecsize, max(vec{k}));
        end % if
    end % for
function hdlbody = scalarbody(name, out, op, outidx)
    % 91 95
    % 92 95
    % 93 95
    outname = hdlsignalname(out);
    % 95 97
    if eq(nargin, 3.0)
        outidx = '';
    else
        array_deref = hdlgetparameter('array_deref');
        outname = horzcat(outname, array_deref(1.0), outidx, array_deref(2.0));
    end % if
    % 102 104
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    % 104 106
    hdlbody = horzcat(spaces(2.0), assign_prefix, outname, ' ', assign_op, ' ');
    % 106 108
    if hdlgetparameter('isverilog')
        hdlneg = '~';
        switch lower(op)
        case 'not'
            hdlop = '~';
        case 'and'
            hdlop = '&';
        case 'or'
            hdlop = '|';
        case 'nand'
            hdlop = '&';
        case 'nor'
            hdlop = '|';
        case 'xor'
            hdlop = '^';
        end % switch
    else
        if strcmpi(op, 'NAND')
            hdlop = 'AND';
        else
            if strcmpi(op, 'NOR')
                hdlop = 'OR';
            else
                hdlop = op;
            end % if
        end % if
        hdlneg = 'NOT';
    end % if
    if strcmp(op, 'NOT')
        hdlbody = horzcat(hdlbody, ' ', hdlneg, '(', name{1.0}, ');\n');
    else
        if strcmp(op, 'AND') || strcmp(op, 'OR') || strcmp(op, 'XOR')
            numInputs = length(name);
            for k=1.0:minus(numInputs, 1.0)
                hdlbody = horzcat(hdlbody, spaces(1.0), name{k}, spaces(1.0), hdlop);
            end % for
            hdlbody = horzcat(hdlbody, spaces(1.0), name{numInputs}, ';\n');
        else
            if strcmp(op, 'NAND')
                op = 'AND';
            else
                if strcmp(op, 'NOR')
                    op = 'OR';
                else
                    error(hdlcodererrormsgid('notsupported'), 'The selected logical operator is not supported.');
                end % if
            end % if
            hdlbody = horzcat(hdlbody, ' ', hdlneg, '(');
            numInputs = length(name);
            for k=1.0:minus(numInputs, 1.0)
                hdlbody = horzcat(hdlbody, spaces(1.0), name{k}, spaces(1.0), hdlop);
            end % for
            hdlbody = horzcat(hdlbody, spaces(1.0), name{numInputs}, ' );\n');
        end % if
    end % if
function space = spaces(indent)
    space = mtimes(fix(' '), ones(1.0, indent));
