function [hdlbody, hdlsignals] = hdldeserializer(input, output, loaden, shiftmode, start, outvld, initValue, processName)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    output_sltype = hdlsignalsltype(output);
    [output_size, outbp, outsigned] = hdlwordsize(output_sltype);
    input_sltype = hdlsignalsltype(input);
    [input_size, inbp, insigned] = hdlwordsize(input_sltype);
    if (gt(input_size, 1.0)) | (lt(output_size, 1.0))
        error('The input for a deserilaizer should have more than 1 bit, and the output should be one bit.');
    end
    % 22 24
    if lt(nargin, 4.0)
        error('The first four argument should be specified to be able to generate deserializer')
    else
        if eq(nargin, 4.0)
            start = [];
            outvld = [];
            initValue = 0.0;
            processName = 'DESERIALIZER';
        else
            if eq(nargin, 5.0)
                outvld = [];
                initValue = 0.0;
                processName = 'DESERIALIZER';
            else
                if eq(nargin, 6.0)
                    initValue = 0.0;
                    processName = 'DESERIALIZER';
                else
                    if eq(nargin, 7.0)
                        processName = 'DESERIALIZER';
                    else
                        if gt(nargin, 8.0)
                            error('Too many arguments are specified')
                        end
                    end
                end
            end
        end
    end
    [hdlbody, hdlsignals] = hdlshiftregister(input, output, loaden, [], outvld, start, 'deserializer', shiftmode, initValue, processName);
end
