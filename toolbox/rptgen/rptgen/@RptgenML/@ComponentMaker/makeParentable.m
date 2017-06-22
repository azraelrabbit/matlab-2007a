function makeParentable(thisCM)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fid = thisCM.openFile('getParentable.m');
    % 8 9
    fprintf(fid, 'function p = getParentable(thisComp)\n%%GETPARENTABLE tells whether or not the component can have children\n');
    % 10 11
    thisCM.writeHeader(fid);
    % 12 13
    if thisCM.Parentable
        fprintf(fid, 'p = true;\n');
    else
        fprintf(fid, 'p = false;\n');
    end % if
    % 18 19
    fclose(fid);
    % 20 21
    thisCM.viewFile('getParentable.m', 2.0);
end % function
