function [newName, originalName] = privategetdesktopfiles(projfilename, filetoload)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if not(ischar(projfilename))
        error('SimBiology:PRIVATEGETDESKTOPFILES', 'The argument must be a name of the project file');
        % 15 17
    end % if
    % 17 20
    % 18 20
    [locpath, locname, projFilenameExt] = fileparts(projfilename);
    if isempty(projFilenameExt)
        projfilename = horzcat(projfilename, '.sbproj');
    end % if
    if isempty(locpath)
        projfilename = horzcat(pwd, filesep, projfilename);
    end % if
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    if not(usejava('jvm'))
        error('SimBiology:PRIVATEGETDESKTOPFILES_NOJVM', 'SBIOLOADPROJECT requires Java.');
    end % if
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    import java.io.*;
    import java.util.zip.*;
    import com.mathworks.mlwidgets.io.InterruptibleStreamCopier;
    % 40 43
    % 41 43
    if not(exist(projfilename, 'file'))
        error('SimBiology:PRIVATEGETDESKTOPFILES_CANT_OPEN', 'File "%s" does not exist.', projfilename);
        % 44 46
    end % if
    % 46 48
    try
        zipFile = java.util.zip.ZipFile(projfilename);
    catch
        error('SimBiology:PRIVATEGETDESKTOPFILES_CANT_OPEN', 'Error opening project file ''%s''.', projfilename);
        % 51 53
    end % try
    % 53 56
    % 54 56
    newName = {};
    originalName = {};
    % 57 60
    % 58 60
    interruptibleStreamCopier = com.mathworks.mlwidgets.io.InterruptibleStreamCopier.getInterruptibleStreamCopier;
    % 60 64
    % 61 64
    % 62 64
    enumeration = zipFile.entries;
    % 64 66
        while enumeration.hasMoreElements
        % 66 68
        zipEntry = enumeration.nextElement;
        % 68 71
        % 69 71
        inputStream = zipFile.getInputStream(zipEntry);
        % 71 74
        % 72 74
        fullfileName = char(zipEntry.getName);
        [filePath, fileName, fileExt] = fileparts(fullfileName);
        fileName = horzcat(fileName, fileExt);
        % 76 78
        if not(isempty(regexp(fileName, filetoload, 'match')))
            % 78 80
            desktopfilename = horzcat(tempname, '.mat');
            fileobj = java.io.File(desktopfilename);
            try
                fileOutputStream = java.io.FileOutputStream(fileobj);
            catch
                error('SimBiology:PRIVATEGETDESKTOPFILES_CANT_OPEN', 'Could not create "%s".', desktopfilename);
                % 85 87
            end % try
            % 87 90
            % 88 90
            interruptibleStreamCopier.copyStream(inputStream, fileOutputStream);
            fileOutputStream.close;
            % 91 94
            % 92 94
            originalName{plus(end, 1.0)} = fileName;
            newName{plus(end, 1.0)} = desktopfilename;
        end % if
    end % while
    % 97 100
    % 98 100
    zipFile.close;
