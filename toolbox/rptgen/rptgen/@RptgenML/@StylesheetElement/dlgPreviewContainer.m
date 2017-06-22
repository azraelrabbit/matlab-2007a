function dlgStruct = dlgPreviewContainer(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgText(this.dlgUpdatePreview, 'Tag', 'XmlPreview', 'WordWrap', 1.0))), xlate('Preview'), varargin{:});
    % 8 12
    % 9 12
    % 10 12
    % 11 12
end % function
