function privateadddesktopfilestoproject(projfilename, fname)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if not(usejava('jvm'))
        error('SimBiology:SBIOSAVEPROJECT_NOJVM', 'SBIOSAVEPROJECT requires Java.');
    end % if
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    import java.io.*;
    import java.util.zip.*;
    import com.mathworks.mlwidgets.io.InterruptibleStreamCopier;
    % 25 28
    % 26 28
    inputZipFile = java.util.zip.ZipFile(projfilename);
    % 28 31
    % 29 31
    tempfilename = horzcat(tempname, '.sbproj');
    tempfile = java.io.File(tempfilename);
    try
        fileOutputStream = java.io.FileOutputStream(tempfile);
    catch
        error('SimBiology:PRIVATEADDDESKTOPFILESTOPROJECT_CANT_OPEN', 'Could not open "%s" for writing.', tempfilename);
    end % try
    projOutputStream = java.util.zip.ZipOutputStream(fileOutputStream);
    % 38 41
    % 39 41
    interruptibleStreamCopier = com.mathworks.mlwidgets.io.InterruptibleStreamCopier.getInterruptibleStreamCopier;
    % 41 45
    % 42 45
    % 43 45
    enumeration = inputZipFile.entries;
        while enumeration.hasMoreElements
        % 46 49
        % 47 49
        zipEntry = enumeration.nextElement;
        inputStream = inputZipFile.getInputStream(zipEntry);
        % 50 52
        projOutputStream.putNextEntry(zipEntry);
        interruptibleStreamCopier.copyStream(inputStream, projOutputStream);
    end % while
    % 54 57
    % 55 57
    privateaddtoprojectfile(fname, projOutputStream);
    % 57 60
    % 58 60
    projOutputStream.close;
    fileOutputStream.close;
    inputZipFile.close
    % 62 65
    % 63 65
    try
        copyfile(tempfilename, projfilename);
    catch
        error('SimBiology:PRIVATEADDDESKTOPFILESTOPROJECT_CANT_COPY', 'Could not open "%s" for writing.', projfilename);
    end % try
    % 69 72
    % 70 72
    privatedeletefile(tempfilename);
    return;
