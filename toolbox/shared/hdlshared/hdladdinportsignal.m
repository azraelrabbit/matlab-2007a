function hdladdinportsignal(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        error(horzcat('Unexpected HDL Coder call to ', mfilename));
    end % if
    % 10 11
    signalTable = hdlgetsignaltable;
    signalTable.checkSignalIndices(idx);
    signalTable.addInportSignal(idx);
end % function
