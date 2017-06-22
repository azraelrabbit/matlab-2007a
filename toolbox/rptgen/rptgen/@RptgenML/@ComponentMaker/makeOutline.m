function makeOutline(cm)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    fName = 'getOutlineString.m';
    fid = cm.openFile(fName);
    % 8 11
    % 9 11
    fprintf(fid, 'function olstring=getOutlineString(thisComp)\n');
    fprintf(fid, '%% GETOUTLINESTRING Return the string used in the Explorer hierarchy\n');
    fprintf(fid, '%%   OLSTRING=GETOUTLINESTRING(THISCOMP) Returns a single-line string\n');
    fprintf(fid, '%%    which displays important information about the component.  This\n');
    fprintf(fid, '%%    string is displayed in the hierarchy of the Report Explorer.\n');
    fprintf(fid, '%% \n');
    fprintf(fid, '%%   THISCOMP is the component being described.\n');
    fprintf(fid, '%%   OLSTRING is the descriptive string.\n');
    fprintf(fid, '%% \n');
    fprintf(fid, '%%   See also GETNAME\n');
    fprintf(fid, '%% \n\n');
    % 21 23
    cm.writeHeader(fid);
    % 23 26
    % 24 26
    fprintf(fid, '%% *********************************************************************\n');
    fprintf(fid, '%% * By default, GETOUTLINESTRING returns the display name of the      *\n');
    fprintf(fid, '%% * component.                                                        *\n');
    fprintf(fid, '%% *                                                                   *\n');
    fprintf(fid, '%% * The string should be less than 32 characters long.                *\n');
    fprintf(fid, '%% *********************************************************************\n\n');
    % 31 33
    fprintf(fid, 'olstring = getName(thisComp);\n\n');
    % 33 35
    fprintf(fid, '%% *********************************************************************\n');
    fprintf(fid, '%% * The string can be customized to show additional                   *\n');
    fprintf(fid, '%% * information about the component, such as the state of its         *\n');
    fprintf(fid, '%% * properties.                                                       *\n');
    fprintf(fid, '%% *                                                                   *\n');
    fprintf(fid, '%% * The TRUNCATESTRING function converts any data type into a single  *\n');
    fprintf(fid, '%% * line string. The second argument is the return value if the       *\n');
    fprintf(fid, '%% * data is empty.  The third argument is the maximum allowed size    *\n');
    fprintf(fid, '%% * of the resulting string.                                          *\n');
    fprintf(fid, '%% *********************************************************************\n\n');
    % 44 46
    fprintf(fid, 'cInfo = '''';\n\n');
    thisProp = cm.down;
    while not(isempty(thisProp))
        writeOutline(thisProp, fid);
        thisProp = thisProp.right;
    end % while
    % 51 53
    fprintf(fid, '%% *********************************************************************\n');
    fprintf(fid, '%% * The string typically uses a dash ("-") as a separator between the *\n');
    fprintf(fid, '%% * name and additional component information.                        *\n');
    fprintf(fid, '%% *********************************************************************\n\n');
    fprintf(fid, 'if ~isempty(cInfo)\n   olstring = [olstring,'' - '',cInfo];\nend\n\n');
    % 57 59
    fclose(fid);
    % 59 61
    cm.viewFile(fName, 1.0);
    % 61 64
    % 62 64
    if not(isempty(cm.v1OutlinestringFile)) && eq(exist(cm.v1OutlinestringFile, 'file'), 2.0)
        % 64 66
        [oDir, oFile, oExt] = fileparts(cm.v1OutlinestringFile);
        newFile = fullfile(cm.ClassDir, horzcat(oFile, '.old'));
        try
            copyfile(cm.v1OutlinestringFile, newFile, 'f');
            cm.viewFile(horzcat(oFile, '.old'));
        catch
            cm.ErrorMessage = lasterr;
        end % try
    end % if
function writeOutline(thisProp, fid)
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    switch thisProp.DataTypeString
    case 'bool'
        % 81 83
        fprintf(fid, 'if thisComp.%s  %% %s\n    p%s = ''true'';\nelse\n    p%s = ''false'';\nend\n\n', thisProp.PropertyName, thisProp.Description, thisProp.PropertyName, thisProp.PropertyName);
        % 84 88
        % 85 88
        % 86 88
    case '!ENUMERATION'
        % 87 89
        fprintf(fid, 'switch thisComp.%s %% %s\n', thisProp.PropertyName, thisProp.Description);
        nameCount = length(thisProp.EnumNames);
        for i=1.0:length(thisProp.EnumValues)
            if ge(nameCount, i)
                eName = thisProp.EnumNames{i};
            else
                eName = thisProp.EnumValues{i};
            end % if
            % 96 98
            fprintf(fid, '    case ''%s'' \n       p%s = ''%s'';\n', thisProp.EnumValues{i}, thisProp.PropertyName, strrep(eName, '''', ''''''));
            % 98 102
            % 99 102
            % 100 102
        end % for
        % 102 104
        fprintf(fid, '    otherwise\n        p%s = ''<unknown>'';\nend\n\n', thisProp.PropertyName);
    otherwise
        % 105 109
        % 106 109
        % 107 109
        % 108 110
        fprintf(fid, 'p%s = rptgen.truncateString(thisComp.%s,''<empty>'',16);  %% %s;\n\n', thisProp.PropertyName, thisProp.PropertyName, thisProp.Description);
        % 110 112
    end % switch
