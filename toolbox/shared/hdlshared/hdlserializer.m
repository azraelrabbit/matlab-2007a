function [hdlbody, hdlsignals] = hdlserializer(input, output, loaden, shiftmode, outvld, initValue, processName)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    output_sltype = hdlsignalsltype(output);
    [output_size, outbp, outsigned] = hdlwordsize(output_sltype);
    input_sltype = hdlsignalsltype(input);
    [input_size, inbp, insigned] = hdlwordsize(input_sltype);
    if (gt(output_size, 1.0)) | (lt(input_size, 2.0))
        error('The input for a serilaizer should have more than 1 bit, and the output should be one bit.');
    end
    % 21 23
    if lt(nargin, 4.0)
        error('The first four argument should be specified to be able to generate serializer')
    else
        if eq(nargin, 4.0)
            outvld = [];
            initValue = 0.0;
            processName = 'SERIALIZER';
        else
            if eq(nargin, 5.0)
                initValue = 0.0;
                processName = 'SERIALIZER';
            else
                if eq(nargin, 6.0)
                    processName = 'SERIALIZER';
                else
                    if gt(nargin, 7.0)
                        error('Too many arguments are specified')
                    end
                end
            end
        end
    end
    [hdlbody, hdlsignals] = hdlshiftregister(input, output, loaden, [], outvld, [], 'serializer', shiftmode, initValue, processName);
end
