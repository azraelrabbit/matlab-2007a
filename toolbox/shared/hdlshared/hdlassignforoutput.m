function [assign_prefix, assign_op] = hdlassignforoutput(out)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 9 11
    seq = hdlsequentialcontext;
    % 11 13
    if hdlgetparameter('isverilog')
        if eq(outsize, 0.0)
            if seq
                assign_prefix = '';
            else
                assign_prefix = 'always @* ';
            end
            assign_op = '<=';
        else
            if strcmpi(outvtype(1.0:3.0), 'reg') || seq
                assign_prefix = '';
                assign_op = '<=';
            else
                assign_prefix = hdlgetparameter('assign_prefix');
                assign_op = hdlgetparameter('assign_op');
            end
        end
    else
        assign_prefix = hdlgetparameter('assign_prefix');
        assign_op = hdlgetparameter('assign_op');
    end
end
