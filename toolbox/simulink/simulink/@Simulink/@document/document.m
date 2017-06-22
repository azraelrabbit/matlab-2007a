function this = document(fullDocumentName, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = Simulink.document;
    % 8 9
    if exist(fullDocumentName, 'file')
        this.documentName = fullDocumentName;
        if gt(nargin, 1.0)
            this.displayLabel = varargin{1.0};
        end % if
        dirInfo = dir(this.documentName);
        this.Modified = dirInfo.date;
        this.Size = dirInfo.bytes;
        if gt(nargin, 2.0)
            this.generateBacklink = varargin{2.0};
        end % if
    else
        disp(horzcat('RTW Code Browser: Invalid file name: ', fullDocumentName));
    end % if
end % function
