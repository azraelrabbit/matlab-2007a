function strHyperLink = createLinkMsg(handle, displayString)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    strHyperLink = sprintf('<a href="matlab: com.mathworks.toolbox.systemtest.test.TestManager.getTestManager.setSelection(''%s'')">%s</a>', handle, displayString);
end % function
