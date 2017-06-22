function destroy(hFDA)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hComps = allchild(hFDA);
    delete(hComps);
    % 12 14
    % 13 14
    delete(hFDA.Listeners);
    % 15 16
    delete(hFDA.FigureHandle);
    delete(hFDA);
end % function
