function makeViewHelp(thisCM)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fileName = 'viewHelp';
    fid = thisCM.openFile(horzcat(fileName, '.m'));
    % 9 10
    fprintf(fid, 'function %s(thisComp)\n%%%s Opens a help viewer for the component\n', fileName, upper(fileName));
    % 11 13
    % 12 13
    thisCM.writeHeader(fid);
    % 14 15
    fprintf(fid, 'pkgDir = what(''@%s'');\n', thisCM.PkgName);
    fprintf(fid, 'if ~isempty(pkgDir)\n');
    fprintf(fid, '    helpFile = fullfile(pkgDir(1).path,''@%s'',''_help.html'');\n', thisCM.ClassName);
    fprintf(fid, '    helpview(helpFile);\n');
    fprintf(fid, 'else\n');
    fprintf(fid, '    error(''rptgen:NoHelpFile'',''Could not find help file'');\n');
    fprintf(fid, 'end\n');
    % 22 23
    helpFile = strrep(fullfile(thisCM.ClassDir, '_help.html'), '''', '''''');
    % 24 26
    % 25 26
    fprintf(fid, '\n%% (optional) Call help with a mapfile\n%% For more information on mapfiles, type HELP HELPVIEW\n');
    fprintf(fid, '%% helpview(fullfile(matlabroot,''custom_mapfile.map''),[''obj.'',class(thisCM)]);\n');
    fprintf(fid, '%% Add a line to your mapfile:\n%% obj.%s.%s   %s\n', thisCM.PkgName, thisCM.ClassName, helpFile);
    % 29 30
    fclose(fid);
    % 31 32
    thisCM.viewFile(horzcat(fileName, '.m'), 3.0);
end % function
