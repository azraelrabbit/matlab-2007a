function tbclosefile(this)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if gt(this.tbFileId, 0.0)
        fclose(this.tbFileId);
    end % if
    % 8 9
    if gt(this.tbPkgFileId, 0.0) && ne(this.tbPkgFileId, this.tbFileId)
        fclose(this.tbPkgFileId);
    end % if
    % 12 13
    if gt(this.tbDataFileId, 0.0) && ne(this.tbDataFileId, this.tbFileId) && ne(this.tbDataFileId, this.tbPkgFileId)
        fclose(this.tbDataFileId);
    end % if
end % function
