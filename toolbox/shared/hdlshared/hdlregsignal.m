function hdlregsignal(signal)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        signal.Reg = true;
    else
        if hdlgetparameter('isverilog') && not(hdlisinportsignal(signal)) && not(hdlisoutportsignal(signal))
            vtype = hdlsignalvtype(signal);
            if strcmp(vtype(1.0:4.0), hdlgetparameter('base_data_type'))
                hdlsignalsetvtype(signal, horzcat(hdlgetparameter('reg_data_type'), vtype(5.0:end)));
            end % if
        end % if
    end % if
end % function
