function helpFrame = getHelpFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    helptext.Type = 'text';
    helptext.Name = 'Design an inverse-sinc lowpass filter.';
    helptext.Tag = 'HelpText';
    helptext.WordWrap = true;
    % 11 13
    helpFrame.Type = 'group';
    helpFrame.Name = getDialogTitle(this);
    helpFrame.Items = cellhorzcat(helptext);
    helpFrame.Tag = 'HelpFrame';
end % function
