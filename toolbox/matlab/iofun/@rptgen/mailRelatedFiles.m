function mailRelatedFiles(fileRoot, to, subject, message, attachments)
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
    if lt(nargin, 2.0)
        error('Specify a mail recipient');
    end % if
    % 18 20
    zipFile = rptgen.zipRelatedFiles(fileRoot);
    [zDir, zFile, zExt] = fileparts(zipFile);
    % 21 23
    if lt(nargin, 5.0)
        attachments = cellhorzcat(zipFile);
    else
        attachments{plus(end, 1.0)} = zipFile;
    end % if
    % 27 29
    if lt(nargin, 4.0)
        message = horzcat('This message includes a document created by the ', 'MathWorks Report Generator.  Unzip the attached file ("', zFile, zExt, '") to view the report.');
        % 30 33
        % 31 33
    end % if
    % 33 35
    if lt(nargin, 3.0)
        subject = sprintf('%s (Report Generator)', zFile);
    end % if
    % 37 40
    % 38 40
    sendmail(to, subject, message, attachments);
