function initialize(h)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    import java.net.*;
    import java.io.IOException;
    % 11 13
    vtable = {'0.9.3','0.9.8','0.9.9','0.9.10'};
    % 13 15
    h.FGIdx = uint8(strmatch(h.FlightGearVersion, vtable, 'exact'));
    try
        % 16 18
        h.FGDest = java.net.InetAddress.getByName(h.DestinationIpAddress);
    catch
        warning('Aero:FlightGearAnimation:noIPAddressFound', 'IP Address %s could not be found', h.DestinationIpAddress);
        % 20 22
    end % try
    % 22 24
    if isempty(h.FGSocket) || h.FGSocket.isClosed()
        % 24 26
        h.FGSocket = java.net.DatagramSocket;
    end % if
