function dlgStruct = dlgHelpContainer(this, varargin)
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
    % 15 16
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgText(sprintf('This option specifies page header/footer content and placement.  The "Value (XML)" field is XML code which specifies the text or graphics to appear in the header or footer.  The "Condition" field controls where and on what type of pages the content is used.'), 'WordWrap', 1.0))), xlate('Help'), varargin{:});
    % 17 20
    % 18 20
    % 19 20
end % function
