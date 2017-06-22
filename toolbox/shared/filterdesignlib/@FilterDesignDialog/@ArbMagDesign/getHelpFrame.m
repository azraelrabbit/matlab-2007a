function helpFrame = getHelpFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    help_str = sprintf('%s%s', 'Design an arbitrary response filter.  The constraint can be on the ', 'magnitude only, or on the magnitude and the phase.');
    % 8 12
    % 9 12
    % 10 12
    helptext.Type = 'text';
    helptext.Name = help_str;
    helptext.Tag = 'HelpText';
    helptext.WordWrap = true;
    % 15 17
    helpFrame.Type = 'group';
    helpFrame.Name = getDialogTitle(this);
    helpFrame.Items = cellhorzcat(helptext);
    helpFrame.Tag = 'HelpFrame';
end % function
