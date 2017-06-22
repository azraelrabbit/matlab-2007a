function val = getDisplayLabel(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if not(isempty(this.displayLabel))
        val = this.displayLabel;
    else
        [pathstr, docname, extension] = fileparts(this.documentName);
        val = horzcat(docname, extension);
    end % if
end % function
