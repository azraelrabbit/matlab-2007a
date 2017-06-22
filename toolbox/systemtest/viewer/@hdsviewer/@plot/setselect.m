function setselect(this, gridpt)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 7 9
    for k=1.0:length(this.Waves)
        this.waves(k).view.setselect(gridpt)
    end % for
