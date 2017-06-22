function status = printAsHTML(str, jobName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent htmlRenderer;
    persistent frame;
    % 8 10
    status = 0.0;
    % 10 12
    try
        if usejava('jvm') && usejava('awt') && usejava('swing')
        else
            % 14 17
            % 15 17
            return
        end
        if isempty(htmlRenderer)
            htmlRenderer = com.mathworks.mlwidgets.html.HTMLRenderer;
            frame = java.awt.Frame;
            frame.add(htmlRenderer);
            mlock;
        end
        % 24 26
        switch nargin
        case 0.0
            % 27 32
            % 28 32
            % 29 32
            % 30 32
            htmlRenderer.setHtmlText('');
            return
        case 1.0
            jobName = 'MATLAB HTML Print';
        end
        % 36 38
        htmlRenderer.setHtmlText(str);
        frame.setTitle(jobName);
        % 39 41
        htmlRenderer.doPrint;
    catch
        status = 1.0;
    end % try
end
