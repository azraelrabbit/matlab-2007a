function dlgstruct = getDialogSchema(this, name)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    item1.RowSpan = [2.0 10.0];
    item1.ColSpan = [1.0 1.0];
    % 8 9
    if isempty(this.URL)
        % 10 11
        item1.Type = 'textbrowser';
        item1.Text = Constructhtml(this);
    else
        % 14 16
        % 15 16
        item1.Type = 'textbrowser';
        item1.FilePath = this.URL;
    end % if
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    dlgstruct.DialogTitle = 'Model Advisor';
    dlgstruct.Items = cellhorzcat(item1);
    dlgstruct.HelpMethod = 'helpview([docroot ''/mapfiles/simulink.map''],''model_advisor'')';
end % function
function htmltext = Constructhtml(this)
    % 28 29
    htmltext = '';
    htmltext = horzcat(htmltext, '<h3 align="center">Model Advisor </h3>');
    htmltext = horzcat(htmltext, '<h4 align="left">The Model Advisor analyzes your model to ensure that you best utilize ');
    % 32 33
    htmltext = horzcat(htmltext, 'Simulink for simulation and code generation. ');
    htmltext = horzcat(htmltext, '&nbsp;&nbsp;You can select specific checks and generate a report with detailed information. This is particularly  ');
    htmltext = horzcat(htmltext, 'useful early in the design cycle. </h4> ');
    htmltext = horzcat(htmltext, '<a href="matlab: modeladvisor ', this.getFullName, '">Start Model Advisor... </a>');
end % function
