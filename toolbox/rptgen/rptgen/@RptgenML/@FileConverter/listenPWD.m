function listenPWD(this, isListen)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0) || isListen
        if isempty(this.DirectoryListener)
            % 8 10
            this.DirectoryListener = com.mathworks.toolbox.rptgen.tools.DirectoryListener('RptgenML.FileConverter.listFiles(''-force'');');
        else
            % 11 13
            this.DirectoryListener.activate;
        end % if
    else
        if not(isempty(this.DirectoryListener))
            this.DirectoryListener.deactivate;
        end % if
    end % if
