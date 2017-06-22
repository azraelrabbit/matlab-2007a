function this = HDLEntitySignalTable(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent hdlEntitySignalTableInstance;
    % 7 9
    if isempty(hdlEntitySignalTableInstance)
        hdlEntitySignalTableInstance = hdlshared.HDLEntitySignalTable;
    end
    % 11 13
    this = hdlEntitySignalTableInstance;
end
