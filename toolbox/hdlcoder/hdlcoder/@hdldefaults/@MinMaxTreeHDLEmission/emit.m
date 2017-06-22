function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlcode = hdlcodeinit;
    % 7 9
    bfp = hC.SimulinkHandle;
    % 9 11
    if strcmp(this.block, 'built-in/MinMax')
        modestring = get_param(bfp, 'Function');
        fcn_string = 'Value';
        rnd = get_param(bfp, 'RndMeth');
        sat = strcmpi(get_param(bfp, 'DoSatur'), 'on');
    else
        if strcmp(this.Blocks, 'dspstat3/Minimum')
            modestring = 'min';
            fcn_string = get_param(bfp, 'fcn');
            rnd = 'Floor';
            sat = false;
        else
            if strcmp(this.Blocks, 'dspstat3/Maximum')
                modestring = 'max';
                fcn_string = get_param(bfp, 'fcn');
                rnd = 'Floor';
                sat = false;
            else
                modestring = 'unknown';
                fcn_string = 'unknown';
                rnd = 'Floor';
                sat = false;
            end
        end
    end
    name = hdllegalname(get_param(bfp, 'Name'));
    if any(strcmpi(modestring, {'min','max'}))
        ninputs = length(hC.InputPorts);
        if eq(ninputs, 1.0)
            in = hC.InputPorts(1.0).getSignal;
        else
            in = [];
            basesltype = hdlsignalsltype(hC.InputPorts(1.0).getSignal);
            for ii=1.0:ninputs
                sig = hC.InputPorts(ii).getSignal;
                if gt(max(hdlsignalvector(sig)), 1.0)
                    error(hdlcodererrormsgid('MultipleNonScalarInputs'), 'The min/max block does not support multiple vector inputs.');
                else
                    if not(strcmpi(hdlsignalsltype(sig), basesltype))
                        error(hdlcodererrormsgid('MultipleInputDatatypes'), 'The min/max block does not support different input datatypes.');
                    else
                        % 51 53
                        in = horzcat(in, sig);
                    end
                end
            end % for
        end
        out = hC.OutputPorts(1.0).getSignal;
        idx = 0.0;
        if strcmpi(fcn_string, 'Value and Index')
            idx = hC.OutputPorts(2.0).getSignal;
            [body, signals, consts] = local_minmax(in, out, idx, modestring, name, rnd, sat);
        else
            if strcmpi(fcn_string, 'Index')
                idx = out;
                out = 0.0;
                [body, signals, consts] = local_minmax(in, out, idx, modestring, name, rnd, sat);
            else
                if strcmpi(fcn_string, 'Value')
                    [body, signals, consts] = local_minmax(in, out, idx, modestring, name, rnd, sat);
                else
                    if strcmpi(fcn_string, 'Running')
                        error(hdlcodererrormsgid('unsupportblock'), 'This block function mode (%s) for hdlminmaxblock is not supported', fcn_string);
                    else
                        error(hdlcodererrormsgid('unsupportblock'), 'This block function mode (%s) for hdlminmaxblock is not supported', fcn_string);
                        % 75 77
                    end
                end
            end
        end
    else
        error(hdlcodererrormsgid('unsupportblock'), 'This block mode (%s) for hdlminmaxblock is not supported', modestring);
    end
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_constants = consts;
    hdlcode.arch_signals = signals;
    % 86 88
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end
function [body, signals, consts] = local_minmax(in, out, idx, modestring, name, rnd, sat)
    % 90 94
    % 91 94
    % 92 94
    bdt = hdlgetparameter('base_data_type');
    % 94 96
    body = '';
    signals = '';
    consts = '';
    % 98 100
    if strcmpi(modestring, 'min')
        compareop = '<=';
    else
        if strcmpi(modestring, 'max')
            compareop = '>=';
        end
    end
    if eq(length(in), 1.0)
        invect = hdlexpandvectorsignal(in);
    else
        invect = in;
    end
    cmpx = hdlsignalcomplex(in(1.0));
    sltype = hdlsignalsltype(in(1.0));
    vtype = hdlblockdatatype(sltype);
    nrounds = ceil(log2(length(invect)));
    % 115 118
    % 116 118
    if ne(idx, 0.0)
        idxsltype = hdlsignalsltype(idx);
        idxvtype = hdlsignalvtype(idx);
        % 120 129
        % 121 129
        % 122 129
        % 123 129
        % 124 129
        % 125 129
        % 126 129
        % 127 129
        idxsizes = hdlsignalsizes(idx);
        % 129 131
        for cloop=1.0:length(invect)
            [idxname, idxvect(cloop)] = hdlnewsignal(horzcat(name, 'idxconst', num2str(cloop)), 'block', -1.0, 0.0, 0.0, idxvtype, idxsltype);
            % 132 134
            consts = horzcat(consts, makehdlconstantdecl(idxvect(cloop), hdlconstantvalue(cloop, idxsizes(1.0), 0.0, idxsizes(3.0))));
            % 134 136
        end % for
    end
    % 137 139
    for n=1.0:nrounds
        newcompsize = horzcat(floor(mrdivide(length(invect), 2.0)), 0.0);
        % 140 142
        if eq(newcompsize(1.0), 1.0)
            [notused, cidx] = hdlnewsignal(horzcat(name, '_comparernd', num2str(n)), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
            % 143 146
            % 144 146
            signals = horzcat(signals, makehdlsignaldecl(cidx));
            comparitors = cidx;
        else
            comp_vtype = hdlvectorblockdatatype(false, newcompsize, bdt, 'boolean');
            % 149 151
            [notused, cidx] = hdlnewsignal(horzcat(name, '_comparernd', num2str(n)), 'block', -1.0, 0.0, newcompsize, comp_vtype, 'boolean');
            % 151 154
            % 152 154
            signals = horzcat(signals, makehdlsignaldecl(cidx));
            comparitors = hdlexpandvectorsignal(cidx);
        end
        % 156 158
        newinvectsize = horzcat(round(mrdivide(length(invect), 2.0)), 0.0);
        % 158 160
        if eq(newinvectsize(1.0), 1.0)
            [notused, vidx] = hdlnewsignal(horzcat(name, '_muxrnd', num2str(n)), 'block', -1.0, 0.0, 0.0, vtype, sltype);
            % 161 164
            % 162 164
            signals = horzcat(signals, makehdlsignaldecl(vidx));
            newinvect = vidx;
        else
            vect_vtype = hdlvectorblockdatatype(cmpx, newinvectsize, vtype, sltype);
            % 167 169
            [notused, vidx] = hdlnewsignal(horzcat(name, '_muxrnd', num2str(n)), 'block', -1.0, 0.0, newinvectsize, vect_vtype, sltype);
            % 169 172
            % 170 172
            signals = horzcat(signals, makehdlsignaldecl(vidx));
            newinvect = hdlexpandvectorsignal(vidx);
        end
        % 174 176
        if ne(idx, 0.0)
            if eq(newinvectsize(1.0), 1.0)
                [notused, vidxidx] = hdlnewsignal(horzcat(name, '_muxidxrnd', num2str(n)), 'block', -1.0, 0.0, 0.0, idxvtype, idxsltype);
                % 178 181
                % 179 181
                signals = horzcat(signals, makehdlsignaldecl(vidxidx));
                newidxvect = vidxidx;
            else
                idxvect_vtype = hdlvectorblockdatatype(cmpx, newinvectsize, idxvtype, idxsltype);
                % 184 186
                [notused, vidxidx] = hdlnewsignal(horzcat(name, '_muxidxrnd', num2str(n)), 'block', -1.0, 0.0, newinvectsize, idxvect_vtype, idxsltype);
                % 186 189
                % 187 189
                signals = horzcat(signals, makehdlsignaldecl(vidxidx));
                newidxvect = hdlexpandvectorsignal(vidxidx);
            end
        end
        % 192 194
        for inner=1.0:length(comparitors)
            body = horzcat(body, hdlrelop(invect(minus(mtimes(inner, 2.0), 1.0)), invect(mtimes(inner, 2.0)), comparitors(inner), compareop));
            body = horzcat(body, hdlmux(horzcat(invect(minus(mtimes(inner, 2.0), 1.0)), invect(mtimes(inner, 2.0))), newinvect(inner), comparitors(inner), {'='}, 1.0, 'when-else'));
            % 196 199
            % 197 199
            if ne(idx, 0.0)
                body = horzcat(body, hdlmux(horzcat(idxvect(minus(mtimes(inner, 2.0), 1.0)), idxvect(mtimes(inner, 2.0))), newidxvect(inner), comparitors(inner), {'='}, 1.0, 'when-else'));
                % 200 202
            end
        end % for
        if ne(length(newinvect), length(comparitors))
            body = horzcat(body, hdlsignalassignment(invect(end), newinvect(end)));
            if ne(idx, 0.0)
                body = horzcat(body, hdlsignalassignment(idxvect(end), newidxvect(end)));
            end
        end
        invect = newinvect;
        if ne(idx, 0.0)
            idxvect = newidxvect;
        end
    end % for
    % 214 216
    body = horzcat(body, hdldatatypeassignment(invect(end), out, rnd, sat));
    if ne(idx, 0.0)
        body = horzcat(body, hdlsignalassignment(idxvect(end), idx));
    end
end
