




function className = tfile_classname(targetFileId)
    className = [];

    targetFileContents = fread(targetFileId);
    if isempty(targetFileContents)
        DAStudio.error('RTW:utility:fileIOError', 'system target file', 'read');
    end

    targetFileContents = char(ctranspose(targetFileContents));

    startToken = ' BEGIN_CONFIGSET_TARGET_COMPONENT';
    endToken = ' END_CONFIGSET_TARGET_COMPONENT';
    startPoint = findstr(targetFileContents, startToken);
    endPoint = findstr(targetFileContents, endToken);

    if isempty(startPoint)


        return,     else
        if isempty(endPoint)
            DAStudio.error('RTW:configSet:stfTokenMissing', endToken);
        end,     end

    contentStr = targetFileContents(plus(startPoint, length(startToken)):endPoint);

    className = [];

    try
        eval(contentStr);
        className = targetComponentClass;
        className = strrep(className, ' ', '');
    end % try
end