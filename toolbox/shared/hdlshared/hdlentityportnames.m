function portnames = hdlentityportnames
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    ports = horzcat(hdlinportsignals, hdloutportsignals);
    % 8 9
    portnames = {};
    for n=1.0:length(ports)
        portnames{plus(end, 1.0)} = hdlsignalname(ports(n));
    end % for
end % function
