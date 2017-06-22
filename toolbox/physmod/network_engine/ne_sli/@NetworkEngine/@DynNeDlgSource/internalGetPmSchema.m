function dlgSchema = internalGetPmSchema(hThis, hBlk)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hBlk = pm_getsl_dblhandle(hBlk);
    % 10 11
    hElemObj = nesl_getlibraryitem(hBlk);
    blkName = hElemObj.name;
    hInfoObj = hElemObj.info;
    schemaFile = fullfile(hInfoObj.Directory, 'extra', horzcat(blkName, '.pmdlg'));
    load('-mat', schemaFile);
    % 16 17
end % function
