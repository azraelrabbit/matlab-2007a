function writeAllScripts(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if this.GenerateCompileDoFile
        this.writeCompileDoFile;
    end % if
    % 11 12
    if this.GenerateSimDoFile
        this.writeSimDoFile;
    end % if
    % 15 16
    if this.GenerateSimProjectFile
        this.writeSimProjFile;
    end % if
    % 19 20
    if this.GenerateSynthesisFile
        this.writeSynthesisFile;
    end % if
    % 23 24
    if this.GenerateMapFile
        this.writeMapFile;
    end % if
end % function
