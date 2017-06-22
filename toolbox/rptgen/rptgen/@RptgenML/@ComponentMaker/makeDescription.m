function makeDescription(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fName = 'getDescription.m';
    fid = h.openFile(fName);
    % 9 10
    fprintf(fid, 'function compDesc=getDescription(thisComp)\n');
    fprintf(fid, '%%GETDESCRIPTION Return a short description of the component\n');
    fprintf(fid, '%%  DESC = COMPONENT.GETDESCRIPTION returns a short description\n');
    fprintf(fid, '%%    of the component for display in help.\n');
    fprintf(fid, '%%    \n');
    fprintf(fid, '\n');
    fprintf(fid, '%%  This method is static and does not change \n');
    fprintf(fid, '%%  depending on component properties.\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%  The description should be between one and three sentences.\n');
    % 20 21
    h.writeHeader(fid);
    % 22 24
    % 23 24
    fprintf(fid, 'compDesc = ''%s'';\n', strrep(h.Description, '''', ''''''));
    % 25 27
    % 26 27
    fclose(fid);
    % 28 29
    h.viewFile(fName, 2.0);
end % function
