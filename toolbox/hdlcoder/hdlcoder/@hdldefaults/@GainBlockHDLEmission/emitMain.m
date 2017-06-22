function [status, hdlcode, params] = emitMain(this, hC)
    % 1 5
    % 2 5
    % 3 5
    hdlcode = hdlcodeinit;
    params = [];
    % 6 8
    bfp = hC.SimulinkHandle;
    % 8 10
    blockname = hdllegalnamersvd(get_param(bfp, 'Name'));
    % 10 13
    % 11 13
    inputs = hC.InputPorts;
    in1 = inputs(1.0).getSignal;
    sltype1 = hdlsignalsltype(in1);
    vect1 = hdlsignalvector(in1);
    [size1, bp1, signed1] = hdlwordsize(sltype1);
    % 17 19
    outputs = hC.OutputPorts;
    out = outputs(1.0).getSignal;
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 22 24
    constcomplex = 0.0;
    constvector = 0.0;
    % 25 27
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        rnd = get_param(bfp, 'roundingMode');
        sat = strcmp(get_param(bfp, 'overflowMode'), 'on');
        % 29 31
        if strcmpi(get_param(bfp, 'gainMode'), 'User-defined')
            gainwl = get_param(bfp, 'gainWordLength');
            gainbp = get_param(bfp, 'gainFracLength');
            gainwl = evalin('base', gainwl);
            gainbp = evalin('base', gainbp);
        else
            gainwl = size1;
            gainbp = bp1;
        end % if
        % 39 41
        valstruct = get_param(bfp, 'MaskWSVariables');
        if isempty(valstruct)
            valstruct = get_param(get(get_param(bfp, 'Object'), 'Parent'), 'MaskWSVariables');
        else
            val_loc = strmatch('gainValue', cellhorzcat(valstruct.Name), 'exact');
            % 45 47
            if isempty(val_loc)
                error(hdlcodererrormsgid('internalgainparametererror'), 'Cannot find gainValue');
            else
                % 49 51
                cval = valstruct(val_loc).Value;
            end % if
        end % if
        % 53 55
        gainsigned = outsigned;
        % 55 58
        % 56 58
        [constvtype, constsltype] = hdlgettypesfromsizes(gainwl, gainbp, gainsigned);
    else
        % 59 61
        sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
        rnd = get_param(bfp, 'RndMeth');
        % 62 64
        rto = get_param(bfp, 'RuntimeObject');
        gainloc = 0.0;
        for n=1.0:rto.NumRuntimePrms
            if strcmp(rto.RuntimePrm(n).Name, 'Gain')
                gainloc = n;
            end % if
        end % for
        if eq(gainloc, 0.0)
            error(hdlcodererrormsgid('gainparameternotfound'), 'hdlgainblock was unable to get the Gain parameter value.');
            % 72 74
        end % if
        % 74 76
        cval = rto.RuntimePrm(gainloc).Data;
        if isempty(cval)
            error(hdlcodererrormsgid('gainparameterempty'), 'hdlgainblock was unable to get the Gain parameter value.');
            % 78 80
        end % if
        cval = double(cval);
        constsltype = rto.RuntimePrm(gainloc).Datatype;
        constvector = rto.RuntimePrm(gainloc).Dimensions;
        if all(eq(constvector, [1.0 1.0]))
            constvector = 0.0;
        end % if
        constcomplex = rto.RuntimePrm(gainloc).Complexity;
        if strcmpi(constcomplex, 'real')
            constcomplex = 0.0;
        else
            constcomplex = 1.0;
        end % if
        [gainwl, gainbp, gainsigned] = hdlwordsize(constsltype);
    end % if
    % 94 96
    if any(ne(constvector, 0.0)) || any(ne(vect1, 0.0))
        error(hdlcodererrormsgid('vectornotsupported'), 'Vector gain blocks are not supported in this release.')
        % 97 100
        % 98 100
        constvtype = hdlvectorblockdatatype(constcomplex, constvector, hdlblockdatatype(constsltype), constsltype);
    else
        % 101 104
        % 102 104
        % 103 105
        constvtype = hdlblockdatatype(constsltype);
    end % if
    % 106 108
    [constname, constloc] = hdlnewsignal(horzcat(blockname, '_gainparam'), 'block', -1.0, constcomplex, constvector, constvtype, constsltype);
    % 108 110
    hdlcval = hdlconstantvalue(cval, gainwl, gainbp, gainsigned);
    hdlcode.arch_constants = horzcat(hdlcode.arch_constants, makehdlconstantdecl(constloc, hdlcval));
    % 111 113
    gaintype = hdlgetparameter('gain_multipliers');
    % 113 115
    status = true;
    % 115 117
    if eq(cval, 1.0)
        tmpbody = horzcat(hdlcode.arch_body_blocks, hdldatatypeassignment(in1, out, rnd, sat));
        % 118 121
        % 119 121
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
    else
        if eq(cval, -1.0)
            [tmpbody, tmpsignals] = hdlunaryminus(in1, out, rnd, sat);
            % 124 127
            % 125 127
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
            hdlcode.arch_signals = horzcat(hdlcode.arch_signals, tmpsignals);
        else
            if ne(outsize, 0.0) && hdlispowerof2(cval)
                [tmpbody, tmpsignals] = hdlmultiplypowerof2(in1, cval, out, rnd, sat);
                % 131 134
                % 132 134
                hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
                hdlcode.arch_signals = horzcat(hdlcode.arch_signals, tmpsignals);
            else
                % 136 138
                status = false;
                % 138 141
                % 139 141
                params.Input = in1;
                params.Output = out;
                params.Outsize = outsize;
                params.Const = constloc;
                params.ConstVal = cval;
                params.Rounding = rnd;
                params.Overflow = sat;
                % 147 149
            end % if
            % 149 151
        end % if
    end % if
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
