function newplot(this, plotclass, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 7 10
    % 8 10
    if not(isempty(this.Splash))
        close(this.Splash(ishandle(this.Splash)))
        this.Splash = [];
    end % if
    % 13 16
    % 14 16
    this.PlotPropertyEditor.newplot(plotclass, this, varargin{:});
