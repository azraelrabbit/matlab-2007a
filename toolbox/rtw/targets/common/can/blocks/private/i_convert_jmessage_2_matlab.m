function message = i_convert_jmessage_2_matlab(j_message)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    message = i_bean2struct(j_message, {'dataIsExternal','DbFilePath','id','idType','length','messageName'});
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if eq(j_message.getSize, 0.0)
        message.signals = [];
    end % if
    % 21 22
    for i=1.0:j_message.getSize
        signal = j_message.getElementAt(minus(i, 1.0));
        message.signals.signal(i) = i_bean2struct(signal, {'byteLayout','dataType','factor','length','modeValue','name','offset','physicalUnit','signalType','startBit'});
        % 25 36
        % 26 36
        % 27 36
        % 28 36
        % 29 36
        % 30 36
        % 31 36
        % 32 36
        % 33 36
        % 34 36
        % 35 36
    end % for
end % function
