function table = hdlgetsignaltable
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisfiltercoder
        % 8 9
        table = hdlshared.HDLEntitySignalTable;
    else
        % 11 15
        % 12 15
        % 13 15
        % 14 15
        if hdlisbeta2
            error(horzcat('Unexpected HDL Coder call to ', mfilename));
        end % if
        % 18 19
        hDriver = hdlcurrentdriver;
        table = hDriver.HDLSymbolTable;
        % 21 22
    end % if
end % function
