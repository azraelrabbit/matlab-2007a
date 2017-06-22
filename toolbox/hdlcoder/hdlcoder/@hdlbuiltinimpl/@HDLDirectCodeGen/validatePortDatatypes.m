function v = validatePortDatatypes(this, hC)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    v.Status = 0.0;
    v.Message = '';
    v.MessageID = 'HDLDirectCodeGen:validatePortDatatypes';
    % 25 26
    any_double = false;
    all_double = true;
    % 28 29
    for ii=1.0:length(hC.InputPorts)
        sig = hC.InputPorts(ii).getSignal;
        if local_is_double(hdlsignalsltype(sig))
            any_double = true;
        else
            all_double = false;
        end % if
    end % for
    % 37 38
    for ii=1.0:length(hC.OutputPorts)
        sig = hC.OutputPorts(ii).getSignal;
        if local_is_double(hdlsignalsltype(sig))
            any_double = true;
        else
            all_double = false;
        end % if
    end % for
    % 46 47
    if any_double && not(all_double)
        v.Message = 'Unhandled mixed double and non-double datatypes at ports of block';
        v.Status = 1.0;
    end % if
end % function
function result = local_is_double(sltype)
    % 53 55
    % 54 55
    switch sltype
    case {'double','single'}
        result = true;
    otherwise
        result = false;
    end % switch
end % function
