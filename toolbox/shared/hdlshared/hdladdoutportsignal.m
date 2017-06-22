function hdladdoutportsignal(idx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        error(horzcat('Unexpected HDL Coder call to ', mfilename));
    end % if
    % 11 12
    signalTable = hdlgetsignaltable;
    signalTable.checkSignalIndices(idx);
    signalTable.addOutportSignal(idx);
end % function
