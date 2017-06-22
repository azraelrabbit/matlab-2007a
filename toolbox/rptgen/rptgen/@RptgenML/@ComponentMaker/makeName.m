function makeName(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fName = 'getName.m';
    fid = h.openFile(fName);
    % 9 11
    % 10 11
    fprintf(fid, 'function compName=getName(thisComp)\n');
    fprintf(fid, '%%GETNAME Declare the component''s display name\n');
    fprintf(fid, '%%  NAME = COMPONENT.GETNAME returns the name of the\n');
    fprintf(fid, '%%    component in the options palette.\n');
    fprintf(fid, '%%    \n');
    fprintf(fid, '%%  Note that this method does not control the the \n');
    fprintf(fid, '%%  component name as displayed in the Report Explorer\n');
    fprintf(fid, '%%  hierarchy, which can change to reflect component\n');
    fprintf(fid, '%%  property settins.  See also GETOUTLINESTRING\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%  This method is static and does not change \n');
    fprintf(fid, '%%  depending on component properties.\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%  Note that NAME information is duplicated in\n');
    fprintf(fid, '%%  the file ../rptcomps2.xml.  Any changes here should\n');
    fprintf(fid, '%%  be updated there as well.\n\n');
    % 27 29
    % 28 29
    h.writeHeader(fid);
    % 30 32
    % 31 32
    fprintf(fid, 'compName=''%s'';\n', strrep(h.DisplayName, '''', ''''''));
    % 33 35
    % 34 35
    fclose(fid);
    % 36 38
    % 37 38
    h.viewFile(fName, 2.0);
end % function
