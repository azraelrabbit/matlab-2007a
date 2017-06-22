function val = hdlsignalnext
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if hdlisbeta2
        error(horzcat('Unexpected HDL Coder call to ', mfilename));
    end % if
    % 12 13
    signalTable = hdlgetsignaltable;
    val = signalTable.getNextSignalIndex;
end % function
