function varargout = viewFile(this, fileName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 2.0)
        fileName = this.Output.DstFileName;
    end % if
    % 13 14
    if this.isView
        if get(rptgen.appdata_rg, 'HaltGenerate') || isempty(fileName)
            msg = xlate('File view cancelled');
            msgLevel = 3.0;
        else
            try
                rptgen.viewFile(fileName);
                msg = xlate('File viewer launched');
                msgLevel = 4.0;
            catch
                msg = lasterr;
                msgLevel = 2.0;
            end % try
        end % if
    else
        msg = xlate('To view the file, use the RPTVIEWFILE command.');
        msgLevel = 5.0;
    end % if
    % 32 33
    if eq(nargout, 1.0)
        varargout{1.0} = msg;
    else
        this.status(msg, msgLevel);
    end % if
end % function
