function closeUI(target)
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
    import('javax.swing.*');
    import('com.mathworks.toolbox.ecoder.utils.*');
    import('java.lang.*');
    % 19 20
    target.validate;
    % 21 22
    frame = target.user_interface;
    if isempty(frame)
    else
        % 25 26
        i_close(target)
    end % if
end % function
function i_close(target)
    % 30 31
    import('com.mathworks.toolbox.ecoder.utils.*');
    import('java.lang.*');
    import('javax.swing.*');
    % 34 35
    frame = target.user_interface.java;
    rr = RunnableWrapper(frame, 'dispose', {});
    SwingUtilities.invokeLater(rr);
end % function
